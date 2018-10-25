N = 10000;
XN = zeros(1,N+1);
  for i = 0:N 
    XN(i+1)=randomwalk(i,0.5);
  end
plot(XN);
xlim([0 10000]);
xlabel('n');
ylabel('Xn');