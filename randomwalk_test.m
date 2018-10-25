a=zeros(1,10000);
for i =1:10000
    a(i)=randomwalk(10000,0.5);
end
onem = sum(a)/10000;
twom = sum(a.^2)/10000;
threem = sum(a.^3)/10000;
fourm = sum(a.^4)/10000;