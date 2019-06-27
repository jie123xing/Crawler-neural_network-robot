#!/usr/bin/env python
# coding: utf-8

# In[2]:


import torch

from torch import nn, optim

#import torch.nn.functional as F

from torch.autograd import Variable

from torch.utils.data import DataLoader

from torchvision import transforms

from torchvision import datasets

#from logger import Logger


# In[3]:


# 定义超参数

batch_size = 128

learning_rate = 1e-2

num_epoches = 20


# In[4]:


def to_np(x):

    return x.cpu().data.numpy()


# In[5]:


# 下载训练集 MNIST 手写数字训练集

train_dataset = datasets.MNIST(

    root='./data', train=True, transform=transforms.ToTensor(), download=True)



test_dataset = datasets.MNIST(

    root='./data', train=False, transform=transforms.ToTensor())



train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)

test_loader = DataLoader(test_dataset, batch_size=batch_size, shuffle=False)


# In[6]:


# 定义 Convolution Network 模型

class Cnn(nn.Module):

    def __init__(self, in_dim, n_class):

        super(Cnn, self).__init__()

        self.conv = nn.Sequential(

            nn.Conv2d(in_dim, 6, 3, stride=1, padding=1),#6,28,28

            nn.ReLU(True),

            nn.MaxPool2d(2, 2),#6,14,14

            nn.Conv2d(6, 16, 5, stride=1, padding=0),#16,10,10

            nn.ReLU(True), nn.MaxPool2d(2, 2))#16,5,5



        self.fc = nn.Sequential(

            nn.Linear(400, 120), nn.Linear(120, 84), nn.Linear(84, n_class))



    def forward(self, x):

        out = self.conv(x) #128.16.5.5

        out = out.view(out.size(0), -1)#128.400

        out = self.fc(out)#128.10

        return out


# In[8]:


model = Cnn(1, 10)  # 图片大小是28x28

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

    running_loss = 0.0

    running_acc = 0.0

    for i, data in enumerate(train_loader, 1):

        img, label = data    #128,1,28,18  label:128

        if use_gpu:

            img = img.cuda()

            label = label.cuda()

        img = Variable(img)

        label = Variable(label)

        # 向前传播

        out = model(img)

        loss = criterion(out, label)#out 128,10 ;label128

        running_loss += loss.item() * label.size(0)

        _, pred = torch.max(out, 1)

        num_correct = (pred == label).sum()

        accuracy = (pred == label).float().mean()

        running_acc += num_correct.item()
1
        # 向后传播

        optimizer.zero_grad()

        loss.backward()

        optimizer.step()

        # ========================= Log ======================

        step = epoch * len(train_loader) + i

        # (1) Log the scalar values

        info = {'loss': loss.item(), 'accuracy': accuracy.item()}
        if i % 300 == 0:

            print('[{}/{}] Loss: {:.6f}, Acc: {:.6f}'.format(

                epoch + 1, num_epoches, running_loss / (batch_size * i),

                running_acc / (batch_size * i)))

    print('Finish {} epoch, Loss: {:.6f}, Acc: {:.6f}'.format(

        epoch + 1, running_loss / (len(train_dataset)), running_acc / (len(

            train_dataset))))

    model.eval()

    eval_loss = 0

    eval_acc = 0

    for data in test_loader:

        img, label = data

        if use_gpu:

            img = Variable(img, volatile=True).cuda()

            label = Variable(label, volatile=True).cuda()

        else:

            img = Variable(img, volatile=True)

            label = Variable(label, volatile=True)

        out = model(img)

        loss = criterion(out, label)

        eval_loss += loss.item() * label.size(0)

        _, pred = torch.max(out, 1)

        num_correct = (pred == label).sum()

        eval_acc += num_correct.item()

    print('Test Loss: {:.6f}, Acc: {:.6f}'.format(eval_loss / (len(

        test_dataset)), eval_acc / (len(test_dataset))))

    print()


# In[11]:


# 保存模型

torch.save(model.state_dict(), './cnn.pth')


# In[ ]:




