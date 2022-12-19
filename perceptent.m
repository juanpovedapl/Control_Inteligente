function perceptent 

net1=newp([-2 2;-2 +2],2);
net1.trainParam.epochs=20;
p=[[0;1] [0;0] [1;1] [1;0]];
t=[[1;0] [0;0] [1;1] [1;0]]; % Ojo el numero de renglones define el número de neuronas.
net1= train(net1,p,t);

net3=newp([-2 2;-2 +2],1);
net3.trainParam.epochs=20;
p_0=[[0;1] [0;0] [1;1]];
t_0=[1 0 0]; % Ojo el numero de renglones define el número de neuronas.
net3= train(net3,p_0,t_0);
save('net1')
save('net3')

