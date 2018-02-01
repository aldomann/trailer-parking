%% Header
% Description:
%  This script simulates...
%
% Authors:
%  Alfredo Hernández <aldomann.designs@gmail.com>
%  David Masip <david26694@gmail.com>
%  Martí Municoy <martimunicoy@gmail.com>
%  Jan-Hendrik Niemann <janhendrik.niemann@e-campus.uab.cat> 

close all
clear all

%% Parameters
% Reference angle
r = 0.0;
% Initial condition in degree
phi_0 = r + 0.1;
% Velocity in meters per second
V = -3.0;
% Example for Mercedes Benz CLC S203 AMG (see picture) in meters
L1 = 2.715;
L2 = 1.169;
L3 = 1.2;

%% Model
% It can easily be seen that the system is unstable since the eigenvalue of
% A is A which is positve
A = V/L3;
B = V/L1*(1+L2/L3);
C = 1;
D = 0;

%% Calculate open-Loop Response to Non-Zero Initial Condition

% Time in seconds
t = 0:0.01:10;
% Input
u = zeros(size(t))*r;
% Space state
sys = ss(A,B,C,0);

% Calculate Open-Loop Response to Non-Zero Initial Condition
[y,t,x] = lsim(sys,u,t,phi_0);

% Plot the Response
figure(1)
    plot(t,y)
    hold on
    plot(t,u)
    str_num = num2str(phi_0);
    str = strcat('Open-Loop Response to Non-Zero Initial Condition \phi_0=', str_num);
    title(str)
    xlabel('Time (sec)')
    ylabel('\phi (rad)')
    legend('Open-loop response', 'Reference')
    hold off

%% Calculate Closed-Loop Response to Non-Zero Initial Condition
% http://ctms.engin.umich.edu/CTMS/index.php?example=Introduction&section=ControlStateSpace

% Time in seconds
t = 0:0.01:60;
% Inputs
% u = curve1(t, 0.35); % Standard curve
% u = curve2(t, 0.4); % U turn
% u = curve3(t, 0.65); % Sharp curve
u = curve4(t, 0.4); % S shape

% Pole Placement
K = place(A,B,-0.73);
% Space state
sys_cl = ss(A-B*K,B,C,0);
% Something
Nbar = rscale(sys,K);

% Calculate Closed-Loop Response to Non-Zero Initial Condition
[y_cl,t,x_cl] = lsim(sys_cl,Nbar*u,t,phi_0);

% Plot the Response
figure(2)
	plot(t,y_cl)
	hold on
	plot(t,u)
	str = strcat('Closed-Loop Response to Non-Zero Initial Condition \phi_0=', str_num);
	title(str)
	xlabel('Time (sec)')
	ylabel('\phi (rad)')
	legend('Closed-loop response', 'Reference')
	hold off
    