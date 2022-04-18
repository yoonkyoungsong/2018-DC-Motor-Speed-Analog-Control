close all, clear all, clc;

Trinal=4; %이게 의미하는게 뭔지?
TS=0.001;

Km=1.0;
Zm=0.6;
Wm=2*pi*5;

Wc=2*pi*3;
Zc=0.707;
Rc=3*Wc;

Kp=(Wc^2-Wm^2+2*Zc*Wc*Rc) / (Km*Wm^2);
Ki=Rc*Wc^2 / (Km*Wm^2);
Kd=(2*Zc*Wc - 2*Zm*Wm)+Rc / (Km*Wm^2);

[A,B,C,D]=linmod('openloop');
sysGo=ss(A,B,C,D);
sysGo=minreal(sysGo);
[num,den]=ss2tf(A,B,C,D);
Go=-tf(num,den);

figure, nyquist(Go), axis ([-1.6 1.6 1.2 1.2]);
[Gm,Pm,Wcp,Wcg]=margine(Go);

disp(sprintf('Gain Margine = %4.2[dB]at Wpc=%4.2[Hz]',20*log10(Gm),Wcp/(2*pi)));
disp(sprintf('Phase Margine= %4.2[deg],at Wgc=%4.2[Hz]',Pm, Wcg/(2*pi) ));

sim('closeloop');
figure, polt(time,input,output,'b',time,output,'r','linewidth')
grid on, xlabel('time[sec]'),ylabel('step reponse'),legend('input','output');