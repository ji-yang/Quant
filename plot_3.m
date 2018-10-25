N = 10000;
p = 0.25;
X = zeros(1,N+1);
for i = 2:N+1
    X(i) = X(i-1) + sign(p-rand);
end
plot(X);
xlim([0 10000]);
xlabel('step');
ylabel('X');
