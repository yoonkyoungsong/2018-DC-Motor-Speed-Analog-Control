
clear all; close all; clc

 data = load('PID_sin 0.5.csv');
 data1 = data (:,1);
 data2 = data (:,2);

 data4 = data (:,4);

 plot(data1, data2,'b',data1, data4,'r','linewidth',2),
 axis([0 3 0 3.5])
 grid on, xlabel('time[sec]'), ylabel('Voltage[V]'), legend('input','output');
 
  meas1=data2
  meas2=data4

% Magnitude ���ϱ�
Vin1 = max(meas1)-min(meas1)
Vout1 = max(meas2)-min(meas2)
gain1 = Vout1/Vin1

% �������� �׸� �������� ���
str = sprintf('Modeling validity at Unit step response, Gain = %4.2f',gain1)
title(str, 'fontsize', 12) 

