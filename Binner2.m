function Binner2(N)
csvFiles = dir([pwd '/*.txt']); 
L = 1;
%matrixcircle.Day1 = 2*([readmatrix(['N' num2str(N) ' Day1.txt'])].^L)*1.83;
%matrixcircle.Day2 = 2*([readmatrix(['N' num2str(N) ' Day2.txt'])].^L)*1.83;
matrixcircle.Day3 = 2*([readmatrix(['N' num2str(N) ' Day3.txt'])].^L)*1.83;
%matrixcircle.Day3 = matrixcircle.Day3(matrixcircle.Day3 > 360);
%matrixcircle.Day4 = 2*([readmatrix(['N' num2str(N) ' Day4.txt'])].^L)*1.83;
%matrixcircle.Day5 = 2*([readmatrix(['N' num2str(N) ' Day5.txt'])].^L)*1.83;
%Day1c = 2*([readmatrix(['N' num2str(N) ' Day1.txt'])].^L)*1.83;
%Day2c = 2*([readmatrix(['N' num2str(N) ' Day2.txt'])].^L)*1.83;
Day3c = 2*([readmatrix(['N' num2str(N) ' Day3.txt'])].^L)*1.83;
%Day4c = 2*([readmatrix(['N' num2str(N) ' Day4.txt'])].^L)*1.83;
%Day5c = 2*([readmatrix(['N' num2str(N) ' Day5.txt'])].^L)*1.83;

%Day1normal = 2*([readmatrix(['N' num2str(N) ' Day1.txt'])].^1)*1.83;
%Day2normal = 2*([readmatrix(['N' num2str(N) ' Day2.txt'])].^1)*1.83;
Day3normal = 2*([readmatrix(['N' num2str(N) ' Day3.txt'])].^1)*1.83;
%Day4normal = 2*([readmatrix(['N' num2str(N) ' Day4.txt'])].^1)*1.83;
%Day5normal = 2*([readmatrix(['N' num2str(N) ' Day5.txt'])].^1)*1.83;

%matrixcircle.Day1 = matrixcircle.Day1(~isnan(matrixcircle.Day1));
%matrixcircle.Day2 = matrixcircle.Day2(~isnan(matrixcircle.Day2));
matrixcircle.Day3 = matrixcircle.Day3(~isnan(matrixcircle.Day3));
%matrixcircle.Day4 = matrixcircle.Day4(~isnan(matrixcircle.Day4));
%matrixcircle.Day5 = matrixcircle.Day5(~isnan(matrixcircle.Day5));

%Day1normal = Day1normal(~isnan(Day1normal));
%Day2normal = Day2normal(~isnan(Day2normal));
Day3normal = Day3normal(~isnan(Day3normal));
%Day4normal = Day4normal(~isnan(Day4normal));
%Day5normal = Day5normal(~isnan(Day5normal));

%Day1sum = sum((matrixcircle.Day1));
%Day2sum = sum((matrixcircle.Day2));
Day3sum = sum((matrixcircle.Day3));
%Day4sum = sum((matrixcircle.Day4));
%Day5sum = sum((matrixcircle.Day5));

%Day1percentage = matrixcircle.Day1./Day1sum;
%Day2percentage = matrixcircle.Day2./Day2sum;
Day3percentage = matrixcircle.Day3./Day3sum;
%Day4percentage = matrixcircle.Day4./Day4sum;
%Day5percentage = matrixcircle.Day5./Day5sum;

%Day1combined = [Day1normal;Day1percentage];
%Day2combined = [Day2normal;Day2percentage];
Day3combined = [Day3normal;Day3percentage];
%Day4combined = [Day4normal;Day4percentage];
%Day5combined = [Day5normal;Day5percentage];

%Day1Bin1 = sum(Day1percentage(Day1normal<=250 & Day1normal > 0));
%Day1Bin2 = sum(Day1percentage(Day1normal<=300 & Day1normal > 250));
%Day1Bin3 = sum(Day1percentage(Day1normal<=450 & Day1normal >300));
%Day1Bin4 = sum(Day1percentage(Day1normal > 450));


%Day2Bin1 = sum(Day2percentage(Day2normal<=250 & Day2normal > 0));
%Day2Bin2 = sum(Day2percentage(Day2normal<=300 & Day2normal > 250));
%Day2Bin3 = sum(Day2percentage(Day2normal<=450 & Day2normal >300));
%Day2Bin4 = sum(Day2percentage(Day2normal > 450));



Day3Bin1 = sum(Day3percentage(Day3normal<=250 & Day3normal > 0));
Day3Bin2 = sum(Day3percentage(Day3normal<=300 & Day3normal > 250));
Day3Bin3 = sum(Day3percentage(Day3normal<=450 & Day3normal >300));
Day3Bin4 = sum(Day3percentage(Day3normal > 450));



%Day4Bin1 = sum(Day4percentage(Day4normal<=250 & Day4normal > 0));
%Day4Bin2 = sum(Day4percentage(Day4normal<=300 & Day4normal > 250));
%Day4Bin3 = sum(Day4percentage(Day4normal<=450 & Day4normal >300));
%Day4Bin4 = sum(Day4percentage(Day4normal > 450));


%Day4Bin1 = sum(Day4percentage(Day4normal<=250 & Day4normal > 0));
%Day4Bin2 = sum(Day4percentage(Day4normal<=300 & Day4normal > 250));
%Day4Bin3 = sum(Day4percentage(Day4normal<=450 & Day4normal >300));
%Day4Bin4 = sum(Day4percentage(Day4normal > 450));

%Day5Bin1 = sum(Day5percentage(Day5normal<=250 & Day5normal > 0));
%Day5Bin2 = sum(Day5percentage(Day5normal<=300 & Day5normal > 250));
%Day5Bin3 = sum(Day5percentage(Day5normal<=450 & Day5normal >300));
%Day5Bin4 = sum(Day5percentage(Day5normal > 450));

%binnermatrix = 100*[Day1Bin1 Day1Bin2 Day1Bin3 Day1Bin4 ...
%    Day2Bin1 Day2Bin2 Day2Bin3 Day2Bin4 ...
%    Day3Bin1 Day3Bin2 Day3Bin3 Day3Bin4 ...
%    Day4Bin1 Day4Bin2 Day4Bin3 Day4Bin4 ...
%    Day5Bin1 Day5Bin2 Day5Bin3 Day5Bin4];

binnermatrix = 100*[NaN NaN NaN NaN ...
    NaN NaN NaN NaN ...
    Day3Bin1 Day3Bin2 Day3Bin3 Day3Bin4 ...
    NaN NaN NaN NaN ...
    NaN NaN NaN NaN];




filename10 = ['N' num2str(N) ' Binned' num2str(L) '.txt'];
writematrix(binnermatrix,filename10);

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

% %barplots
% figure(3),h1 = histogram(matrixcircle.Day1, [0 250 300 450 650], 'Normalization', 'probability');
% xlabel('Diameter (uM)', 'FontSize', 16)
% title(['N' num2str(N) ' Diameter Percentage Histogram Day 1'], 'FontSize', 16)
% set(gcf, 'Position',  [400, 400, 552, 310])
% ylabel('Fraction', 'FontSize', 16)
% filename4 = ['N' num2str(N) ' Day1 Histogram.txt'];
% writematrix(h1.Values, filename4);
% %saveas(gcf, filename5);

% figure(4),h2 = histogram(matrixcircle.Day2, [0 250 300 450 650], 'Normalization', 'probability');
% xlabel('Diameter (uM)', 'FontSize', 16)
% title(['N' num2str(N) ' Diameter Percentage Histogram Day 2'], 'FontSize', 16)
% set(gcf, 'Position',  [700, 700, 552, 310])
% ylabel('Fraction', 'FontSize', 16)
% filename5 = ['N' num2str(N) ' Day2 Histogram.txt'];
% %saveas(gcf, filename5);
% writematrix(h2.Values, filename5);

figure(5),h3 = histogram(matrixcircle.Day3, [0 250 300 450 650], 'Normalization', 'probability');
xlabel('Diameter (uM)', 'FontSize', 16)
ylabel('Fraction', 'FontSize', 16)
title(['N' num2str(N) ' Diameter Percentage Histogram Day 3'], 'FontSize', 16);
set(gcf, 'Position',  [300, 900, 552, 310])
ylabel('Fraction', 'FontSize', 16)
filename6 = ['N' num2str(N) ' Day3 Histogram.txt'];
%saveas(gcf, filename6);
writematrix(h3.Values, filename6);

% figure(5),h4 = histogram(matrixcircle.Day4, [0 250 300 450 650], 'Normalization', 'probability');
% xlabel('Diameter (uM)', 'FontSize', 16)
% ylabel('Fraction', 'FontSize', 16)
% title(['N' num2str(N) ' Diameter Percentage Histogram Day 4'], 'FontSize', 16)
% set(gcf, 'Position',  [200, 1200, 552, 310])
% filename7 = ['N' num2str(N) ' Day4 Histogram.txt'];
% %saveas(gcf, filename7);
% writematrix(h4.Values, filename7);
% 
% figure(5),h5 = histogram(matrixcircle.Day5, [0 250 300 450 650], 'Normalization', 'probability');
% xlabel('Diameter (uM)', 'FontSize', 16)
% ylabel('Fraction', 'FontSize', 16)
% title(['N' num2str(N) ' Diameter Percentage Histogram Day 5'], 'FontSize', 16)
% set(gcf, 'Position',  [600, 600, 552, 310])
% filename8 = ['N' num2str(N) ' Day5 Histogram.txt'];
% %saveas(gcf, filename8);
% writematrix(h5.Values, filename8);
close all
end
