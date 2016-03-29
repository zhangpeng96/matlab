%%%%%%%
% @name: Universal Convolution Function Plus
% @author: Zhangpeng96
% @version: 1.1.1
%%%%%%%
function[f,k] = sconvs(f1, f2, k1, k2, p)
f = conv(f1, f2);
f = f * p;
k0 = k1(1) + k2(1);
k3 = length(f1) + length(f2) - 2;
k = k0: p: k3* p;
subplot(2,2,1);
plot(k1, f1);
title({'$$f_1(t)$$'},'Interpreter','latex');
xlabel({'$$t$$'},'Interpreter','latex');
ylabel({'$$f_1(t)$$'},'Interpreter','latex');
subplot(2,2,2);
plot(k2, f2);
title({'$$f_2(t)$$'},'Interpreter','latex');
xlabel({'$$t$$'},'Interpreter','latex');
ylabel({'$$f_2(t)$$'},'Interpreter','latex');
subplot(2,2,[3,4]);
plot(k, f);
title({'$$f_1(t)\star f_2(t)$$'},'Interpreter','latex');
xlabel({'$$t$$'},'Interpreter','latex');
ylabel({'$$f(t)$$'},'Interpreter','latex');
