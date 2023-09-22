%fplot(@(x)exp(1)^(x^2-3)+x^3-1.5*x,'Linewidth',2);
fplot(@(x)0.1.*x.^3 + cos(0.5.*pi.*x.^2),'Linewidth',2);
axis([-4 4 -5 5]);
xline(0)
yline(0)
title('{\itResults}');
