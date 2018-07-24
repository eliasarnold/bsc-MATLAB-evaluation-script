function Diff = difference_6_to_50(DATA,PARAMETRIC)
    [n,~] = size(DATA); % n is the number of parameters we compare to the original ones
    from = min(6,n);
    to = min(50,n);
    Diff = 0;
    for i=from:to
        Diff = Diff + abs(DATA(i)-PARAMETRIC(i));
    end
    Diff = Diff/(to-from);
end