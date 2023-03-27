function f_x = Topic3_DD_Eval(div_diff, x, xi)

n = max(size(div_diff));
I = ones(size(x));

f_x = div_diff(n)*I;
for i = fliplr(1:(n-1))
    f_x = f_x .* (x-xi(i)) + div_diff(i)*I;
end
end