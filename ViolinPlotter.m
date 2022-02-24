function ViolinPlotter(N)

csvFiles = dir([pwd '/*.txt']); 
%N = 4;
%1.83 allothers
%1.83 for others
L = 1;
%matrixrad.Day1mean = nanmean(2*([readmatrix(['N' num2str(N) ' Day1.txt'])].^L)*1.83);
%matrixrad.Day2mean = nanmean(2*([readmatrix(['N' num2str(N) ' Day2.txt'])].^L)*1.83);
matrixrad.Day3mean = nanmean(2*([readmatrix(['N' num2str(N) ' Day3.txt'])].^L)*1.83);
%matrixrad.Day4mean = nanmean(2*([readmatrix(['N' num2str(N) ' Day4.txt'])].^L)*1.83);
%matrixrad.Day5mean = nanmean(2*([readmatrix(['N' num2str(N) ' Day5.txt'])].^L)*1.83);
%matrixradd.Day0 = nanstd([readmatrix('N300 Day0.txt')']*1.83);
%matrixrad.Day1std = nanstd(2*([readmatrix(['N' num2str(N) ' Day1.txt'])].^L)*1.83);
%matrixrad.Day2std = nanstd(2*([readmatrix(['N' num2str(N) ' Day2.txt'])].^L)*1.83);
matrixrad.Day3std = nanstd(2*([readmatrix(['N' num2str(N) ' Day3.txt'])].^L)*1.83);
%matrixrad.Day4std = nanstd(2*([readmatrix(['N' num2str(N) ' Day4.txt'])].^L)*1.83);
%matrixrad.Day5std = nanstd(2*([readmatrix(['N' num2str(N) ' Day5.txt'])].^L)*1.83);
filename3 = ['N' num2str(N) ' DiameterData.txt'];
writetable(struct2table(matrixrad), filename3);
%matrixradc.Day0 = nanmean([readmatrix('N300 Day0circle.txt')']);
%matrixradc.Day1 = nanmean([readmatrix(['N' num2str(N) ' Day1circle.txt'])]);
%matrixradc.Day2 = nanmean([readmatrix(['N' num2str(N) ' Day2circle.txt'])]);
matrixradc.Day3 = nanmean([readmatrix(['N' num2str(N) ' Day3circle.txt'])]);
%matrixradc.Day4 = nanmean([readmatrix(['N' num2str(N) ' Day4circle.txt'])]);
%matrixradc.Day5 = nanmean([readmatrix(['N' num2str(N) ' Day5circle.txt'])]);
%matrixraddc.Day0 = nanstd([readmatrix('N300 Day0circle.txt')']);
%matrixraddc.Day1 = nanstd([readmatrix(['N' num2str(N) ' Day1circle.txt'])]);
%matrixraddc.Day2 = nanstd([readmatrix(['N' num2str(N) ' Day2circle.txt'])]);
matrixraddc.Day3 = nanstd([readmatrix(['N' num2str(N) ' Day3circle.txt'])]);
%matrixraddc.Day4 = nanstd([readmatrix(['N' num2str(N) ' Day4circle.txt'])]);
%matrixraddc.Day5 = nanstd([readmatrix(['N' num2str(N) ' Day5circle.txt'])]);
%av = mean([matrixrad.Day0 matrixrad.Day1 matrixrad.Day2 matrixrad.Day3 matrixrad.Day4 matrixrad.Day5]);
%prnum(av);
%stdev = std([matrixrad.Day0 matrixrad.Day1 matrixrad.Day2 matrixrad.Day3 matrixrad.Day4 matrixrad.Day5]);
%prnum(std);
%Day3c = [readmatrix('N11 Day3.txt')]*1.83;
%matrixcircle.Day0 = 2*[readmatrix('N300 Day0.txt')]*1.83;
%matrixcircle.Day1 = 2*[readmatrix(['N' num2str(N) ' Day1.txt'])]*1.83;
%matrixcircle.Day2 = 2*[readmatrix(['N' num2str(N) ' Day2.txt'])]*1.83;
matrixcircle.Day3 = 2*[readmatrix(['N' num2str(N) ' Day3.txt'])]*1.83;
%matrixcircle.Day3 = matrixcircle.Day3(matrixcircle.Day3 > 360);
%matrixcircle.Day4 = 2*[readmatrix(['N' num2str(N) ' Day4.txt'])]*1.83;
%matrixcircle.Day5 = 2*[readmatrix(['N' num2str(N) ' Day5.txt'])]*1.83;
%Day1c = 2*[readmatrix(['N' num2str(N) ' Day1.txt'])]*1.83;
%Day2c = 2*[readmatrix(['N' num2str(N) ' Day2.txt'])]*1.83;
Day3c = 2*[readmatrix(['N' num2str(N) ' Day3.txt'])]*1.83;
%Day4c = 2*[readmatrix(['N' num2str(N) ' Day4.txt'])]*1.83;
%Day5c = 2*[readmatrix(['N' num2str(N) ' Day5.txt'])]*1.83;
% matrixcircle.Day1 = Day1c(Day1c < 250);
% matrixcircle.Day2 = Day2c(Day2c < 500);
% matrixcircle.Day3 = Day3c(Day3c < 800);
% matrixcircle.Day4 = Day4c(Day4c < 900);
% matrixcircle.Day5 = Day5c(Day5c < 800);
%Day0 = [readmatrix('N300 Day0circle.txt')];
%Day1 = [readmatrix(['N' num2str(N) ' Day1circle.txt'])];
%Day2 = [readmatrix(['N' num2str(N) ' Day2circle.txt'])];
Day3 = [readmatrix(['N' num2str(N) ' Day3circle.txt'])];
%Day4 = [readmatrix(['N' num2str(N) ' Day4circle.txt'])];
%Day5 = [readmatrix(['N' num2str(N) ' Day5circle.txt'])];
%Day0 = Day0(~isinf( Day0 ));
%Day1 = Day1(~isinf( Day1 ));
%Day2 = Day2(~isinf( Day2 ));
Day3 = Day3(~isinf( Day3 ));
%Day4 = Day4(~isinf( Day4 ));
%Day5 = Day5(~isinf( Day5 ));

%matrixc.Day0 = Day0(Day0 < 1);
%matrixc.Day1 = Day1(Day1 < 1);
%matrixc.Day2 = Day2(Day2 < 1);
matrixc.Day3 = Day3(Day3 < 1);
%matrixc.Day4 = Day4(Day4 < 0.97);
%matrixc.Day5 = Day5(Day5 < 1);



%matrixcd.Day0 = mean(Day0(Day0 < 1));
%matrixcd.Day1cmean = mean(Day1(Day1 < 1));
%matrixcd.Day2cmean = mean(Day2(Day2 < 1));
matrixcd.Day3cmean = mean(Day3(Day3 < 1));
%matrixcd.Day4cmean = mean(Day4(Day4 < 1));
%matrixcd.Day5cmean = mean(Day5(Day5 < 1));

%matrixcdd.Day0 = std(Day0(Day0 < 1));
%matrixcd.Day1cstd = std(Day1(Day1 < 1));
%matrixcd.Day2cstd = std(Day2(Day2 < 1));
matrixcd.Day3cstd = std(Day3(Day3 < 1));
%matrixcd.Day4cstd = std(Day4(Day4 < 1));
%matrixcd.Day5cstd = std(Day5(Day5 < 1));

filename4 = ['N' num2str(N) ' CircularityData.txt'];
writetable(struct2table(matrixcd), filename4);


% bigmatrix = normalize([Day0c Day1c Day2c Day3c Day4c Day5c],'range');
% 
% 
% 
% 
% 
% matrixcircle.Day0 = normalize(Day0c, 'range');
% matrixcircle.Day1 = normalize(Day1c, 'range');
% matrixcircle.Day2 = normalize(Day2c, 'range');
% matrixcircle.Day3 = normalize(Day3c, 'range');
% matrixcircle.Day4 = normalize(Day4c, 'range');
% matrixcircle.Day5 = normalize(Day5c(3:end), 'range');

y1=350*ones(7);
y2=400*ones(7);


figure(1),violinplot(matrixcircle);
set(gca, 'FontSize', 16)
xlabel('Days', 'FontSize', 16)
ylabel('Diameter (uM)', 'FontSize', 16)
title(['N' num2str(N) ' Diameter Sizes'], 'FontSize', 16)
%title(['N' '2 Replicate' ' Diameter Sizes'], 'FontSize', 16)
set(gcf, 'Position',  [900, 100, 552, 310])
hold on
plot(y1,'r--')
plot(y2, 'r--')
filename2 = ['N' num2str(N) ' Diameter Sizes.png'];
saveas(gcf, filename2);

figure(2),violinplot(matrixc);
set(gca, 'FontSize', 16)
xlabel('Days', 'FontSize', 16)
ylim([0 1])
ylabel('Circularity Ratio', 'FontSize', 16)
title(['N' num2str(N) ' Circularity Ratio'], 'FontSize', 16)
%title(['N' '2 Replicate' ' Circularity Ratio'], 'FontSize', 16)
set(gcf, 'Position',  [100, 100, 552, 310])
filename4 = ['N' num2str(N) ' Circularity Ratio.png'];
saveas(gcf, filename4);

%barplots
% figure(3),histogram(matrixcircle.Day1, [0 250 300 450 650], 'Normalization', 'probability')
% xlabel('Diameter (uM)', 'FontSize', 16)
% title(['N' num2str(N) ' Diameter Percentage Histogram Day 1'], 'FontSize', 16)
% set(gcf, 'Position',  [400, 400, 552, 310])
% ylabel('Fraction', 'FontSize', 16)
% filename5 = ['N' num2str(N) ' Day1 Histogram.png'];
% saveas(gcf, filename5);
% 
% figure(4),histogram(matrixcircle.Day2, [0 250 300 450 650], 'Normalization', 'probability')
% xlabel('Diameter (uM)', 'FontSize', 16)
% title(['N' num2str(N) ' Diameter Percentage Histogram Day 2'], 'FontSize', 16)
% set(gcf, 'Position',  [700, 700, 552, 310])
% ylabel('Fraction', 'FontSize', 16)
% filename5 = ['N' num2str(N) ' Day2 Histogram.png'];
% saveas(gcf, filename5);

figure(5),histogram(matrixcircle.Day3, [0 250 300 450 650], 'Normalization', 'probability')
xlabel('Diameter (uM)', 'FontSize', 16)
ylabel('Fraction', 'FontSize', 16)
title(['N' num2str(N) ' Diameter Percentage Histogram Day 3'], 'FontSize', 16)
set(gcf, 'Position',  [300, 900, 552, 310])
ylabel('Fraction', 'FontSize', 16)
filename6 = ['N' num2str(N) ' Day3 Histogram.png'];
saveas(gcf, filename6);

% figure(5),histogram(matrixcircle.Day4, [0 250 300 450 650], 'Normalization', 'probability')
% xlabel('Diameter (uM)', 'FontSize', 16)
% ylabel('Fraction', 'FontSize', 16)
% title(['N' num2str(N) ' Diameter Percentage Histogram Day 4'], 'FontSize', 16)
% set(gcf, 'Position',  [200, 1200, 552, 310])
% filename7 = ['N' num2str(N) ' Day4 Histogram.png'];
% saveas(gcf, filename7);
% 
% figure(5),histogram(matrixcircle.Day5, [0 250 300 450 650], 'Normalization', 'probability')
% xlabel('Diameter (uM)', 'FontSize', 16)
% ylabel('Fraction', 'FontSize', 16)
% title(['N' num2str(N) ' Diameter Percentage Histogram Day 5'], 'FontSize', 16)
% set(gcf, 'Position',  [600, 600, 552, 310])
% filename8 = ['N' num2str(N) ' Day5 Histogram.png'];
% saveas(gcf, filename8);
% java.lang.Thread.sleep(10*1000)
close all

end