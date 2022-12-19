function BCD_entrenar 
clc;
%los 7 Segmentos del display
a=[1 0 1 1 0 1 1 1 1 1];
b=[1 1 1 1 1 0 0 1 1 1];
c=[1 1 0 1 1 1 1 1 1 1];
d=[1 0 1 1 0 1 1 0 1 0];
e=[1 0 1 0 0 0 1 0 1 0];
f=[1 0 0 0 1 1 1 0 1 1];
g=[0 0 1 1 1 1 1 0 1 1];
display = [a;b;c;d;e;f;g;];

net1=newp([-2 2;-2 2;-2 2;-2 2],7);%entradan d 4 vectores , salida de 7 vectores
net1.trainParam.epochs=20;
p=[[0 0 0 0]' [0 0 0 1]' [0 0 1 0]' [0 0 1 1]' ...
   [0 1 0 0]' [0 1 0 1]' [0 1 1 0]' [0 1 1 1]'...
   [1 0 0 0]' [1 0 0 1]'];
t=[a;b;c;d;e;f;g;]; % Ojo el numero de filas define el número de neuronas.
net1= train(net1,p,t);

net3=newp([-2 2;-2 2;-2 +2;-2 2;-2 +2;-2 2;-2 +2],7);
net3.trainParam.epochs=20;

out1=net1(p);
net3= train(net3,out1,display);
out2=net3(out1)
save('net1')
save('net3')