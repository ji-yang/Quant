P=[0.2 0.8;0.25 0.75];
Nold = [50000 650000];
Nnew = Nold*P;
while ~isequal(Nnew,Nold)
    Nold = Nnew;
    Nnew = Nold*P;
end
