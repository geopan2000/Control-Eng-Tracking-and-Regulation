clear;
clc;

A = [0 1 0 0; 0 -1 0 0; 0 0 0 1; 0 1 9.81 0];
B = [0; 1; 0; -1];
C = [1 0 0 0];
P = [0 0 0; 1 0 0; 0 0 0; -1 0 0];
Q = [0 -1 0];

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

%parameters
t_span = [0,5]; % Start time
x0 = [0,0,0,0]; % Initial state (fill in your initial state)

%simulate the system 
[t, x] = ode45(@(t, x) linearSystem(t, x, K, L), t_span, x0);

% Plot y(t)
figure;
plot(t, x(:, 1), 'b', 'DisplayName', 'y(t) = x1');
hold on;
% Plot the tracking signal d2(t) = sin(0.1t)
d2 = sin(10 * t);% selections: 0.1 1 10
plot(t, d2, 'r--', 'DisplayName', 'asin(wt)');
hold off;
xlabel('Time (s)');
ylabel('y(t)');
title('Output y(t) and d2(t) Vs Time');
grid on;
legend show;

%simulate U
U = zeros(length(t), 1);
for i = 1:length(t)
    [~, U_temp] = linearSystem(t(i), x(i, :)', K, L);
    U(i) = U_temp;
end

% Plot U
figure;
plot(t, U);
xlabel('Time (s)');
ylabel('Input u(t)');
title('Input u(t) Vs Time');
grid on;

% Linear system
function [dx, U] = linearSystem(t, x, K, L)
    A = [0 1 0 0; 0 -1 0 0; 0 0 0 1; 0 1 9.81 0];
    B = [0; 1; 0; -1];
    P = [0 0 0; 1 0 0; 0 0 0; -1 0 0];
    d = [0.5 * square(2 * pi * t / 50); sin(10 * t); -cos(10 * t)];
    U = K*x+L*d;
    dx =A*x+B*U+P*d; 
end
