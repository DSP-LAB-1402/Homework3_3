%% *Homework3_3*
%% Programmers
% Mohammad Mahdi Elyasi - 9823007
%
% Moein Nasiri - 9823093
%% Clear workspace
close all;
clear;
clc;
%% Homework1
% Here we want to check if the presented equation is valid or not
fs = 100;
t = 0:1 / fs:1;
f = 10;
A = [2 4 0.5];
%%%
% Here we check for different "A"s
for i = 1:1:3
    x = A(i) .* cos(2 * pi * f * t);
    x_mean = (2 / pi) .* A(i);
    ms_x = 0.5 * A(i) ^ 2;
    disp(x_mean);
    disp(mean(abs(x)));
    disp(ms_x);
    disp(mean(x .^ 2));
end

%% Homework2
% Here we want to replot figure 6-11 again
%
% First we need to declare essential variables
w0 = pi * 0.15;
n = [0:199; 200:399; 400:599];
A = [2 4 0.5];
x = cos(w0 * n) .* A';
x = x';
x = x(1:end);
n = n';
n = n(1:end);
lambda = 0.9;
c0 = 0.5;
rho = 0.2;
b = 1 - lambda;
a = [1 -lambda];
cn = filter(b, a, abs(x));
gn = ones(1, length(cn));
gn(cn >= c0) = (cn(cn >= c0) / c0) .^ (rho - 1);
yn = gn .* x;

%%%
% Fig 3.6
figure('Name', 'Input Signal vs Compressed Signal');
subplot(1, 2, 1)
plot(n, x, 'LineWidth', 1.5);
xlim([0 600]);
ylim([-5 5]);
grid on;
title('Input Signal');
xlabel('n');
ylabel('amplitude');
subplot(1, 2, 2)
plot(n, yn, 'LineWidth', 1.5);
xlim([0 600]);
ylim([-5 5]);
grid on;

figure('Name', 'Contol Signal vs Gain Signal');
subplot(1, 2, 1);
plot(n, cn, 'LineWidth', 1.5);
title('Control Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 5]);
grid on;
subplot(1, 2, 2);
plot(n, gn, 'LineWidth', 1.5);
title('Gain Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 1.2]);
grid on;

L = 7;
cn_smoothed = movmean(cn, [L - 1 0]);
gn_smoothed = ones(1, length(cn_smoothed));
gn_smoothed(cn_smoothed >= c0) = (cn_smoothed(cn_smoothed >= c0) / c0) .^ (rho - 1);
yn_smoothed = gn_smoothed .* x;

figure('Name', 'Smoothed Contol Signal vs Smoothed Gain Signal');
subplot(1, 2, 1);
plot(n, cn_smoothed, 'LineWidth', 1.5);
title('Smoothed Control Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 5]);
grid on;
subplot(1, 2, 2);
plot(n, gn_smoothed, 'LineWidth', 1.5);
title('Smoothed Gain Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 1.2]);
grid on;

%%%
% Fig 3.7
figure('Name', 'Contol Signal vs Gain Signal (3.7)');
subplot(1, 2, 1);
plot(n, cn, 'LineWidth', 1.5);
title('Control Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 5]);
grid on;
subplot(1, 2, 2);
plot(n, gn, 'LineWidth', 1.5);
title('Gain Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 1.2]);
grid on;

L = 7;
cn_smoothed = movmean(cn, [L - 1 0]);
gn_smoothed = ones(1, length(cn_smoothed));
gn_smoothed(cn_smoothed >= c0) = (cn_smoothed(cn_smoothed >= c0) / c0) .^ (rho - 1);
yn_smoothed = gn_smoothed .* x;

%%%
% Fig 3.8
figure('Name', 'Smoothed Output Signal vs Smoothed Gain Signal (3.8)');
subplot(1, 2, 1);
plot(n, yn_smoothed, 'LineWidth', 1.5);
title('Smoothed Output Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-5 5]);
grid on;
subplot(1, 2, 2);
plot(n, gn_smoothed, 'LineWidth', 1.5);
title('Smoothed Gain Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-2 2]);
grid on;

%%%
% Fig.3.9
lambda = 0.1;
c0 = 1.5;
rho = 0.1;
b = 1 - lambda;
a = [1, -lambda];
cn = filter(b, a, abs(x));

L = 7;
cn_smoothed = movmean(cn, L);
gn_smoothed = ones(1, length(cn_smoothed));
gn_smoothed(cn_smoothed >= c0) = (cn_smoothed(cn_smoothed >= c0) / c0) .^ (rho - 1);
yn_smoothed = gn_smoothed .* x;

figure('Name', 'Smoothed Output Signal vs Smoothed Gain Signal (3.9)');
subplot(1, 2, 1);
plot(n, yn_smoothed, 'LineWidth', 1.5);
title('Smoothed Output Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-5 5]);
grid on;
subplot(1, 2, 2);
plot(n, gn_smoothed, 'LineWidth', 1.5);
title('Smoothed Gain Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-2 2]);
grid on;

%%%
% Fig 3.10
lambda = 0.9;
c0 = 0.5;
rho = 2;
b = 1 - lambda;
a = [1, -lambda];
cn = filter(b, a, abs(x));

L = 7;
cn_smoothed = movmean(cn, L);
gn_smoothed = ones(1, length(cn_smoothed));
gn_smoothed(cn_smoothed <= c0) = (cn_smoothed(cn_smoothed <= c0) / c0) .^ (rho - 1);
yn_smoothed = gn_smoothed .* x;

figure('Name', 'Smoothed Output Signal vs Smoothed Gain Signal (3.10)');
subplot(1, 2, 1);
plot(n, yn_smoothed, 'LineWidth', 1.5);
title('Smoothed Output Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-5 5]);
grid on;
subplot(1, 2, 2);
plot(n, gn_smoothed, 'LineWidth', 1.5);
title('Smoothed Gain Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-2 2]);
grid on;

%%%
% Fig 3.11
lambda = 0.1;
c0 = 0.5;
rho = 10;
b = 1 - lambda;
a = [1, -lambda];
cn = filter(b, a, abs(x));

L = 7;
cn_smoothed = movmean(cn, L);
gn_smoothed = ones(1, length(cn_smoothed));
gn_smoothed(cn_smoothed <= c0) = (cn_smoothed(cn_smoothed <= c0) / c0) .^ (rho - 1);
yn_smoothed = gn_smoothed .* x;

figure('Name', 'Smoothed Output Signal vs Smoothed Gain Signal (3.10)');
subplot(1, 2, 1);
plot(n, yn_smoothed, 'LineWidth', 1.5);
title('Smoothed Output Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-5 5]);
grid on;
subplot(1, 2, 2);
plot(n, gn_smoothed, 'LineWidth', 1.5);
title('Smoothed Gain Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-2 2]);
grid on;

%% Homework3
% Here we want to replot figures3-6, 3-7 with rho=0.25
%
% Control Signal
lambda = 0.9;
c0 = 0.5;
rho = 0.25;
b = 1 - lambda;
a = [1, -lambda];
cn = filter(b, a, abs(x));
%%%
% Gain Signal
gn = ones(1, length(cn));
gn(cn >= c0) = (cn(cn >= c0) / c0) .^ (rho - 1);
yn = gn .* x;

%%%
% Plot Signals
%
% Fig 3.6
figure("Name", 'Input Signal vs Compressed Signal (3.6)');
subplot(1, 2, 1);
plot(n, x, 'LineWidth', 1.5);
title('Input Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-5 5]);
grid on;
subplot(1, 2, 2);
plot(n, yn, 'LineWidth', 1.5);
title('Compressed Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-5 5]);
grid on;

%%%
% Fig 3.7
figure('Name', 'Contol Signal vs Gain Signal (3.7)');
subplot(1, 2, 1);
plot(n, cn, 'LineWidth', 1.5);
title('Control Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 5]);
grid on;
subplot(1, 2, 2);
plot(n, gn, 'LineWidth', 1.5);
title('Gain Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 1.2]);
grid on;

%% Homework4
% Here we want to replot figures3-6, 3-7 with declared variables below
%
% Control Signal
lambda = 0.9;
c0 = 1.3;
rho = 0.5;
b = 1 - lambda;
a = [1, -lambda];
cn = filter(b, a, abs(x));
%%%
% Gain Signal
gn = ones(1, length(cn));
gn(cn >= c0) = (cn(cn >= c0) / c0) .^ (rho - 1);
yn = gn .* x;

%%%
% Plot Signals
%
% Fig 3.6
figure("Name", 'Input Signal vs Compressed Signal (3.6)');
subplot(1, 2, 1);
plot(n, x, 'LineWidth', 1.5);
title('Input Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-5 5]);
grid on;
subplot(1, 2, 2);
plot(n, yn, 'LineWidth', 1.5);
title('Compressed Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([-5 5]);
grid on;

%%%
% Fig 3.7
figure('Name', 'Contol Signal vs Gain Signal (3.7)');
subplot(1, 2, 1);
plot(n, cn, 'LineWidth', 1.5);
title('Control Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 5]);
grid on;
subplot(1, 2, 2);
plot(n, gn, 'LineWidth', 1.5);
title('Gain Signal');
xlabel('n');
ylabel('amplitude');
xlim([0 600]);
ylim([0 1.2]);
grid on;
