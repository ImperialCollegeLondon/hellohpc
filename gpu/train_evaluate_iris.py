# code from https://medium.com/@saitejamummadi/creating-a-simple-neural-network-to-classify-iris-species-using-pytorch-45586f45c9e1

import torch
import torch.nn as nn
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt

#dataset
iris = load_iris()
#print(iris.keys())
X, y = iris.data, iris.target
X_train, X_test, y_train, y_test = train_test_split(X, y, train_size=0.8)

#tensors
X_tr_tensor = torch.tensor(X_train, dtype=torch.float32)
y_tr_tensor = torch.tensor(y_train, dtype=torch.long)

#build network
class FullyConnected(nn.Module):
    def __init__(self):
        super().__init__()
        self.l1 = nn.Linear(4, 64)  # Input layer to 64 neurons
        self.act1 = nn.ReLU()       # ReLU activation function
        self.l2 = nn.Linear(64, 16) # 64 neurons to 16 neurons
        self.drop = nn.Dropout(0.2) # Dropout for regularization
        self.act2 = nn.ReLU()       # Another ReLU
        self.l3 = nn.Linear(16, 3)  # Output layer to 3 neurons (classes)

    def forward(self, x):
        # Forward pass
        x = self.l1(x)
        x = self.act1(x)
        x = self.l2(x)
        x = self.drop(x)
        x = self.act2(x)
        x = self.l3(x)
        return x

#train
def fit(model):
    epochs = 400
    loss_arr = []
    loss_fn = nn.CrossEntropyLoss()
    optim = torch.optim.Adam(model.parameters(), lr=0.002)

    for epoch in range(epochs):
        ypred = model(X_tr_tensor)
        loss = loss_fn(ypred, y_tr_tensor)
        loss_arr.append(loss.item())
        loss.backward()
        optim.step()
        optim.zero_grad()
    plt.plot(loss_arr)
    #plt.show()
    plt.savefig('fit.png') 

#move data to GPU and train
model = FullyConnected()
model.to('cuda:0')  # Move model to GPU
X_tr_tensor = X_tr_tensor.to('cuda:0')  # Move tensors to GPU
y_tr_tensor = y_tr_tensor.to('cuda:0')
fit(model)

#evaluate
X_ts_tensor = torch.tensor(X_test, dtype=torch.float32).to('cuda:0')
ytest_pred = model(X_ts_tensor)
newytest = torch.argmax(ytest_pred, dim=1)

from sklearn.metrics import accuracy_score, confusion_matrix

print("Accuracy:", accuracy_score(newytest.cpu(), y_test))
print("Confusion Matrix:\n", confusion_matrix(newytest.cpu(), y_test))



