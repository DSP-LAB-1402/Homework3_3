%% *Homework3_3*
%% Clear workspace
close all;
clear;
clc;
%% Homework1
% t = linspace(1, 100, 300);
% f = 100;
% 
% for i = 0
%     x = A(i) * cos(2 * pi * f * t);
%     x_mean = (2 * pi) / A;
%     x_2 = 0.5 * A ^ 2;
% end

%% Homework2

w0 = pi * 0.15;
n = [0:199; 200:399; 400:599];
A = [2 4 0.5];
x = cos(w0 * n) .* A';
x = x';
x = x(1:end);
n=n';
n=n(1:end);
lambda = 0.9;
c0 = 0.5;
rho = 0.2;
b = 1 - lambda;
a = [1 -lambda];
cn = filter(b, a, abs(x));
gn = ones(1, length(cn));
gn(cn >= c0) = (cn(cn>=c0) / c0) .* (rho - 1);
yn = gn .* x;
figure('Name','Input Signal vs Compressed Signal');
subplot(1,2,1)
plot(n,x,'LineWidth',1.5);
xlim([0 600]);
ylim([-5 5]);
grid on;
title('Input Signal');
xlabel('n');
ylabel('amplitude')
subplot(1,2,2)
plot(n,yn,'LineWidth',1.5);
xlim([0 600]);
ylim([-5 5]);
grid on;

