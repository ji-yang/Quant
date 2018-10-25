clear

S = 10;
lambda = 4;
T = 3;
M = round(10*sqrt(lambda * T));

%% generate Poisson
U = rand(S,M);
tau = -log(1-U) / lambda;
tauTilde = cumsum(tau, 2);
tauTilde = [zeros(S,1),tauTilde];
N = repmat(0:M,S,1);

%% cutoff process at time T
ind = find(tauTilde > T);
tauTilde(ind) = T;
N(ind) = nan;

%% plot
stairs(tauTilde',N');