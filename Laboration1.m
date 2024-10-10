%% Laboration 1: TSM146 Grundkurs i matematisk statistik 

% Marcus Hansen: 2021-10 

%% Uppgift 1.1 

clear
clc 

X = normrnd(0,1,[1,10000]); %stimulera ett stickprov med 10,000 observationer från en standardiserad normalfördelning (E=0, Var=1).

histogram(X) % visulerar slumptalen 
title('Normal') 

%% Uppgift 1.2 

clear 
clc

X = normrnd(0,1,[1,10000]); %Simulera ett stickprov av storlek 10 000 från en standardiserad normalfördelning
normplot(X) % normalfördelningsplotten
title('Normalfördelad')

%% Uppgift 1.3

clear
clc

X = trnd(3,[1,10000]); %stickprov storlek 10 000 från en t-fördelning med df=3 
Y1 = gamrnd(10,0.1,[1,10000]); %stickprov storlek 10 000 från en gammafördelning med parametrarna alfa= 10 och betal=0.1
Y2 = gamrnd(1,1,[1,10000]); %stickprov storlek 10 000 från en gammafördelning med parametrarna alfa= 1 och betal=1

% 
subplot(3,2,1)
normplot(X)
title('t-fördelning med frihetsgrad 3')
subplot(3,2,2)
histogram(X)
axis([-10,10,0,1500])

%
subplot(3,2,3)
normplot(Y1)
title('Gamma-fördelning (alfa=10,beta=0.1)')
subplot(3,2,4)
histogram(Y1)

%
subplot(3,2,5)
normplot(Y2)
title('Gamma-fördelning (alfa=1,beta=1)')
subplot(3,2,6)
histogram(Y2)

%% Uppgift 1.4 


clear
clc

X = trnd(3,[1,10]); %stickprov storlek 10 från en t-fördelning med df=3 
Y1 = gamrnd(10,0.1,[1,10]); %stickprov storlek 10 från en gammafördelning med parametrarna alfa= 10 och betal=0.1
Y2 = gamrnd(1,1,[1,10]); %stickprov storlek 10 från en gammafördelning med parametrarna alfa= 1 och betal=1

% 
subplot(3,2,1)
normplot(X)
title('t-fördelning med frihetsgrad 3')
subplot(3,2,2)
histogram(X)

%
subplot(3,2,3)
normplot(Y1)
title('Gamma-fördelning (alfa=10,beta=0.1)')
subplot(3,2,4)
histogram(Y1)

%
subplot(3,2,5)
normplot(Y2)
title('Gamma-fördelning (alfa=1,beta=1)')
subplot(3,2,6)
histogram(Y2)


%% Uppgift 2.1 

clear all
clc

disp('Uppgift 2.1')
disp(' ')

X = normrnd(1,4,[1,5]); 
n = 5; % sample size 
s = std(X); % stickprovs standardavikelsen 
xbar = mean(X); %stickprovsmedelvärdet 
sf = s/sqrt(n); % standard felet 
v = n - 1; % frihetsgraden 

kg = 0.95; % konfidensgrad 95%
alpha = 1 - kg; 
L = alpha/2; % nedre konfidensgränsen 
U = 1 - alpha/2; %övre konfidensgränsen 
bound = tinv([L U], v); %kritiska området för tvåsidigt KI
KI = xbar + bound*sf; % konfidensintervallet 

output = ['KI är ' ,'[',num2str(KI),']'];
disp(output)



%% Uppgift 2.2

clc 
clear 

disp('Uppgift 2.2')
disp(' ')

n = 5; 
conf = 0.95; % konfidensgrad 95%
alpha = 1 - conf; 
L = alpha/2; % nedre konfidensgränsen 
U = 1 - alpha/2; %övre konfidensgränsen 
v = n - 1; % frihetsgraden


counter=0; 
for i=1:10000
    X = normrnd(1,4,[1,5]); %
    xbar = mean(X); %stickprovsmedelvärdet 
    sf = std(X)/sqrt(n); % standard felet 
    bound = tinv([L U], v); %kritiska området för tvåsidigt KI  
    KI = xbar + bound*sf; % konfidensintervallet
        if KI(1) <= 1 && 1 <= KI(2) % Kollar om sanna väntevärdet ligger i intervallet 
                counter = counter + 1; % räknar hur många gånger   
        else 
            continue 
        end
end 

andel = counter/10000 * 100;
output=[num2str(andel), ' % av de 10 000 KI innehåller det sanna väntevärdet'];
disp(output) 


%% Uppgift 2.3 

clc 
clear

disp('Uppgift 2.3')
disp(' ')
n = 5; 
conf = 0.95; % konfidensgrad 95%
alpha = 1 - conf; 
L = alpha/2; % nedre konfidensgränsen 
U = 1 - alpha/2; %övre konfidensgränsen 
v = n - 1; % frihetsgraden

counter = 0; 
for i=1:10000
    X = gamrnd(1,1,[1,5]); % %stickprov storlek 5 från en gammafördelning med parametrarna alfa= 1 och betal=1
    xbar = mean(X); %stickprovsmedelvärdet 
    sf = std(X)/sqrt(n); % standard felet 
    bound = tinv([L U], v); %kritiska området för tvåsidigt KI
    KI = xbar + bound*sf; % konfidensintervallet
        if KI(1) <= 1 && 1 <= KI(2) % Kollar om sanna väntevärdet ligger i intervallet 
            counter = counter + 1; % räknar hur många gånger       
        else 
            continue 
        end
end 

andel = counter/100;
output=[num2str(andel), ' % av de 10 000 KI innehåller det sanna väntevärdet'];
disp(output) 

%% Uppgift 2.4 med (normrnd) 


clc 
clear all 

disp('Uppgift 2.4')
disp(' ')

n = 100; 
conf = 0.95; % konfidensgrad 95%
alpha = 1 - conf; 
L = alpha/2; % nedre konfidensgränsen 
U = 1 - alpha/2; %övre konfidensgränsen 
v = n - 1; % frihetsgraden


counter=0; 
for i=1:10000
    X = normrnd(1,4,[1,100]); %
    xbar = mean(X); %stickprovsmedelvärdet 
    sf = std(X)/sqrt(n); % standard felet 
    bound = tinv([L U], v); %kritiska området för tvåsidigt KI
    KI = xbar + bound*sf; % konfidensintervallet
        if KI(1) <= 1 && 1 <= KI(2) % Kollar om sanna väntevärdet ligger i intervallet 
            counter = counter + 1; % räknar hur många gånger       
        else 
            continue 
        end
end 

andel = counter/10000 * 100;
output=[num2str(andel), ' % av de 10 000 KI innehåller det sanna väntevärdet'];
disp(output) 


%% Uppgift 2.4 (gamrnd) 


clc 

disp('Uppgift 2.4')
disp(' ')

n = 100; 
conf = 0.95; % konfidensgrad 95%
alpha = 1 - conf; 
L = alpha/2; % nedre konfidensgränsen 
U = 1 - alpha/2; %övre konfidensgränsen 
v = n - 1; % frihetsgraden

counter = 0; 
for i=1:10000
    X = gamrnd(1,1,[1,100]); % %stickprov storlek 5 från en gammafördelning med parametrarna alfa= 1 och betal=1
    xbar = mean(X); %stickprovsmedelvärdet 
    sf = std(X)/sqrt(n); % standard felet 
    bound = tinv([L U], v); %kritiska området för tvåsidigt KI
    KI = xbar + bound*sf; % konfidensintervallet
        if KI(1) <= 1 && 1 <= KI(2) % Kollar om sanna väntevärdet ligger i intervallet 
            counter = counter + 1; % räknar hur många gånger       
        else 
            continue 
        end
end 

andel = counter/10000 * 100;
output=[num2str(andel), ' % av de 10 000 KI innehåller det sanna väntevärdet'];
disp(output) 

%% DEL 3 



%% Uppgift 3.1 

clc
clear all 

load('qnrS.mat');

disp('Uppgift 3.1')
disp(' ')

subplot(2,2,1)
normplot(qnrS1)
title('Exponerade av låga koncentrationer antibiotika')
subplot(2,2,2)
histogram(qnrS1)

subplot(2,2,3)
normplot(qnrS2)
title('Exponerade av höga koncentrationer antibiotika')
subplot(2,2,4)
histogram(qnrS2)

%% Uppgift 3.2 
 
clc 


disp('Uppgift 3.2')
disp(' ')

X = log(qnrS1);
Y = log(qnrS2);

subplot(2,2,1)
normplot(X)
subplot(2,2,2)
histogram(X)

subplot(2,2,3)
normplot(Y)
subplot(2,2,4)
histogram(Y)

%% Uppgift 3.3 

% Antag normalfördelad

load('qnrS.mat')

clc

disp('Uppgift 3.3')
disp(' ')

X = log(qnrS1);
Y = log(qnrS2);  

n = length(qnrS1); % sample size 
s = std(X); % stickprovs standardavikelsen 
xbar = mean(X); %stickprovsmedelvärdet 
sf = s/sqrt(n); % standard felet 
v = n - 1; % frihetsgraden 

kg = 0.99; % konfidensgrad 99%
alpha = 1 - kg; 
L = alpha/2; % nedre konfidensgränsen 
U = 1 - alpha/2; %övre konfidensgränsen 
bound = tinv([L U], v); %kritiska området för tvåsidigt KI 
KI1 = xbar + bound*sf; % konfidensintervallet 
output = [' Stickprov 1 har KI ','[',num2str(KI1),']'];
disp(output)

n = length(qnrS1); % sample size 
s = std(Y); % stickprovs standardavikelsen 
xbar = mean(Y); %stickprovsmedelvärdet 
sf = std(Y)/sqrt(n); % standard felet 
v = n - 1; % frihetsgraden 

kg = 0.99; % konfidensgrad 99%
alpha = 1 - kg; 
L = alpha/2; % nedre konfidensgränsen 
U = 1 - alpha/2; %övre konfidensgränsen 
bound = tinv([L U], v); %kritiska värden för den 99% KI 
KI2 = xbar + bound*sf; % konfidensintervallet 
output = [' Stickprov 2 har KI ' ,'[',num2str(KI2),']'];
disp(output)


%% Uppgift 3.5

clc

disp('Uppgift 3.5')
disp(' ')

load('qnrS.mat')

X  = log(qnrS1);
Y  = log(qnrS2); 

a = 0.01;
[h,p,ci] = ttest2(X,Y,'Alpha',a) 



%% Uppgift 3.6 

clc 
clear 

disp('Uppgift 3.6')
disp(' ')

load('qnrS.mat')

X = qnrS1; 
Y = qnrS2; 

a = 0.01;
[h,p,ci] = ttest2(X,Y,'Alpha',a)










