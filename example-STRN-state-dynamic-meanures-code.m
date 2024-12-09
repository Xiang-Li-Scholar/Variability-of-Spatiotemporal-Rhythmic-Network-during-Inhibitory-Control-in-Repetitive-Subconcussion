clear;clc;

% Define the state vector
% Each element represents the state of a time window, where the state is represented by an integer
state_vector = [1, 1, 2, 2, 3, 1, 2, 3, 3, 1, 1]; 

% Define the number of states
% This specifies the total distinct states in the analysis
num_states = 3;

% Calculate state statistics
% F: Frequency of occurrence of each state
% MDT: Mean dwell time of each state (average duration for which a state is continuously maintained)
% NT: Total number of transitions for each state
[F, MDT, NT] = STRN_state_stats_dynamic_meanures_function(state_vector', num_states) % Call the function with the state vector and number of states
disp(F)
disp(MDT)
disp(NT)