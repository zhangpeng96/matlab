%%%%%%%
% @name: Universal Convolution Function Plus
% @author: Zhangpeng96
% @version: 1.1.2
% @parameters: f1, f2, k1, k2, p
%		f1: f1(t)的非零样值向量
%		f2: f2(t)的非零样值向量
%		k1: f1(t)对应的时间向量
%		k2: f2(t)对应的时间向量
%		p: 抽样时间间隔
% @values: f, k
%		f: 卷积积分f(t)对应的非零样值向量
%		k: f(t)对应的时间向量
%%%%%
function[f,k] = sconvs(f1, f2, k1, k2, p);	%定义函数sconvs并返回向量组[f,k]
f = conv(f1, f2);							%计算函数f1和f2的卷积
f = f * p;
k0 = k1(1) + k2(1);							%计算序列f(t)非零样值的起点位置
k3 = length(f1) + length(f2) - 2;			%计算卷积和f的非零样值的宽度
k = k0: p: k3 * p;							%确定卷积和f的非零样值的时间向量
%以下为图像绘制脚本
subplot(2,2,1); plot(k1, f1);
title({'$$f_1(t)$$'},'Interpreter','latex');
xlabel({'$$t$$'},'Interpreter','latex');
ylabel({'$$f_1(t)$$'},'Interpreter','latex');
subplot(2,2,2); plot(k2, f2);
title({'$$f_2(t)$$'},'Interpreter','latex');
xlabel({'$$t$$'},'Interpreter','latex');
ylabel({'$$f_2(t)$$'},'Interpreter','latex');
subplot(2,2,[3,4]); plot(k, f);
title({'$$f_1(t)\ast f_2(t)$$'},'Interpreter','latex');
xlabel({'$$t$$'},'Interpreter','latex');
ylabel({'$$f(t)$$'},'Interpreter','latex');