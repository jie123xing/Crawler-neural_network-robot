# -*- coding: utf-8 -*-
"""
Created on Sat Jun 22 21:55:37 2019

@author: jyx
"""

import torch
from torch.autograd import Variable
import torch.nn as nn
import torch.nn.functional as F

class Net(nn.Module):

    def __init__(self):
        #找到Net的父类，将其转换为父类，再调用自己的 __init__()
        super(Net,self).__init__()
        # in_channels,out_channels,kernel_size
        self.conv1 = nn.Conv2d(1,6,5)  #6,28,28
        self.conv2 = nn.Conv2d(6,16,5) #16,10,10
        #全连接层，y = wx + b
        self.fc1 = nn.Linear(16*5*5,120)
        self.fc2 = nn.Linear(120,84)
        self.fc3 = nn.Linear(84,10)
    # 定义好forward函数，backwa会被自动实现
    def forward(self, x):
        #最大池化 ,步幅是2*2
        x = F.max_pool2d(F.relu(self.conv1(x)),(2,2))#6,14,14
        #大小为正方形，则只能指定一个数字
        x = F.max_pool2d(F.relu(self.conv2(x)),2)    #16,5,5
        x = x.view(x.size(0),16*5*5)  #改变x的大小
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x

    def num_flat_features(self,x):
        size = x.size()[:1]
        num_features  = 1
        for s in size:
            num_features *=s
        return num_features
net = Net()
input = Variable(torch.randn(1,1,32,32))
output = net(input)
target = Variable(torch.arange(1,11))#假设的target :1,2,3,4,5,6,7,8,9,10
target = target.float()
criterion = nn.MSELoss()

loss = criterion(output,target)
print(loss)
