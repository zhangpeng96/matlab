x = 0:0.001:pi;
y = sin(x);
g = cos(x);
plot(x, y, '-', x, g,'-.');
title({'$$y=\sin(x)$$ AND $$y\prime=\cos(x)$$ Function Graphes'},'Interpreter','latex');
xlabel({'$$x$$'},'Interpreter','latex');
ylabel({'$$y(x)$$'},'Interpreter','latex');
