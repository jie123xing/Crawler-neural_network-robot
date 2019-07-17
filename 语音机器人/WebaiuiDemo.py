#-*- coding: utf-8 -*-
import requests
import time
import hashlib
import base64

URL = "http://openapi.xfyun.cn/v2/aiui"
APPID = "5d2d8701"
API_KEY = "da32c2f11d2dd3a2026e6c6a6739ff3c"
AUE = "raw"
AUTH_ID = "3635838bdfb791f1f5a6cfa569caa02a"
DATA_TYPE = "audio"
SAMPLE_RATE = "16000"
SCENE = "main"
RESULT_LEVEL = "complete"
LAT = "39.938838"
LNG = "116.368624"
#个性化参数，需转义
PERS_PARAM = "{\\\"auth_id\\\":\\\"3635838bdfb791f1f5a6cfa569caa02a\\\"}"
#FILE_PATH = "bj_weather.wav"
FILE_PATH ='bj.txt'

def buildHeader():
    curTime = str(int(time.time()))
    param = "{\"result_level\":\""+RESULT_LEVEL+"\",\"auth_id\":\""+AUTH_ID+"\",\"data_type\":\""+DATA_TYPE+"\",\"sample_rate\":\""+SAMPLE_RATE+"\",\"scene\":\""+SCENE+"\",\"lat\":\""+LAT+"\",\"lng\":\""+LNG+"\"}"
    #使用个性化参数时参数格式如下：
    #param = "{\"result_level\":\""+RESULT_LEVEL+"\",\"auth_id\":\""+AUTH_ID+"\",\"data_type\":\""+DATA_TYPE+"\",\"sample_rate\":\""+SAMPLE_RATE+"\",\"scene\":\""+SCENE+"\",\"lat\":\""+LAT+"\",\"lng\":\""+LNG+"\",\"pers_param\":\""+PERS_PARAM+"\"}"
    
    paramBase64 = base64.b64encode(param.encode('utf-8'))

    m2 = hashlib.md5()
    m2.update((API_KEY + curTime + str(paramBase64,'utf-8')).encode('utf-8'))
    checkSum = m2.hexdigest()

    header = {
        'X-CurTime': curTime,
        'X-Param': paramBase64,
        'X-Appid': APPID,
        'X-CheckSum': checkSum,
    }
    return header

def readFile(filePath):
    binfile = open(filePath, 'rb')
    data = binfile.read()
    return data

r = requests.post(URL, headers=buildHeader(), data=readFile(FILE_PATH))
print(str(r.content,'utf-8'))