%%%%%%%
% @name: Universal Convolution Function
% @author: Zhangpeng96
% @version: 1.0.0
%%%%%%%
function[f,k] = sconv(f1, f2, k1, k2, p)
f = conv(f1, f2);
f = f * p;
k0 = k1(1) + k2(1);
k3 = length(f1) + length(f2) - 2;
k = k0: p: k3* p;
subplot(2,2,1);
plot(k1, f1);
title('f1(t)');
xlabel('t');
ylabel('f1(t)');
subplot(2,2,2);
plot(k2, f2);
title('f2(t)');
xlabel('t');
ylabel('f2(t)');
subplot(2,2,3);
plot(k, f);
h = get(gca, 'position');
h(3) = 2.5 *h(3);
set(gca, 'position', h );
title('f(t)=f1(t)*f2(t)');
xlabel('t');
ylabel('f(t)');

