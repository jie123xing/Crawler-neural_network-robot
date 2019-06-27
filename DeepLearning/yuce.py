#!/usr/bin/env python
# coding: utf-8

# In[2]:


import torch
from torch import nn
import numpy as np
from torch.autograd import Variable
# In[3]:


train_X=np.array([[0.129779 ,0.352941 ,0.245902 ,0.527273 ,0.666667 ,0.002290 ,0.000000 ,0.0],  
        [0.148893 ,0.367647 ,0.245902 ,0.527273 ,0.666667 ,0.003811 ,0.000000 ,0.0],
        [0.159960 ,0.426471 ,0.229508 ,0.545454 ,0.666667 ,0.005332 ,0.000000 ,0.0],
        [0.182093 ,0.485294 ,0.229508 ,0.563637 ,0.666667 ,0.008391 ,0.037037 ,0.0],
        [0.138833 ,0.485294 ,0.229508 ,0.563637 ,0.666667 ,0.009912 ,0.074074 ,0.0]],dtype=np.float32)
train_Y=np.array([0.148893 ,0.159960 ,0.182093 ,0.138833 ,0.109658],dtype=np.float32)


# In[4]:


train_X = train_X.reshape(-1, 1, 8)
train_Y = train_Y.reshape(-1, 1, 1)

train_x = torch.from_numpy(train_X)
train_y = torch.from_numpy(train_Y)


# In[5]:


train_x


# In[6]:


class lstm(nn.Module):
    def __init__(self,input_size=8,hidden_size=4,output_size=1,num_layer=2):
        super(lstm,self).__init__()
        self.layer1 = nn.LSTM(input_size,hidden_size,num_layer)
        self.layer2 = nn.Linear(hidden_size,output_size)
    def forward(self,x):
        x,_ = self.layer1(x)   #x:5,1,4 _[0]:2,1,4=_[1]
        s,b,h = x.size()    #5,1,4
        x = x.view(s*b,h)   #5,4
        x = self.layer2(x)  #5,1
        x = x.view(s,b,-1)  #5,1,1
        return x

model = lstm(8, 4,1,2)


# In[8]:


criterion = nn.MSELoss()
optimizer = torch.optim.Adam(model.parameters(), lr=1e-2)


# In[9]:


# 开始训练
for e in range(400):
    var_x = Variable(train_x)
    var_y = Variable(train_y)
    # 前向传播
    out = model(var_x)
    loss = criterion(out, var_y)
    # 反向传播
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()
    
    if (e + 1) % 100 == 0: # 每 100 次输出结果
        print('Epoch: {}, Loss: {:.5f}'.format(e + 1, loss.item()))


# In[15]:


model.eval()

predict = model(Variable(train_x))


# In[22]:


predict

