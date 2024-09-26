
clear;
clc;

A = [0 1 0 0; 0 -1 0 0; 0 0 0 1; 0 1 9.81 0];
B = [0; 1; 0; -1];
C = [1 0 0 0];
P = [0 0 0; 1 0 0; 0 0 0; -1 0 0];
Q = [0 -1 0];
S = [0 0 0; 0 0 10; 0 -10 0];

% Calculate the feedback matrix K
K = -place(A, B, [-3 -5 -7 -9])

%Solve the equation:MatABC0*X-MatI000*X*MatS=MatPQ 
MatABC0 = [0 1 0 0 0; 0 -1 0 0 1; 0 0 0 1 0; 0 1 9.81 0 -1;1 0 0 0 0];
MatI000 = [1 0 0 0 0 ; 0 1 0 0 0 ; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 0];
MatS = [0 0 0; 0 0 10; 0 -10 0];% selections: 0.1 1 10
MatPQ = [0 0 0; -1 0 0; 0 0 0;1 0 0; 0 1 0];

%Solve the equation:MatABC0inv*MatABC0*X-MatABC0inv*MatI000*X*MatS=MatABC0inv*MatPQ 
%Rewriting the equation: MatABC0inv*MatI000*X*MatS-X+MatABC0inv*MatPQ=0
MatABC0inv=inv(MatABC0);
%X = dlyap(A,B,C) solves the Sylvester equation 
%in the form AXB – X + C = 0
X = dlyap(MatABC0inv*MatI000,MatS,MatABC0inv*MatPQ);

%Validate if the first equation holds.
PartA=MatABC0*X-MatI000*X*MatS;
PartB=-MatPQ;

%Extracting the matrices Gamma and Pi
Pi = X(1:4, :);
Gamma = X(end, :);

%Then calculating L
L=Gamma-K*Pi

% Simulation parameters
t_start = 0; % Start time
t_end = 50; % End time, long enough to observe several periods of the disturbances
x0 = [0,0,0,0]; % Initial state (fill in your initial state)

% Numerical integration using ode45
% Run the simulation
[t, x] = ode45(@(t, x) nonLinear(t, x, K, L), [t_start, t_end], x0);

% Plot output y and the tracking signal d2
figure;
% Plot y(t) which is x1
plot(t, x(:, 1), 'b', 'DisplayName', 'y(t) = x1');
hold on;
% Plot the tracking signal d2(t) = sin(0.1t)
d2 = sin(10 * t);
plot(t, d2, 'r--', 'DisplayName', 'asin(wt)');
hold off;
% Add labels, title, and legend
xlabel('Time (s)');
ylabel('y(t)');
title('Output y(t) and d2(t) Vs Time');
grid on;
legend show;

% Compute U for each time step
U = zeros(length(t), 1); 
for i = 1:length(t)
    [~, U_temp] = nonLinear(t(i), x(i, :)', K, L);
    U(i) = U_temp;
end

% Plot U
figure;
plot(t, U);
xlabel('Time (s)');
ylabel('Input u(t)');
title('Input u(t) Over Time');
grid on;

% System dynamics function
% Modified system dynamics function
function [dx, U] = nonLinear(t, x, K, L)
    d = [0.5 * square(2 * pi * t / 50); sin(10 * t); -cos(10 * t)];
    U = K * x + L * d;
    dx1=x(2);
    dx2=-x(2)+U+d(1);
    dx3=x(4);
    dx4=9.81*sin(x(3))+x(2)*cos(x(3))-cos(x(3))*U-cos(x(3))*d(1);
    dx=[dx1;dx2;dx3;dx4];
end