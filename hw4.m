
M = 100;
T = 3;
lambda = 4;
tildeTau = zeros(10,100);
figure;
hold on
for i= 1:10
    U = rand(1,M);
    tau = -log(1-U)/lambda;
    tildeTau(i,:) = cumsum(tau);
    K = find(tildeTau(i,:) >= T);
    ind = min(K);
    N = 0:ind;
    stairs([0,tildeTau(i,1:ind)],N)   
end
xlim([0,3]);
hold off
