% Identificacionn del sistema carro masa usando funciones de Matlab.
% Se toma la mitad del total de los datos del experimento para definir los 
% vectores de entrada (IN) y salida (OUT) para hacer la identificacion.
% La otra mitad se usar?a para la validacion.
  u=ScopeData.signals.values(:,1);
  y=ScopeData1.signals.values(:,2);
  N = length(u)/2;
  IN = u(1:N);
  OUT = y(1:N);
% Definici ?on de los vectores de entrada y salida para validaci ?on
  IN_VAL=u(N+1:end);
  OUT_VAL=y(N+1:end);
% Datos de Entrada y Salida del sistema 
  Zn=[OUT IN];
% Datos de Entrada y Salida para validaci ?on 
  Zn_VAL=[OUT_VAL IN_VAL];
% Modelo del regresor
  %reg=[2 1 0];
  reg=[2 2 1];
% Estimaci ?on del modelo de sistema usando arquitectura ARX 
  modelo=arx(Zn, reg);
% Presentacio ?n de las caracter ??sticas del sistema identificado present(modelo)
% Comparacio ?n de los resultados usando simulaci ?on pura
  figure
  compare(Zn_VAL, modelo)