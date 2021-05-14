clc
clear all
close all

%Laboratorio 1, Transferencia de Calor.

%Datos del Excel.

T1=xlsread('LAB','B3:B56'); %Temperatura superficial interior en la muestra.
T2=xlsread('LAB','C3:C56'); %Temperatura superficial exterior en la muestra.
T3=xlsread('LAB','D3:D56'); %Temperatura de la resistencia eléctrica.
T4=xlsread('LAB','E3:E56'); %Temperatura del aire en el interior de la caja.
T5=xlsread('LAB','F3:F56'); %Temperatura superficial interior en el aislante.
T6=xlsread('LAB','G3:G56'); %Temperatura superficial exterior en el aislante.
T7=xlsread('LAB','H3:H56'); %Temperatura del aire en la sala donde está ubicada la caja (Cámara climática, laboratorio de termofluidos).

%Datos del PDF.

   %Datos de la caja.
  
    rhope=15;   %kg/m3 (Densidad del poliestireno expandido).
    kpe=0.041;  %W/mK (Conductividad térmica del poliestireno expandido).
    a=600/1000; %m, ancho de la caja y largo de la caja.
    b=400/1000; %m, agujero en la caja.
    p=380/1000; %m, profundidad de la caja.
    e=100/1000; %m, espesor de la caja.
    Rpe=e/kpe;  %Km2/W;
    
   %Datos de la muestra.
   
    a2=400/1000; %m, ancho y largo de la muestra.
    e2=22/1000;  %m, profundidad de la muesra.
   
   %Datos de la resistencia eléctrica.
   
    Qe=4.4; %W
    ar=2.1/100; %m, ancho de la resistencia.
    lr=9/100;   %m, largo de la resistencia.
    
%Cálculos preliminares    
    
%Promedios de temperaturas
    T1p=sum(T1)/54;
    T2p=sum(T2)/54;
    T3p=sum(T3)/54;
    T4p=sum(T4)/54;
    T5p=sum(T5)/54;
    T6p=sum(T6)/54;
    T7p=sum(T7)/54;
    
%Diferenciales de temperatura necesarios para balance térmico.
    T4T1=T4p-T1p;
    T3T4=T3p-T4p;
    T4T5=T4p-T5p;
    T7T2=T7p-T2p;
    T1T2=T1p-T2p;
    T5T6=T5p-T6p;
    T7T6=T7p-T6p;
    
 %Areas necesarias
    Ape=(b^2)+(4*((p-e-e2)*b)); %m2
    Am=(b^2);                   %m2
    Ar=ar*lr;                   %m2
   
%Cálculos 
    qpe=T5T6/Rpe;  %W/m2
    Qpe=qpe*Ape;   %W
    hc1=qpe/T7T6;  %h convectivo de superficie exterior del aislante.
    hc2=qpe/T4T5;  %h convectivo de superficie interior del aislante.
    hc5=Qe/(Ar*T3T4);   %h convectivo de la resistencia eléctrica.
    Qm=Qe-Qpe;     %W
    k=(Qm*e2)/(Am*(T1T2)); %W/mK
    qm=Qm/Am;      %W/m2
    hc3=qm/T4T1;   %W/m2K
    hc4=qm/T7T2;   %W/m2K

%Resultados

X1 = ['h convectivo de superficie exterior del poliestireno: ',num2str(hc1),' W/m2K'];
disp(X1)
X2 = ['h convectivo de superficie interior del poliestireno: ',num2str(hc2),' W/m2K'];
disp(X2)
X3 = ['h convectivo de superficie interior de la muestra: ',num2str(hc3),' W/m2K'];
disp(X3)
X4 = ['h convectivo de superficie exterior de la muestra: ',num2str(hc4),' W/m2K'];
disp(X4)
X5 = ['h convectivo de la resistencia eléctrica: ',num2str(hc5),' W/m2K'];
disp(X5)
X6 = ['Coeficiente de conducción térmica de la muestra: ',num2str(k),' W/mK'];
disp(X6)