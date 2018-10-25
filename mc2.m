P=[0.5 0.25 0.25;0.5 0.25 0.25;0.25 0.375 0.375];
PIold = [1 0 0];
PInew = PIold*P;
while ~isequal(PIold,PInew)
    PIold = PInew;
    PInew = PIold*P;
end