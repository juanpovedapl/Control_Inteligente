%Identificacion del sistema termico usando funciones de matlab  
%Se toma la mitad del total de los datos del experimento para definit
%los vectores de entrada (IN) y salida (OUT) para hacer la identificacion 
%La otra mitad se usará para la validadcion 

u=out.ScopeData1.signals.values(:,1);
y=out.ScopeData1.signals.values(:,2);
N=length(u)/2;
IN=u(1:N);
OUT=y(1:N);
%Definicíon de los vectores de entrada y salida para validacíon
IN_VAL=u(1:N);
OUT_VAL=y(N+1:end);
%Datos de Entrada y Salida para validación
Zn=[OUT IN];
%Datos de entrada y salida para validación
Zn_VAL=[OUT_VAL IN_VAL];
%Modelo del regresor 
%En el regresor define [na nb nk]
%donde na son los polos ,nb los ceros , nk el tiempo muerto
reg=[1 1 0];
%Estimacíon del modelo de sistema usando arquitectura ARX
modelo =arx(Zn,reg);
%Presentacion de las caracteristicas del sistema identificado present(modelo)
%comparacion  delos resultados usando simulacion putra 
figure
compare(Zn_VAL,modelo);

