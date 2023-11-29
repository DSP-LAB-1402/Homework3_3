%% *Homework3_3*
%% Clear workspace
close all;
clear;
clc;
%% Homework1
t = linspace(1, 100, 300);
f = 100;

for i = 0
    x = A(i) * cos(2 * pi * f * t);
    x_mean = (2 * pi) / A;
    x_2 = 0.5 * A ^ 2;
end

%% Homework2
A
w0 = pi * 0.15;
n = [0:199; 200:399; 400:599];
A = [2 4 0.5];
x = cos(w0 * n) .* A';
x = x';
x = x';
figure('Name', 'Cos');
plot(x);
y = [];
