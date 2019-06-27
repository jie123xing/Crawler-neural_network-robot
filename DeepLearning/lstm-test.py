# -*- coding: utf-8 -*-
"""
Created on Thu Jun 27 09:06:18 2019

@author: admin
"""

import torch

from torch import nn, optim

from torch.autograd import Variable

from torch.utils.data import DataLoader

from torchvision import transforms

from torchvision import datasets


# In[2]:


# 定义超参数

learning_rate = 1e-1

num_epoches = 200


train_x = Variable(torch.randn(5,1,1,8))
train_y = Variable(torch.randn(1))

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
        
        out = out.view(5)

        return out
    
model = Cnn(1,1)
model.load_state_dict(torch.load('./cnn.pth'))
train_x=model(train_x)
print(train_x)
train_x = train_x.view(1,1,5)
print(train_x)

# In[4]:


# 定义 Recurrent Network 模型

class Rnn(nn.Module):

    def __init__(self, in_dim, hidden_dim, n_layer, n_class):

        super(Rnn, self).__init__()

        self.n_layer = n_layer

        self.hidden_dim = hidden_dim

        self.lstm = nn.LSTM(in_dim, hidden_dim, n_layer, batch_first=True)

        self.classifier = nn.Linear(hidden_dim, n_class)



    def forward(self, x):

        # h0 = Variable(torch.zeros(self.n_layer, x.size(1),

        #   self.hidden_dim)).cuda()

        # c0 = Variable(torch.zeros(self.n_layer, x.size(1),

        #   self.hidden_dim)).cuda()

        out, _ = self.lstm(x) #out 100 28 128 _ [0]2 100 128 [1]2 100 128

        out = out[:, -1, :]  #100,128

        out = self.classifier(out) #100,10

        return out


# In[5]:


model = Rnn(5, 12, 2, 1)  


# 定义loss和optimizer

criterion = nn.L1Loss()

optimizer = optim.Adam(model.parameters(), lr=learning_rate)


# In[7]:


# 开始训练

#train_x = Variable(torch.randn(1,1,5))
#train_y = Variable(torch.randn(1))



for epoch in range(num_epoches):

    print('epoch {}'.format(epoch + 1))

    print('*' * 10)

  
    out = model(train_x)
  

    loss = criterion(out, train_y)

    # running_loss += loss.item() * train_y.size(0)

    print(
           out,loss
            )   
        
    # 向后传播

    optimizer.zero_grad()

    loss.backward(retain_graph=True)

    optimizer.step()
    

