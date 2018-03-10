clear all
tic

global Optimalvalue;
Optimalvalue = 0;
NP = 30;
FoodNumber = NP / 2;
SearchNumber = 5;
maxCycle = 50;
Limit = 5;

Foods= (rand(NP, 2)-0.5) * 20;
sol = Foods;
trial = zeros(NP);
Foodspath = Foods;

for i = 1:NP
	Fitness(i) = (sin(Foods(i, 1))./(Foods(i, 1)+eps)).*(sin(Foods(i, 2))./(Foods(i, 2)+eps));
end

Indfit = sort(Fitness);
Optimalvalue = Indfit(end);
iter = 1;
j = 1;

while (iter <= maxCycle)
	%%% Employed Bee %%%
	for i = 1:(FoodNumber)
		Param2Change = fix(rand * 2) + 1;
		neighbour = fix(rand * FoodNumber) + 1;
		while (neighbour == i)
			neighbour = fix(rand * (FoodNumber)) + 1;
		end
		sol(i, :) = Foods(i, :);

		sol(i, Param2Change) = Foods(i, Param2Change) + (Foods(i, Param2Change) - Foods(neighbour, Param2Change)) * (rand - 0.5) * 2;
		if (sol(i, Param2Change)>10 | sol(i,Param2Change)<-10)
			sol(i, Param2Change) = Foods(i, Param2Change);
		end
		FitnessSol = sin(sol(i, 1))./(sol(i, 1) + eps).*sin(sol(i, 2))./(sol(i, 2) + eps);
		if (Fitness > Fitness(i))
			Foods(i, :) = sol(i, :);
			Fitness(i) = FitnessSol;
			trial(i) = 0;
		else
			trial(i) = trial(i) + 1;
			if trial(i) > Limit
				Foods(i, :) = (rand(1, 2) - 0.5) * 20;
			end
		end
	end
	%%% Onlooker Bee %%%
	prob = (0.9 * Fitness ./ max(Fitness)) + 0.1;

	t = FoodNumber;
	i = 1;
	while (t < (NP - SearchNumber))
		t = t + 1;
		if (rand < prob(i))
			Param2Change = fix(rand * 2) + 1;
			neighbour = FoodNumber + fix(rand * (NP - FoodNumber - SearchNumber)) + 1;

			while (neighbour == t)
				neighbour = FoodNumber + fix(rand * (NP - FoodNumber - SearchNumber)) + 1;
			end

			sol(t, :) = Foods(t, :);
			sol(t, Param2Change) = Foods(i, Param2Change) + (Foods(i, Param2Change) - Foods(neighbour, Param2Change)) * (rand - 0.5) * 2;

			if (sol(t, Param2Change)>10 | sol(t, Param2Change)<-10)
				sol(t, Param2Change) = Foods(t, Param2Change);
			end

			FitnessSol = (sin(sol(t, 1))./(sol(t,1) + eps)).*(sin(sol(t, 2))./(sol(t, 2) + eps));

			if (FitnessSol > Fitness(t))
				Foods(t, :) = sol(t, :);
				Fitness(t) = FitnessSol;
				trial(t) = 0;
			else
				trial(t) = trial(t) + 1;
				if trial(t) > Limit
					Foods(t, :) = (rand(1, 2) - 0.5) * 20;
				end
			end
		end
		
		i = i + 1;
		if i == (FoodNumber + 1)
			i = 1;
		end
	end
	%%% Scout Bee %%%
	for i = (NP - SearchNumber + 1) : NP
		Foods(i, :) = (rand(1, 2) - 0.5) * 20;
		Fitness(i) = (sin(Foods(i, 1))./(Foods(i, 1) + eps)).*(sin(Foods(i, 2))./(Foods(i, 2) + eps));
	end

	ind = find(Fitness == max(Fitness));
	Max = Fitness(ind);
	if (Max > Optimalvalue)
		Optimalvalue = Max;
		GlobalParams = Foods(ind, :);
	end
	fprintf('iteration=%d, Optimalvalue=%d\n ', iter, Optimalvalue);
	Zuiyou(iter) = Optimalvalue;
	iter = iter + 1;
	Foodspath = [Foodspath Foods];
end

toc

%%% Draw %%%
figure(1)
plot(1 : maxCycle, Zuiyou)
axis([0, iter, 0, 1.2])
title('f(x,y)=sin(x)/x * sin(y)/y')
xlabel('迭代次数')
ylabel('函数值')
