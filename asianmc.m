n_sample = 1e6;
S0=100; K=90; T=1.0; r=0.02; sigma=0.15; m=252; 
dt = T / m;
Tbar = mean(linspace(dt,T,m));
sigmabar_square = dot(linspace(2*m-1,1,m),linspace(dt,T,m))*sigma^2/m^2/Tbar;
sigmabar = sqrt(sigmabar_square);
delta = (sigma^2 - sigmabar_square)/2;
d = (log(S0/K)+(r-delta+sigmabar_square/2)*Tbar)/sigmabar/sqrt(Tbar);
EX = exp(-delta*Tbar-r*(T-Tbar))*S0*normcdf(d,0,1) - exp(-r*T)*K*normcdf(d-sigmabar*sqrt(Tbar),0,1);
fprintf('Tbar: %d, sigmabar: %d, delta: %d, E(X): %d.\n\n',Tbar,sigmabar,delta,EX);

x = zeros(1,n_sample);
y = zeros(1,n_sample);
s = zeros(1,m+1);
s(1) = S0;

rng(666);
for i = 1:n_sample
    w = sqrt(dt)*randn(1, m);
    for j = 2:m+1
        s(j)=s(j-1)*exp((r-sigma^2/2)*dt+sigma*w(j-1));
    end
    w = cumsum(w);
    x(i) = S0*exp((r-sigma^2/2)*Tbar+sigma*mean(w));
    y(i) = mean(s(2:m+1));
    if x(i) > K
        x(i) = exp(-r*T)*(x(i) - K);
    else
        x(i) = 0;
    end
    if y(i) > K
        y(i) = exp(-r*T)*(y(i) - K);
    else
        y(i) = 0;
    end
end

step = [1e2, 1e3, 1e4, 1e5, 1e6];
for i = 1:size(step,2)
    n = step(i);
    covmatrix = cov(x(1:n),y(1:n));
    b = covmatrix(1,1)/cov(x);
    Yb = y(1:n) - b*(x(1:n) -EX);
    my = mean(y(1:n));
    myb = mean(Yb); 
    ey = cov(y(1:n)) / n;
    coef = corrcoef(x(1:n), y(1:n));
    coef = coef(1,2);
    eyb =  cov(y(1:n)) / n * (1-coef^2);
    speedup = 1/(1-coef^2);
    fprintf('n is %d, price is %d, price with control variate is %d.\n', n, my, myb);
    fprintf('error estimation is %d, error estimation with control variate is %d,\n', ey, eyb);
    fprintf('correlation coefficient is %d, speedup is %d.\n\n', coef, speedup);
end
    

    


    



