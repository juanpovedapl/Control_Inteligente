% Identificacion del sistema carro masa usnado RNA
% Se trasponen los vectores de entrada y salida y se toma la mitad % de los datos para hacer la identificacion. La otra mitad se
% usara para la validacion.
IN = ScopeData.signals.values(:,1)';
OUT = ScopeData1.signals.values(:,2)';

N = (length(IN)+1)/2;
ValIn=IN(N+1:end);
ValOut=OUT(N+1:end);
IN=IN(1:N);
OUT=OUT(1:N);
% Se prueba inicialmente con una estructura lineal (ARX) para hacer la
% identificaci ?on. Se define un vector regresor que depende de dos retardos % en la salida y la entrada

%X = [OUT(2:N-1); OUT(1:N-2);IN(2:N-1); IN(1:N-2)];
% Se establece el vector de salida deseada
%Yd = [OUT(3:N)];


X = [OUT(3:N-1); OUT(2:N-2);IN(2:N-2); IN(1:N-3)];
% Se establece el vector de salida deseada
Yd = [OUT(4:N)];





% Se crea la red con 10 neuronas en la capa oculta y 1
% neurona en la capa de salida.
red = newff(minmax(X),[10 1],{'tansig','purelin'},'trainlm');
% Frecuencia de visualizaci ?on del progreso del entrenamiento (en  ?epocas o iteraciones). 
%red.trainParam.show = 25;
% Nu ?mero ma ?ximo de iteraciones de entrenamiento
red.trainParam.epochs = 1000;
% M? ?nimo error objetivo 
red.trainParam.goal = 1e-4; 
red = init(red);
% Se entrena la red y se almacenan los datos del entrenamiento,
% la salida de la red y el error
[red,tr,Y,E]=train(red,X,Yd);
% Se visualiza el error absoluto y se comparan la salida real con
% la salida de la red
n=N-1;


%Xval=[ValOut(2:n-1); ValOut(1:n-2); ValIn(2:n-1); ValIn(1:n-2)];
%Yval=ValOut(3:n);

Xval=[ValOut(3:n-1); ValOut(2:n-2); ValIn(2:n-2); ValIn(1:n-3)];
Yval=ValOut(4:n);





sim(red,Xval);
figure,
subplot(2,1,1),plot(E),legend('Error'),
subplot(2,1,2),plot(Yval'),legend('Y','Y^'),
% ...y se genera el objeto ?red? como un bloque para ser
% usado en Simulink. En este caso el tiempo de muestreo
% equivale al numero de datos por muestra es decir 1.
Tiempo=0:length(ValIn)-1;
EntradaReal=[Tiempo' ValIn'];
SalidaReal=[Tiempo' ValOut'];
gensim(red,0.1);



