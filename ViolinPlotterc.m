function ViolinPlotterc
csvFiles = dir([pwd '/*.txt']); 


matrixrad.Day0 = mean([readmatrix('N11 Day0circle.txt')]*1);
matrixrad.Day1 = mean([readmatrix('N11 Day1circle.txt')]*1);
matrixrad.Day2 = mean([readmatrix('N11 Day2circle.txt')]*1);
matrixrad.Day3 = mean([readmatrix('N11 Day3circle.txt')]*1);
matrixrad.Day4 = mean([readmatrix('N11 Day4circle.txt')]*1);
matrixrad.Day5 = mean([readmatrix('N11 Day5circle.txt')]*1);
matrixradd.Day0 = std([readmatrix('N11 Day0circle.txt')]*1);
matrixradd.Day1 = std([readmatrix('N11 Day1circle.txt')]*1);
matrixradd.Day2 = std([readmatrix('N11 Day2circle.txt')]*1);
matrixradd.Day3 = std([readmatrix('N11 Day3circle.txt')]*1);
matrixradd.Day4 = std([readmatrix('N11 Day4circle.txt')]*1);
matrixradd.Day5 = std([readmatrix('N11 Day5circle.txt')]*1);
av = mean([matrixrad.Day0 matrixrad.Day1 matrixrad.Day2 matrixrad.Day3 matrixrad.Day4 matrixrad.Day5]);
print(av);
stdev = std([matrixrad.Day0 matrixrad.Day1 matrixrad.Day2 matrixrad.Day3 matrixrad.Day4 matrixrad.Day5]);
print(std);

Day0c = readmatrix('N3 Day0circle.txt');
Day1c = readmatrix('N3 Day1circle.txt');
Day2c = readmatrix('N3 Day2circle.txt');
Day3c = readmatrix('N3 Day3circle.txt');
Day4c = readmatrix('N3 Day4circle.txt');
Day5c = readmatrix('N3 Day5circle.txt');
Day0len = length(Day0c);
Day1len = length(Day1c);
Day2len = length(Day2c);
Day3len = length(Day3c);
Day4len = length(Day4c);
Day5len = length(Day5c);

bigmatrix = normalize([Day0c Day1c Day2c Day3c Day4c Day5c],'range');





matrixcircle.Day0 = normalize(Day0c, 'range');
matrixcircle.Day1 = normalize(Day1c, 'range');
matrixcircle.Day2 = normalize(Day2c, 'range');
matrixcircle.Day3 = normalize(Day3c, 'range');
matrixcircle.Day4 = normalize(Day4c, 'range');
matrixcircle.Day5 = normalize(Day5c(3:end), 'range');

figure(1),violinplot(matrixrad);
xlabel('Days')
ylabel('Radius (uM)')
title('N3 Radius Sizes')
figure(2),violinplot(matrixcircle);
xlabel('Days')
ylabel('Normalized Circle Score')
title('N3 Circle Score')

end