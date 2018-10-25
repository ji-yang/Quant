WN = zeros(1,N);
for i = 1:N 
    WN(i)=XN(i) / sqrt(i);
end
plot(WN);
xlabel('n');
ylabel('Wn');