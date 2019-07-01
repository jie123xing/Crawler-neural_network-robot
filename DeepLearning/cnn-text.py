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

import pandas as pd
#from logger import Logger


# In[3]:


# 定义超参数

batch_size = 100  ###only one barch

learning_rate = 1e-2

num_epoches = 100


# In[4]:


def to_np(x):

    return x.cpu().data.numpy()


# In[5]:
'''
train_X=np.array([[0.129779 ,0.352941 ,0.245902 ,0.527273 ,0.666667 ,0.002290 ,0.000000 ,0.0],  
        [0.148893 ,0.367647 ,0.245902 ,0.527273 ,0.666667 ,0.003811 ,0.000000 ,0.0],
        [0.159960 ,0.426471 ,0.229508 ,0.545454 ,0.666667 ,0.005332 ,0.000000 ,0.0],
        [0.182093 ,0.485294 ,0.229508 ,0.563637 ,0.666667 ,0.008391 ,0.037037 ,0.0],
        [0.138833 ,0.485294 ,0.229508 ,0.563637 ,0.666667 ,0.009912 ,0.074074 ,0.0]])
train_Y=np.array([0.148893 ,0.159960 ,0.182093 ,0.138833 ,0.109658])


#dtype=np.float32
# In[4]:


train_X = train_X.reshape(-1,1, 1, 8)
#train_Y = train_Y.reshape(-1, 1)

train_x = torch.from_numpy(train_X)  #5,1,1,8
train_y = torch.from_numpy(train_Y)  #5,1
'''

train_x=torch.Tensor([[[0.0000, 0.1000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000]],

        [[0.0000, 0.2000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000]],

        [[0.0000, 0.3000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000]],

        [[0.0000, 0.4000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000]],

        [[0.0000, 0.5000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000]]])
train_x=train_x.view(5,1,1,8)
train_y=torch.Tensor([[0.1000],[0.2000],[0.3000],[0.4000],[0.5000]])


'''
df = pd.read_csv('formatweather.csv')
train_x=df.values[:,1:9]   #shape:(43823, 8)
train_y=df.values[:,9]     #shape:(43823,)

train_x = torch.from_numpy(train_x)  #43823,1,1,8
train_y = torch.from_numpy(train_y)  #43823,1

train_x=train_x.view(-1,1,1,8)
train_y=train_y.view(-1,1)
'''
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

            nn.ReLU(True), nn.MaxPool2d(1, 1))#16,1,9
   
            #5*144

        self.fc = nn.Sequential(

            nn.Linear(144, 16), nn.Linear(16, 8), nn.Linear(8, n_class))



    def forward(self, x):

        out = self.conv(x)

        out = out.view(out.size(0), -1)

        out = self.fc(out)
        
        #out = out.view(5)

        return out


# In[8]:


model = Cnn(1, 1)  # 图片大小是1,8

use_gpu = torch.cuda.is_available()  # 判断是否有GPU加速

if use_gpu:

    model = model.cuda()

# 定义loss和optimizer

#criterion = nn.CrossEntropyLoss()
criterion = nn.MSELoss()
optimizer = optim.SGD(model.parameters(), lr=learning_rate)

#logger = Logger('./logs')


# In[10]:
#train_x = Variable(torch.randn(5,1,1,8))
#train_y = Variable(torch.randn(5))

# 开始训练

for epoch in range(num_epoches):
    
    running_loss=0
    
    
    #train_x=Variable(train_x)
    
    #train_y=Variable(train_y)
    
    #train_y=train_y.float()
    
    
    out = model(Variable(train_x))
  

    loss = criterion(out, Variable(train_y))

   # running_loss += loss.item() * train_y.size(0)
    if (epoch+1)%1000==0:
        print('epoch {}'.format(epoch + 1))

        print('*' * 10)
        print(out,loss)   

    # 向后传播

    optimizer.zero_grad()

    loss.backward()

    optimizer.step()

# 保存模型

torch.save(model.state_dict(), './cnn.pth')