%% Laboration 2: TSM146 Grundkurs i matematisk statistik 

% Marcus Hansen: 2021-10-14

%% Uppgift 1.1

clc 
clear 

disp('Uppgift 1.1')
disp(' ')

X = normrnd(1,1,[1,5]); % Stickprov 1 med varians 1 och väntevärde 1 med 5 observationer 
Y = normrnd(1,1,[1,5]); % Stickprov 2 med varians 1 och väntevärde 1 med 5 observationer 
Y1 = Y+1; % Y med effekt, konstant 1 adderad 

histogram(X,5)
hold on 
histogram(Y1,5)
hold off 
legend({'Utan effekt','Med effekt'},'Location','northwest')



%% Uppgift 1.2 

clc 
clear 

disp('Uppgift 1.2')
disp(' ')

a = 0.05; 

counter = 0; 
for i=1:1000
    X = normrnd(1,1,[1,5]); % Stickprov 1 med varians 1 och väntevärde 1 med 5 observationer 
    Y = normrnd(1,1,[1,5]); % Stickprov 2 med varians 1 och väntevärde 1 med 5 observationer
    Y1 = Y + 1;
    [h,p] = ttest2(X,Y1,'Alpha',a);
        if p < a
            counter = counter + 1;
        else
            continue 
        end 
end 

andelen = counter/1000*100; 
output = [num2str(andelen), ' %', ' av t-testen är signifikanta vid signifikansnivå 0.05'];
disp(output)

disp(' ')
disp('------------------------------------------------------------------------')

%% Uppgift 1.3 

clc 
clear 

disp('Uppgift 1.3')
disp(' ')

a = 0.05; 

Effekt = [];
Styrka = [];
for j = linspace(0,5,10)
    Effekt(end+1) = j;
    E = ['Effekten ' num2str(j)];
    disp(E)
    disp(' ')
    counter = 0;
    for i=1:1000
        X = normrnd(1,1,[1,5]); % Stickprov 1 med varians 1 och väntevärde 1 med 5 observationer 
        Y = normrnd(1,1,[1,5]); % Stickprov 2 med varians 1 och väntevärde 1 med 5 observationer
        Y1 = Y + j;
        [h,p] = ttest2(X,Y1,'Alpha',a);
            if p < a
                counter = counter + 1;
            else
                continue 
            end
    end
Styrka(end+1) = counter/1000;
andelen = counter/1000 * 100;
output = [num2str(andelen), ' %', ' av t-testen är signifikanta vid en signifikansnivå 0.05'];
disp(output);
disp(' ')

end 

disp(' ')
disp('------------------------------------------------------------------------')

plot(Effekt,Styrka,'r','LineWidth',2)
title('Hur styrkan förändras när effekten ändras')
xlabel('Effekten')
ylabel('Styrkan')
axis([0 5.4 0 1.2])

%% Uppgift 1.4 

clc 
clear 

disp('Uppgift 1.4')
disp(' ')

a = 0.05; 

Stickprov = [];
Styrka = [];
for j = round(linspace(3,50,10))
    Stickprov(end+1) = j;
    S = ['Stickprov storlek ' num2str(j)];
    disp(S)
    disp(' ')
    counter = 0;
    for i=1:1000
        X = normrnd(1,1,[1,j]); % Stickprov 1 med varians 1 och väntevärde 1 med j observationer 
        Y = normrnd(1,1,[1,j]); % Stickprov 2 med varians 1 och väntevärde 1 med j observationer
        Y1 = Y + 1;
        [h,p] = ttest2(X,Y1,'Alpha',a);
            if p < a
                counter = counter + 1;
            else
                continue 
            end
    end
Styrka(end+1) = counter/1000;
andelen = counter/1000 * 100;
output = [num2str(andelen), ' %', ' av t-testen är signifikanta vid en signifikansnivå 0.05'];
disp(output);
disp(' ')

end 

disp(' ')
disp('------------------------------------------------------------------------')

plot(Stickprov,Styrka,'k','LineWidth',2)
title('Hur styrkan förändras när stickprovs storleken ändras')
xlabel('Stickprov')
ylabel('Styrkan')
axis([0  52 0 1.2])

%% Uppgift 1.5 

clc 
clear 

disp('Uppgift 1.5')
disp(' ')

a = 0.05; 

Varians = [];
Styrka = [];
for j = linspace(0.1,10,10)
    Varians(end+1) = j;
    S = ['Stickprov storlek ' num2str(j)];
    disp(S)
    disp(' ')
    counter = 0;
    for i=1:1000
        X = normrnd(1,j,[1,5]); % Stickprov 1 med varians j och väntevärde 1 med 5 observationer 
        Y = normrnd(1,j,[1,5]); % Stickprov 2 med varians j och väntevärde 1 med 5 observationer
        Y1 = Y + 1;
        [h,p] = ttest2(X,Y1,'Alpha',a);
            if p < a
                counter = counter + 1;
            else
                continue 
            end
    end
Styrka(end+1) = counter/1000;
andelen = counter/1000 * 100;
output = [num2str(andelen), ' %', ' av t-testen är signifikanta vid en signifikansnivå 0.05'];
disp(output);
disp(' ')

end 

disp(' ')
disp('------------------------------------------------------------------------')

plot(Varians,Styrka,'k','LineWidth',2)
title('Hur styrkan förändras när variansen ändras')
xlabel('Variansen')
ylabel('Styrka')
axis([0 10.2 0 1.2])

%% Del 2 




%% Uppgift 2.1 

clc 
clear 

disp('Uppgift 2.1')
disp(' ')

a = 0.05; 

counter = 0; 
counter1 = 0; 
for i=1:1000
    X = normrnd(1,1,[1,5]); % Stickprov 1 med varians 1 och väntevärde 1 med 5 observationer 
    Y = normrnd(1,1,[1,5]); % Stickprov 2 med varians 1 och väntevärde 1 med 5 observationer
    Y1 = Y + 1;
    [h,p] = ttest2(X,Y1,'Alpha',a);
    [p1] = ranksum(X,Y1,'Alpha',a);
        if p < a 
            counter = counter + 1;
        if p1 < a 
            counter1 = counter1 + 1; 
        end 
        end
end 

andelen = counter/1000*100; % andelen mha av ttest2 
andelen1 = counter1/1000 * 100; %andelen mha rangsummetest  

output = [num2str(andelen), ' %', ' av t-testen är signifikanta vid signifikansnivå 0.05 '];
output1 = [num2str(andelen1), ' %', ' av rangsummatesten är signifikanta vid signifikansnivå 0.05'];
disp(output)
disp(output1)



disp(' ')
disp('------------------------------------------------------------------------')

%% Uppgift 2.2 


clc 
clear 

disp('Uppgift 2.2')
disp(' ')

a = 0.05; 

StickprovS = [];
Styrka = [];
StyrkaR = [];
for j = round(linspace(5,25,10))
    StickprovS(end+1) = j; 
    counter = 0;
    counter1 = 0; 
    for i=1:1000
        X = normrnd(1,1,[1,j]); % Stickprov 1 med varians 1 och väntevärde 1 med j observationer 
        Y = normrnd(1,1,[1,j]); % Stickprov 2 med varians 1 och väntevärde 1 med j observationer
        Y1 = Y + 1;
        [h,p] = ttest2(X,Y1,'Alpha',a);
        [p1] = ranksum(X,Y1,'Alpha',a);
            if p < a
                counter = counter + 1;
            end 
            if p1 < a 
                counter1 = counter1 + 1; 
            end
    end
Styrka(end+1) = counter/1000; % Styrka flr t-test 
StyrkaR(end+1)= counter1/1000; % Styrka för rangsummetesten  

end 

disp(' ')
disp('------------------------------------------------------------------------')


plot(StickprovS,Styrka,'m','LineWidth',2)
hold on 
title('Jämförelse av styrka mellan t-test och ranksum')
xlabel('Stickprov')
ylabel('Styrkan')
plot(StickprovS,StyrkaR,'k','LineWidth',2)
hold off 
legend({'t-test','rangsummatest'},'Location','northwest') 

%% Uppgift 2.3 


clc 
clear 

disp('Uppgift 2.3')
disp(' ')

a = 0.05; 

StickprovS = [];
Styrka = [];
StyrkaR = [];
for j = round(linspace(5,25,10))
    StickprovS(end+1) = j; 
    counter = 0;
    counter1 = 0; 
    for i=1:1000
        X = gamrnd(1,1,[1,j]); % Stickprov 1 med alfa 1 och beta 1 med j observationer 
        Y = gamrnd(1,1,[1,j]); % Stickprov 2 med alfa 1 och beta 1 med j observationer
        Y1 = Y + 1;
        [h,p] = ttest2(X,Y1,'Alpha',a);
        [p1] = ranksum(X,Y1,'Alpha',a);
            if p < a
                counter = counter + 1;
            end
            if p1 < a 
                counter1 = counter1 + 1; 
            end
    end
Styrka(end+1) = counter/1000; % Styrka för t-test 
StyrkaR(end+1)= counter1/1000; % Styrka för ranksum 

end 

disp(' ')
disp('------------------------------------------------------------------------')

plot(StickprovS,Styrka,'m','LineWidth',2)
hold on 
plot(StickprovS,StyrkaR,'k','LineWidth',2)
title('Jämförelse av styrka mellan t-test och ranksum')
xlabel('Stickprov')
ylabel('Styrkan')
hold off 
legend({'t-test','rangsummatest'},'Location','northwest')

