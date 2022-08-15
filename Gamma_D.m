function pd = Gamma_D(N)
matrixcircle.Day1 = 2*[readmatrix(['N' num2str(N) ' Day1.txt'])]*1.83;
matrixcircle.Day2 = 2*[readmatrix(['N' num2str(N) ' Day2.txt'])]*1.83;
matrixcircle.Day3 = 2*[readmatrix(['N' num2str(N) ' Day3.txt'])]*1.83;
%matrixcircle.Day3 = matrixcircle.Day3(matrixcircle.Day3 > 360);
matrixcircle.Day4 = 2*[readmatrix(['N' num2str(N) ' Day4.txt'])]*1.83;
%matrixcircle.Day5 = 2*[readmatrix(['N' num2str(N) ' Day5.txt'])]*1.83;
%five = matrixcircle.Day5;
four = matrixcircle.Day4;
three= matrixcircle.Day3;
two = matrixcircle.Day2;
one = matrixcircle.Day1;

one = one(~isinf( one ));
two = two(~isinf( two ));
three = three(~isinf( three ));
four = four(~isinf( four ));
%five = five(~isinf( five ));


one = one(~isnan( one ));
two = two(~isnan( two ));
three = three(~isnan( three ));
four = four(~isnan( four ));
%five = five(~isnan( five ));

% pd5 = fitdist(five', 'gamma');
% [muhat5,~] = gamfit(five');
% histogram(five, 'BinMethod', 'integers')
% count1 = sum(five(five == mode(five)))/mode(five);
  x = 0:0.2:500;
% y1 = gampdf(x, muhat5(1), muhat5(2));
% hold on
% plot(x,(count1/max(y1)).*y1);
% legend('Raw Data', ['Gamma Fit ' num2str(muhat5(1)) ',' num2str(muhat5(2))])
% title(['N' num2str(N) ' Day 5']);
% ylabel('Counts')
% xlabel('Cell Size (uM)')
% saveas(gcf, 'Day 5 Gamma Fit.png')
% hold off


pd4 = fitdist(four', 'gamma');
[muhat4,~] = gamfit(four');
histogram(four, 'BinMethod', 'integers')
count1 = sum(four(four == mode(four)))/mode(four);
%x = 0:0.2:500;
y1 = gampdf(x, muhat4(1), muhat4(2));
hold on
plot(x,(count1/max(y1)).*y1);
legend('Raw Data', ['Gamma Fit ' num2str(muhat4(1)) ',' num2str(muhat4(2))])
title(['N' num2str(N) ' Day 4']);
ylabel('Counts')
xlabel('Cell Size (uM)')
saveas(gcf, 'Day 4 Gamma Fit.png')
hold off

pd3 = fitdist(three', 'gamma');
[muhat3,~] = gamfit(three');
histogram(three, 'BinMethod', 'integers')
count1 = sum(three(three == mode(three)))/mode(three);
%x = 0:0.2:500;
y1 = gampdf(x, muhat3(1), muhat3(2));
hold on
plot(x,(count1/max(y1)).*y1);
legend('Raw Data', ['Gamma Fit ' num2str(muhat3(1)) ',' num2str(muhat3(2))])
title(['N' num2str(N) ' Day 3']);
ylabel('Counts')
xlabel('Cell Size (uM)')
saveas(gcf, 'Day 3 Gamma Fit.png')
hold off


pd2 = fitdist(two', 'gamma');
[muhat2,~] = gamfit(two');
histogram(two, 'BinMethod', 'integers')
count1 = sum(two(two == mode(two)))/mode(two);
%x = 0:0.2:500;
y1 = gampdf(x, muhat2(1), muhat2(2));
hold on
plot(x,(count1/max(y1)).*y1);
legend('Raw Data', ['Gamma Fit ' num2str(muhat2(1)) ',' num2str(muhat2(2))])
title(['N' num2str(N) ' Day 2']);
ylabel('Counts')
xlabel('Cell Size (uM)')
saveas(gcf, 'Day 2 Gamma Fit.png')
hold off

pd1 = fitdist(one', 'gamma');
[muhat1,~] = gamfit(one');
histogram(one, 'BinMethod', 'integers')
count1 = sum(one(one == mode(one)))/mode(one);
%x = 0:0.2:500;
y1 = gampdf(x, muhat1(1), muhat1(2));
hold on
plot(x,(count1/max(y1)).*y1);
legend('Raw Data', ['Gamma Fit ' num2str(muhat1(1)) ',' num2str(muhat1(2))])
title(['N' num2str(N) ' Day 1']);
saveas(gcf, 'Day 1 Gamma Fit.png')
ylabel('Counts')
xlabel('Cell Size (uM)')
hold off

muhats = [muhat1' muhat2' muhat3' muhat4']% muhat5'];
x = [1 2 3 4 ]%5];
yyaxis left
plot(x, muhats(1,:), '*-');
ylabel('Shape Value')
yyaxis right
plot(x,(muhats(2,:)).^-1, '*-');
xlabel('Days')
hold on
ylabel('Rate Value')
f2 = fit(x',[muhats(2,:).^-1]', 'exp1');
plot(f2,x,muhats(2,:).^-1);

legend('A value (Gamma Shape)', '1/B value (Gamma Rate)', ['Exponential Trend Line for Rate Parameter ' num2str(f2.b)]  , 'Location' , 'northeast')
title(['N' num2str(N) '  Diameter Trends'])
saveas(gcf, ['N' num2str(N) ' Parameter_Trends_Diameter.png'])
end