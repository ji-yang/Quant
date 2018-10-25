deltat = 0.01;
t=0:deltat:1;
hold on
for k = 1:10
    x = zeros(1,101);
    x(1,1) = 0.5;
    a = 3;
    for i = 1:100
        xi = x(1,i);
        x(1,i+1) = xi - a^2 * xi^2 * (1-xi) * deltat + a*xi*(1-xi)*sqrt(deltat)*norminv(rand());
    end
    plot(t,x);
end
hold off