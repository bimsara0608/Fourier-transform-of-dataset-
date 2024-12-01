clear all;
close all;
clc;

data = load('monthssn.dat'); % data file 

x = data(:, 2);  % 2nd column
y = data(:, 4);  % 4th column


% Perform Fourier Transform
N = length(y);
Y_fft = fft(y);

Fs = 1;  % Sampling frequency
f = (0:N-1)*(Fs/N);

P = abs(Y_fft) / N;

[~, idx] = max(P(2:N/2));
f_dominant = f(idx);

% Calculate the period in months and convert to years
T_months = 1 / f_dominant;  % in months
T_years = T_months / 12;    % in years

% Display the result
fprintf('The approximate period of the sunspot cycle is %.2f years.\n', T_years);

