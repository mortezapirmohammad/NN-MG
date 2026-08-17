%M_Pirmohammad NN Microgrid voltage control
clc;
close all;
clear;

global  eta_d  eta_q   beta  p q phi Vdc F_pwm Rf Lf RL
global Ll R L C Rl f0 Vn Lt g Rt  Lg  omega0 Ts
%controller parameters
% lambda = 1e10;
beta=1e10; %10
p=5;
q=3;
eta_d=1e50;%50- 28
eta_q=1e50;%50- 28       
phi=0.01;
Ts=0.50e-5;


 %plant parameters
Vdc= 1000;
omega0= 314;
F_pwm= 10000;
Rf= 40e-3;% filter resistance
Lf = 10e-3;% filter inductance
RL=0.1; %%Transmission line resistance
Ll= 31e-6; %%Transmission line inductance
R=4.33;
L= 100e-3;
C= 1e-12;
Rl = 0.1;
f0 = 50;
Vn= 220;

Lg= 0;
Rt= Rf +RL; 
Lt = Lf + Ll;
% g= -1/(Lt*C);
g=-10e14;


vdc=randi([990 1020],1,10000);%DC-link voltage =1000
vd=randi([290 320],1,10000);%vd-ref=311.1
vq=randi([-5 5],1,10000);%vq-ref=0
Dd=vd./vdc+0.3;
Dq=vq./vdc+0.4;
% input=[vdc;vd;vq];
% output=[Dd;Dq];
input1=[vdc;vd];
input2=[vdc;vq];
output1=Dd;
output2=Dq;
