clear all; clc; close all;

Nm = [1516];
Dm = [1 64.18 547.7];
Gm = tf(Nm,Dm);

Wm=sqrt(547.7);
Km=1516/547.7;
Zm=64.18/(2*Wm);

%s^3+(2*Zm*Wm+Kd*Km*Wm^2)*s^2+(Wm^2+Kp*Km*Wm^2)*s+(Ki*Km*Wm^2)=(s+r)(s^2+2*Zc*Wc*s+Wc^2)
Zc=1/sqrt(2);
Wc=0.6*Wm;
r=4*Wc;    %지금 alpha 3으로 설정

Kd=(2*Zc*Wc+r-2*Zm*Wm)/(Km*Wm^2);
Kp=(((2*Zc*Wc*r+Wc^2)/Wm^2)-1)/Km;
Ki=(r*Wc^2)/(Km*Wm^2);


Ncl = [Km*Wm^2*Kd Km*Wm^2*Kp Km*Wm^2*Ki];
Dcl = [1 2*Zm*Wm+Kd*Km*Wm^2 Wm^2+Kp*Km*Wm^2 Ki*Km*Wm^2];
Gcl = tf(Ncl,Dcl);



figure, step(Gcl),grid on,
hold on, step(Gm);

figure, pzmap(Gcl),grid on;

