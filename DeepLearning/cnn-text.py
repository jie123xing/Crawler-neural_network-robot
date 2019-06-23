# -*- coding: utf-8 -*-
"""
Created on Sat Jun 22 21:10:46 2019

@author: jyx
"""

import torch

from torch import nn, optim

#import torch.nn.functional as F

from torch.autograd import Variable

from torch.utils.data import DataLoader

from torchvision import transforms

from torchvision import datasets

import numpy as np
#from logger import Logger


# In[3]:


# 定义超参数

batch_size = 5  ###only one barch

learning_rate = 1e-2

num_epoches = 20


# In[4]:


def to_np(x):

    return x.cpu().data.numpy()


# In[5]:

train_X=np.array([[0.129779 ,0.352941 ,0.245902 ,0.527273 ,0.666667 ,0.002290 ,0.000000 ,0.0],  
        [0.148893 ,0.367647 ,0.245902 ,0.527273 ,0.666667 ,0.003811 ,0.000000 ,0.0],
        [0.159960 ,0.426471 ,0.229508 ,0.545454 ,0.666667 ,0.005332 ,0.000000 ,0.0],
        [0.182093 ,0.485294 ,0.229508 ,0.563637 ,0.666667 ,0.008391 ,0.037037 ,0.0],
        [0.138833 ,0.485294 ,0.229508 ,0.563637 ,0.666667 ,0.009912 ,0.074074 ,0.0]],dtype=np.int64)
train_Y=np.array([0.148893 ,0.159960 ,0.182093 ,0.138833 ,0.109658],dtype=np.int64)

#dtype=np.float32
# In[4]:


train_X = train_X.reshape(-1,1, 1, 8)
#train_Y = train_Y.reshape(-1, 1)

train_x = torch.from_numpy(train_X)  #5,1,1,8
train_y = torch.from_numpy(train_Y)  #5,1


# In[6]:


# 定义 Convolution Network 模型

class Cnn(nn.Module):

    def __init__(self, in_dim, n_class):

        super(Cnn, self).__init__()

        self.conv = nn.Sequential(

            nn.Conv2d(in_dim, 6, (1,2), stride=(1), padding=(0,1)),#6,1,9

            nn.ReLU(True),

            nn.MaxPool2d(1, 1),#6,1,9

            nn.Conv2d(6, 16, (1,3), stride=(1), padding=(0,1)),

            nn.ReLU(True), nn.MaxPool2d(1, 1))#16,1,7
   
            #5*144

        self.fc = nn.Sequential(

            nn.Linear(144, 16), nn.Linear(16, 8), nn.Linear(8, n_class))



    def forward(self, x):

        out = self.conv(x)

        out = out.view(out.size(0), -1)

        out = self.fc(out)

        return out


# In[8]:


model = Cnn(1, 1)  # 图片大小是1,8

use_gpu = torch.cuda.is_available()  # 判断是否有GPU加速

if use_gpu:

    model = model.cuda()

# 定义loss和optimizer

criterion = nn.CrossEntropyLoss()

optimizer = optim.SGD(model.parameters(), lr=learning_rate)

#logger = Logger('./logs')


# In[10]:


# 开始训练

for epoch in range(num_epoches):

    print('epoch {}'.format(epoch + 1))

    print('*' * 10)
    
    running_loss=0
    
    data=(train_x)
    
    train_x=Variable(data)
    
    train_y=Variable(train_y)
    
    train_y=train_y.float()

    out = model(train_x)

    loss = criterion(out, train_y)

    running_loss += loss.item() * train_y.size(0)

    print(
           out,loss, running_loss
            )   

    # 向后传播

    optimizer.zero_grad()

    loss.backward()

    optimizer.step()

       