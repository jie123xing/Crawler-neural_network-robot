# -*- coding: utf-8 -*-
"""
Created on Mon Jul 15 14:15:32 2019

@author: admin
"""

from urllib.request import urlopen
import urllib
from bs4 import BeautifulSoup
import csv
import os
import requests
import re
import pymysql
import random
import json  

def getClassification():################获取全部图书分类信息
        resp=urlopen('http://category.dangdang.com/?ref=www-0-C')
        soup=BeautifulSoup(resp,'html.parser')
        ##############目录
        General_classification =soup.find('div',id='floor_1')
    
        Gclass,Sclass,sclassion=[],[],[]###总目录和分目录获取
        for i in General_classification:
            try:
                Gclass.append(i.a.string.encode('iso-8859-1').decode('gb2312'))####需要编码解码消除乱码
                Sclass.append(i.ul)
            except:
                Gclass.append('港台图书')###特殊处理
                Sclass.append(i.ul)  
                
        del Gclass[0];del Gclass[-1];del Sclass[0];del Gclass[-1] #####删除头尾无用部分  53-->51个数
        
        sclassion,sclassurl,lensclass=[],[],[] #####分目录名，url,每个分类的长度，调用时sclassion[x:x+1]
        for i in range(len(Gclass)):
            lensc=0    ###计数每个分类的个数
            for j in Sclass[i]:
                if j.a.string.encode('iso-8859-1').decode('gb2312')=='更多':
                     continue
                sclassion.append(j.a.string.encode('iso-8859-1').decode('gb2312'))
                sclassurl.append(j.a.get('href'))
                lensc+=1
            lensclass.append(lensc)        
            
        return Gclass,sclassion,sclassurl,lensclass
    
def getbookinfo(Gclass,sclassion,sclassurl,lensclass):################获取图书信息
        pivot=0###########标定位置，方便小分类分段截取
        books=1
        shelfpivot=['休闲/爱好','孕产/胎教','家庭/家居','科普读物','法文原版书','网络课程']
        for i in range(len(Gclass)):
            if Gclass[i] not in shelfpivot:#####去掉空,和数量较多的分类
                continue
            gclass=Gclass[i]            ####大分类49
            sclass=sclassion[pivot:pivot+lensclass[i]]######小分类679
            bookurl=sclassurl[pivot:pivot+lensclass[i]]   #######小分类url-679
            pivot+=lensclass[i] 
            
            if Gclass[i] in shelfpivot:
                bookshelf='%dshelf'%books
                books+=1
            #############  1----15-----15
            for _ in range(lensclass[i]):
                url=bookurl[_]
                html = requests.get(url)
                html.encoding = 'gb2312'
                soup = BeautifulSoup(html.text, 'html.parser')########对url进行处理 ，进入分类书籍页面
                book_title=soup.find_all('a',dd_name='单品图片')  #####为获取url集准备
                for i in book_title:
                    try:
                        resp=urlopen(i.get('href'))
                        soup=BeautifulSoup(resp,'html.parser')
                        booktitle=soup.find('h1').get('title')    #####进入具体某本书的页面
                        booktitle=booktitle[0:10]
                        bookdetail=soup.find('span',class_='head_title_name').get('title')
                        bookdetail=bookdetail[0:19]
                        bookprice=float(soup.find('p',id='dd-price').text[2:].strip())
                        author=soup.find('a',dd_name='作者').string
                        press=soup.find('a',dd_name='出版社').string
                        #publicationtime=soup.find_all('span',class_='t1')[2].text
                        #publicationtime=publicationtime[5:-1]
                        publicationtime=random.randint(-2000,2000)
                        bookdetailurl=i.get('href')
                        picurl=soup.find('img',id='largePic').get('src') 
                        path = 'images/'+bookshelf+'/' # 设置路径，也可设为相对路径
                        response = requests.get(picurl,timeout=5)
                        # 获取的文本实际上是图片的二进制文本
                        img = response.content
                        if img==None:
                            continue
                        bookinfo=[bookshelf,booktitle,publicationtime, author, press,bookprice,bookdetail,bookdetailurl]
    
                        writejson(bookinfo,gclass,sclass[_],path,img)
                    except:
                        pass
                #print('1次小循环')
            #print('大循环')
 
def writejson(bookinfo,Gclass,sclassion,path,img):

        Gclass,sclassion=Gclass.replace('/','-'),sclassion.replace('/','-')#####消除文件名中'/'
        #bookinfo.append(Gclass)
        #bookinfo.append(sclassion)
        #print(bookinfo)
        localpicurl=path+bookinfo[1]+'.jpg'
        bookdict={'bookshelf':bookinfo[0],'booktitle':bookinfo[1],
                  'publicationtime':bookinfo[2],'author':bookinfo[3],'press':bookinfo[4],
                  'bookprice':bookinfo[5],'bookdetail':bookinfo[6],
                  'Gclass':Gclass,'sclass':sclassion,'bookdetailurl':bookinfo[7],'localpicurl':localpicurl}
        #print(bookdict)
        
        try:
            
            # 判断目录是否存在
            if not os.path.exists(path):
                # 目录不存在创建，makedirs可以创建多级目录
                os.makedirs(path)
            with open(path+bookinfo[1]+'.jpg','wb') as fpic:
                fpic.write(img)
                #print('pic get')
                
            # 写入 JSON 数据
            with open(bookinfo[0]+'.json', 'a',encoding='utf-8') as f:
                json.dump(bookdict, f,ensure_ascii=False,indent=4)
                f.write(',')
                #print('保存成功')
        except Exception as e:
            print('保存失败', e,'booktitle:',bookinfo[1],'Gclass:',bookinfo[7],'sclass:',bookinfo[8])
              
            
if __name__=='__main__':
    
    Gclass,sclassion,sclassurl,lensclass=getClassification()#####50 679 679 50  ######length
    getbookinfo(Gclass,sclassion,sclassurl,lensclass)