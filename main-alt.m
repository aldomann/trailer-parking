%% Settings

close all
clear all
% Reference angle
r = 1;
% Initial condition in degree
% phi_0 = r + 1.5;
phi_0 = 0.5;
% Velocity in meters per second
V = 1.0;
% Example for Mercedes Benz CLC S204 AMG (see picture) in meters
L1 = 2.715;
L2 = 1.169;
L3 = 1.2;

%% Model
% It can easily be seen that the system is unstable since the eigenvalue of
% A is A which is positve
A = V/L3;
B = V/L1*(1+L2/L3);

% I am not sure about the output. Maybe eq. (19) can be seen as output
% equation -> like this it is not really correct. The initial condition
% phi_0 is needed
C = 1;
D = 0;

%% Calculate open-Loop Response to Non-Zero Initial Condition

% Time in seconds
t = 0:0.01:10;
u = zeros(size(t))*r;

sys = ss(A,B,C,0);

% Calculate open-Loop Response to Non-Zero Initial Condition
[y,t,x] = lsim(sys,u,t,phi_0);
figure
plot(t,y)
hold on
plot(t,u)

% Plot the response
str_num = num2str(phi_0);
str = strcat('Open-Loop Response to Non-Zero Initial Condition \phi_0=', str_num);
title(str)
xlabel('Time (sec)')
ylabel('\phi (degree)')
legend('Open-loop response', 'Reference')
hold off

% Write matrices to txt files
dlmwrite('time_OL.txt',t);
dlmwrite('y_OL.txt',y);
dlmwrite('u_OL.txt',u');

%% Calculate Closed-Loop Response to Non-Zero Initial Condition
% http://ctms.engin.umich.edu/CTMS/index.php?example=Introduction&section=ControlStateSpace
t = 0:0.01:10;
% u = ones(size(t))*r;
% u = test(length(t),r);
u = quer(t);

% TODO: Find a suitable method to compute a gain 
K = place(A,B,-0.73);
sys_cl = ss(A-B*K,B,C,0);
Nbar = rscale(sys,K);
[y_cl,t,x_cl] = lsim(sys_cl,Nbar*u,t,phi_0);

figure
plot(t,y_cl)
hold on
plot(t,u)
str = strcat('Closed-Loop Response to Non-Zero Initial Condition \phi_0=', str_num);
% Attention: Just for this case
% axis([0 2 4.5 7])
title(str)
xlabel('Time (sec)')
ylabel('\phi (degree)')
legend('Closed-loop response', 'Reference')
hold off

% Write matrices to txt files
dlmwrite('time_CL.txt',t);
dlmwrite('y_CL.txt',y_cl);
dlmwrite('u_CL.txt',u');

% Compress ti zip file
zip('data_archive.zip',{'time_OL.txt','time_CL.txt','y_OL.txt','y_CL.txt','u_OL.txt','u_CL.txt'});