function [F,  MDT, NT] = strn_state_stats(a, k)

Nwin = length(a);

%% Fraction of time spent in each state
F = zeros(1,k);
for jj = 1:k
    F(jj) = (sum(a == jj))/Nwin;
end

%% Number of Transitions
NT = sum(abs(diff(a)) > 0);

%% Mean dwell time in each state
MDT = zeros(1,k);
for jj = 1:k
    start_t = find(diff(a==jj) == 1);
    end_t = find(diff(a==jj) == -1);
    if a(1)==jj
        start_t = [0; start_t];
    end
    if a(end) == jj
        end_t = [end_t; Nwin];
    end
    MDT(jj) = mean(end_t-start_t);
    if isempty(end_t) && isempty(start_t)
        MDT(jj) = 0;
    end
end



end




