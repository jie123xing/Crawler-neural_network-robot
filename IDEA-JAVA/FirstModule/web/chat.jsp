<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
    <html>
    <head>
    <meta charset="utf-8">
    <script>
    var ssid=0;
    function txttowav(text123) {
    var robotresponse;
    ssid+=1;
    if (window.XMLHttpRequest)
    {
    // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
    robotresponse=new XMLHttpRequest();
    }
    else
    {
    // IE6, IE5 浏览器执行代码
    robotresponse=new ActiveXObject("Microsoft.XMLHTTP");
    }

    robotresponse.onreadystatechange=function()
    {
    if (robotresponse.readyState==4 && robotresponse.status==200)
    {
    var x=robotresponse.responseText;
    }
    }
    robotresponse.open("GET","getrobotresponse.jsp?text="+text123+"&ssid="+ssid,true);
    //xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
    robotresponse.send();
    }
    function loadXMLDoc() {
            var xmlhttp;
            if (window.XMLHttpRequest) {
                // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp = new XMLHttpRequest();
            } else {
                // IE6, IE5 浏览器执行代码
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    document.getElementById("myDiv").innerHTML += "我：" + document.getElementById("quest").value + "<br>"
                    document.getElementById("myDiv").innerHTML += "机器人：" + xmlhttp.responseText + "<br>";
                    txttowav(xmlhttp.responseText);
                    document.getElementById("quest").value = "";
                    document.getElementById("ceshi").innerHTML="jieshuf()"+"response\\"+String(ssid)+".wav";
                    var x = document.getElementById("myDiv");
                    x.scrollTop = x.scrollHeight;
                }
            }
            xmlhttp.open("GET", "robot.jsp?teststring=" + document.getElementById("quest").value, true);
            //xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send();
    }
    function xxx(){
        document.getElementById("myAudio").src="response\\"+String(ssid)+".wav";
    }
    </script>
    <title>智能应答</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
    </head>
    <body>
    <br>
    <br>
    <div class="max-height:60%">
    <div style="background-color:#A9A9A9">
    <h3 class="mx-auto col-md-3 text-white" >图灵机器人</h3>
    </div>
    <br>
    <div id="myDiv" class="col-md-10 offset-md-1 pre-scrollable" style="background-color:#ddd;height:60%;">

    </div>

    </div>
    <br>

    <div class="col-md-10 offset-md-1">
    <from>
    <div class="input-group mb-3">
    <input type="text" name="robotresponse"class="form-control" placeholder="输入" id="quest">
    <div class="input-group-append">
    <button class="btn btn-success" type="submit" onclick="loadXMLDoc()">发送</button>
        <button class="btn btn-success" type="submit" onclick="xxx()">语音播报</button>
    </div>
    </div>
    </from>
        <!--<div id="ceshi">
            ceshiyinpinqingkong
        </div>-->
    </div>
    <audio autoplay id="myAudio">
    <source src="response\\0.wav" type="audio/mpeg">
    </audio>
    <button class="btn btn-success" type="button" onclick="startRecording()">录音</button>
    <button class="btn btn-success" type="button" onclick="stopRecording()">停止</button>
    <button class="btn btn-success" type="button" onclick="cancelAudio()">取消</button>
    <button class="btn btn-success" type="button" onclick="down64()">上传</button>

    <script>
        /**
         * Created by chenhao on 8/25/16.
         */
//兼容
        window.URL = window.URL || window.webkitURL;
        //获取计算机的设备：摄像头或者录音设备
        navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;

        var HZRecorder = function (stream, config) {
            config = config || {};
            config.sampleBits = config.sampleBits || 8;      //采样数位 8, 16
            config.sampleRate = config.sampleRate || (44100/6);   //采样率(1/6 44100)

            //创建一个音频环境对象
            var audioContext = window.AudioContext || window.webkitAudioContext;
            var context = new audioContext();
            var audioInput = context.createMediaStreamSource(stream);
            // 第二个和第三个参数指的是输入和输出都是单声道,2是双声道。
            var recorder = context.createScriptProcessor(4096, 1, 1);

            var audioData = {
                size: 0          //录音文件长度
                , buffer: []     //录音缓存
                , inputSampleRate: context.sampleRate    //输入采样率
                , inputSampleBits: 16       //输入采样数位 8, 16
                , outputSampleRate: config.sampleRate    //输出采样率
                , outputSampleBits: config.sampleBits       //输出采样数位 8, 16
                , input: function (data) {
                    this.buffer.push(new Float32Array(data));
                    this.size += data.length;
                }
                , compress: function () { //合并压缩
                    //合并
                    var data = new Float32Array(this.size);
                    var offset = 0;
                    for (var i = 0; i < this.buffer.length; i++) {
                        data.set(this.buffer[i], offset);
                        offset += this.buffer[i].length;
                    }
                    //压缩
                    var compression = parseInt(this.inputSampleRate / this.outputSampleRate);
                    var length = data.length / compression;
                    var result = new Float32Array(length);
                    var index = 0, j = 0;
                    while (index < length) {
                        result[index] = data[j];
                        j += compression;
                        index++;
                    }
                    return result;
                }
                , encodeWAV: function () {
                    var sampleRate = Math.min(this.inputSampleRate, this.outputSampleRate);
                    var sampleBits = Math.min(this.inputSampleBits, this.outputSampleBits);
                    var bytes = this.compress();
                    var dataLength = bytes.length * (sampleBits / 8);
                    var buffer = new ArrayBuffer(44 + dataLength);
                    var data = new DataView(buffer);

                    var channelCount = 1;//单声道
                    var offset = 0;

                    var writeString = function (str) {
                        for (var i = 0; i < str.length; i++) {
                            data.setUint8(offset + i, str.charCodeAt(i));
                        }
                    }

                    // 资源交换文件标识符
                    writeString('RIFF'); offset += 4;
                    // 下个地址开始到文件尾总字节数,即文件大小-8
                    data.setUint32(offset, 36 + dataLength, true); offset += 4;
                    // WAV文件标志
                    writeString('WAVE'); offset += 4;
                    // 波形格式标志
                    writeString('fmt '); offset += 4;
                    // 过滤字节,一般为 0x10 = 16
                    data.setUint32(offset, 16, true); offset += 4;
                    // 格式类别 (PCM形式采样数据)
                    data.setUint16(offset, 1, true); offset += 2;
                    // 通道数
                    data.setUint16(offset, channelCount, true); offset += 2;
                    // 采样率,每秒样本数,表示每个通道的播放速度
                    data.setUint32(offset, sampleRate, true); offset += 4;
                    // 波形数据传输率 (每秒平均字节数) 单声道×每秒数据位数×每样本数据位/8
                    data.setUint32(offset, channelCount * sampleRate * (sampleBits / 8), true); offset += 4;
                    // 快数据调整数 采样一次占用字节数 单声道×每样本的数据位数/8
                    data.setUint16(offset, channelCount * (sampleBits / 8), true); offset += 2;
                    // 每样本数据位数
                    data.setUint16(offset, sampleBits, true); offset += 2;
                    // 数据标识符
                    writeString('data'); offset += 4;
                    // 采样数据总数,即数据总大小-44
                    data.setUint32(offset, dataLength, true); offset += 4;
                    // 写入采样数据
                    if (sampleBits === 8) {
                        for (var i = 0; i < bytes.length; i++, offset++) {
                            var s = Math.max(-1, Math.min(1, bytes[i]));
                            var val = s < 0 ? s * 0x8000 : s * 0x7FFF;
                            val = parseInt(255 / (65535 / (val + 32768)));
                            data.setInt8(offset, val, true);
                        }
                    } else {
                        for (var i = 0; i < bytes.length; i++, offset += 2) {
                            var s = Math.max(-1, Math.min(1, bytes[i]));
                            data.setInt16(offset, s < 0 ? s * 0x8000 : s * 0x7FFF, true);
                        }
                    }
                    return new Blob([data], { type: 'audio/wav' });
                }
            };

            //开始录音
            this.start = function () {
                audioInput.connect(recorder);
                recorder.connect(context.destination);
            }

            //停止
            this.stop = function () {
                recorder.disconnect();
            }

            //获取音频文件
            this.getBlob = function () {
                this.stop();
                return audioData.encodeWAV();
            }

            //回放
            this.play = function (audio) {
                audio.src = window.URL.createObjectURL(this.getBlob());
            }
            //清除
            this.clear = function(){
                audioData.buffer=[];
                audioData.size=0;
            }
            //上传
            this.upload = function (url, callback) {
                var fd = new FormData();
                fd.append("audioData", this.getBlob());
                var xhr = new XMLHttpRequest();
                if (callback) {
                    xhr.upload.addEventListener("progress", function (e) {
                        callback('uploading', e);
                    }, false);
                    xhr.addEventListener("load", function (e) {
                        callback('ok', e);
                    }, false);
                    xhr.addEventListener("error", function (e) {
                        callback('error', e);
                    }, false);
                    xhr.addEventListener("abort", function (e) {
                        callback('cancel', e);
                    }, false);
                }
                xhr.open("POST", url);
                xhr.send(fd);
            }

            //音频采集
            recorder.onaudioprocess = function (e) {
                audioData.input(e.inputBuffer.getChannelData(0));
                //record(e.inputBuffer.getChannelData(0));
            }

        };
        //抛出异常
        HZRecorder.throwError = function (message) {
            alert(message);
            throw new function () { this.toString = function () { return message; } }
        }
        //是否支持录音
        HZRecorder.canRecording = (navigator.getUserMedia != null);
        //获取录音机
        HZRecorder.get = function (callback, config) {
            if (callback) {
                if (navigator.getUserMedia) {
                    navigator.getUserMedia(
                        { audio: true } //只启用音频
                        , function (stream) {
                            var rec = new HZRecorder(stream, config);
                            callback(rec);
                        }
                        , function (error) {
                            switch (error.code || error.name) {
                                case 'PERMISSION_DENIED':
                                case 'PermissionDeniedError':
                                    HZRecorder.throwError('用户拒绝提供信息。');
                                    break;
                                case 'NOT_SUPPORTED_ERROR':
                                case 'NotSupportedError':
                                    HZRecorder.throwError('浏览器不支持硬件设备。');
                                    break;
                                case 'MANDATORY_UNSATISFIED_ERROR':
                                case 'MandatoryUnsatisfiedError':
                                    HZRecorder.throwError('无法发现指定的硬件设备。');
                                    break;
                                default:
                                    HZRecorder.throwError('无法打开麦克风。异常信息:' + (error.code || error.name));
                                    break;
                            }
                        });
                } else {
                    HZRecorder.throwErr('当前浏览器不支持录音功能。'); return;
                }
            }
        };
    </script>
    <script>

        var recorder;

        var audio = document.querySelector('audio');

        function startRecording() {
            HZRecorder.get(function (rec) {
                recorder = rec;
                recorder.start();
            });
        }

        function stopRecording() {
            recorder.stop();
        }

        function playRecording() {
            recorder.play(audio);
        }

        function cancelAudio(){
            recorder.stop();
            recorder.clear();
        }

        function down64() {
            //document.getElementById("blob").innerText=URL.createObjectURL(recorder.getBlob())
            var reader = new FileReader();
            reader.onloadend = function() {
                var t=reader.result;
                //alert(reader.result);
                //document.getElementById("blob1").innerText=reader.result+"*****"+typeof(reader.result);
                var xmlhttp;
                if (window.XMLHttpRequest)
                {
                    //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                    xmlhttp=new XMLHttpRequest();
                }
                else
                {
                    // IE6, IE5 浏览器执行代码
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function()
                {
                    if (xmlhttp.readyState==4 && xmlhttp.status==200)
                    {
                        document.getElementById("quest").value =xmlhttp.responseText;
                    }
                }
                xmlhttp.open("POST","audiototext.jsp",true);
                xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
                xmlhttp.send("t="+t);
            };
            reader.readAsDataURL(recorder.getBlob());
        }

        function uploadAudio() {
            recorder.upload("blob.jsp", function (state, e) {
                switch (state) {
                    case 'uploading':
                        //var percentComplete = Math.round(e.loaded * 100 / e.total) + '%';
                        break;
                    case 'ok':
                        alert(e.target.responseText);
                        alert("上传成功");
                        break;
                    case 'error':
                        alert("上传失败");
                        break;
                    case 'cancel':
                        alert("上传被取消");
                        break;
                }
            });
        }
    </script>
    </body>
    </html>