

%Running this script depends on EEGLAB functions.

% Calculate coupling between large-scale networks
clear;


addpath('F:\matlab_toolbox\eeglab2022.1');%替换成你的
eeglab nogui;

% Simulate 7 signals, with a sampling rate of 1000 Hz and length of 10 seconds
signals_7_network = rand(7, 10000);

% Initialize a matrix to store coupling values between delta and theta bands
psi_matrix_delta_alpha = zeros(7, 7);

% Convert data to EEGLAB format and apply bandpass filtering
EEG = pop_importdata('dataformat','matlab','nbchan',0,'data',signals_7_network,'srate',1000,'pnts',0,'xmin',0);

% Apply bandpass filter for the delta band (1-4 Hz)
EEG_delta = pop_eegfiltnew(EEG, 'locutoff', 1, 'hicutoff', 4);

% Apply bandpass filter for the alpha band (8-12 Hz)
EEG_alpha = pop_eegfiltnew(EEG, 'locutoff', 8, 'hicutoff', 12);

% Calculate coupling between delta and theta bands
for i = 1:7
    for j = 1:7
        % Compute the phase synchronization between the i-th signal in the delta band and the j-th signal in the theta band
        psi_matrix_delta_alpha(i, j) = PPCfunction(EEG_delta.data(i, :), EEG_alpha.data(j, :), 1, 4); % For same-frequency, use 1:1 (n and m are the same signal)
    end
end

% Display the coupling matrix
disp(psi_matrix_delta_alpha);
