function f = root(x)
    b = 10/9;
    %f(1)=exp(-b*(2*x(1)-x(2)))-exp(2*b*(x(1)+x(2)));
    %f(2)=2*exp(-b*3*x(2))-exp(2*b*(x(1)+x(2)));
    f(1)=1/sqrt(b*(2*x(1)-x(2)))-1/sqrt(-2*b*(x(1)+x(2)));
    f(2)=2*1/sqrt(b*3*x(2))-1/sqrt(-2*b*(x(1)+x(2)));
end
