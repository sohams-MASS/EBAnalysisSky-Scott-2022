function Binner4(N)
csvFiles = dir([pwd '/*.txt']); 

for L = 1:3
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


% Day2Bin1 = sum(Day2percentage(Day2normal<=250 & Day2normal > 0));
% Day2Bin2 = sum(Day2percentage(Day2normal<=300 & Day2normal > 250));
% Day2Bin3 = sum(Day2percentage(Day2normal<=450 & Day2normal >300));
% Day2Bin4 = sum(Day2percentage(Day2normal > 450));



Day3Bin1 = sum(Day3percentage(Day3normal<=250 & Day3normal > 0));
Day3Bin2 = sum(Day3percentage(Day3normal<=300 & Day3normal > 250));
Day3Bin3 = sum(Day3percentage(Day3normal<=450 & Day3normal >300));
Day3Bin4 = sum(Day3percentage(Day3normal > 450));



% Day4Bin1 = sum(Day4percentage(Day4normal<=250 & Day4normal > 0));
% Day4Bin2 = sum(Day4percentage(Day4normal<=300 & Day4normal > 250));
% Day4Bin3 = sum(Day4percentage(Day4normal<=450 & Day4normal >300));
% Day4Bin4 = sum(Day4percentage(Day4normal > 450));


% Day4Bin1 = sum(Day4percentage(Day4normal<=250 & Day4normal > 0));
% Day4Bin2 = sum(Day4percentage(Day4normal<=300 & Day4normal > 250));
% Day4Bin3 = sum(Day4percentage(Day4normal<=450 & Day4normal >300));
% Day4Bin4 = sum(Day4percentage(Day4normal > 450));

% Day5Bin1 = sum(Day5percentage(Day5normal<=250 & Day5normal > 0));
% Day5Bin2 = sum(Day5percentage(Day5normal<=300 & Day5normal > 250));
% Day5Bin3 = sum(Day5percentage(Day5normal<=450 & Day5normal >300));
% Day5Bin4 = sum(Day5percentage(Day5normal > 450));



%matrixcircled.Day1 = (matrixcircle.Day1/(2*1.83));
%matrixcircled.Day2 = (matrixcircle.Day2/(2*1.83));
matrixcircled.Day3 = (matrixcircle.Day3/(2*1.83));
%matrixcircled.Day4 = (matrixcircle.Day4/(2*1.83));
%matrixcircled.Day5 = (matrixcircle.Day5/(2*1.83));

% [C1, ~, ic1] = unique(matrixcircled.Day1);
% a_counts1 = accumarray(ic1,1);
% value_counts1 = [C1', a_counts1];
% Ynew1 = (value_counts1(:,1).^L).*value_counts1(:,2);

% [C2, ~, ic2] = unique(matrixcircled.Day2);
% a_counts2 = accumarray(ic2,1);
% value_counts2 = [C2', a_counts2];
% Ynew2 = (value_counts2(:,1).^L).*value_counts2(:,2);

[C3, ~, ic3] = unique(matrixcircled.Day3);
a_counts3 = accumarray(ic3,1);
value_counts3 = [C3', a_counts3];
Ynew3 = (value_counts3(:,1).^L).*value_counts3(:,2);

% [C4, ~, ic4] = unique(matrixcircled.Day4);
% a_counts4 = accumarray(ic4,1);
% value_counts4 = [C4', a_counts4];
% Ynew4 = (value_counts4(:,1).^L).*value_counts4(:,2);
% 
% [C5, ~, ic5] = unique(matrixcircled.Day5);
% a_counts5 = accumarray(ic5,1);
% value_counts5 = [C5', a_counts5];
% Ynew5 = (value_counts5(:,1).^L).*value_counts5(:,2);

for i = 3
x = eval(['value_counts' num2str(i)]);
y = eval(['Ynew' num2str(i)]);
figure(L),bar(x(:,1).^(1/L), y);
set(gca, 'FontSize', 16)
xlabel('Diameter (uM)', 'FontSize', 16)
ylabel(['Diameter^' num2str(L) '(uM)^' num2str(L) '* Count'], 'FontSize', 16)
title(['N' num2str(N) ' Diameter Scale^' num2str(L) ' Day ' num2str(i)], 'FontSize', 16)
%title(['N' '2 Replicate' ' Diameter Sizes'], 'FontSize', 16)
set(gcf, 'Position',  [900, 100, 552, 310])
filename2 = ['N' num2str(N) ' Diameter' num2str(L) 'Sizes Day' num2str(i) '.png'];
saveas(gcf, filename2);
end

%matrixcircle.Day1 = log(Ynew1);
%matrixcircle.Day2 = log(Ynew2);
matrixcircle.Day3 = log(Ynew3);
%matrixcircle.Day4 = log(Ynew4);
%matrixcircle.Day5 = log(Ynew5);
figure(20+L),violinplot(matrixcircle);
set(gca, 'FontSize', 16)
xlabel('Days', 'FontSize', 16)
ylabel(['log (' 'Diameter^' num2str(L) '(uM)^' num2str(L) '* Count)'], 'FontSize', 16)
title(['N' num2str(N) ' Diameter Scale^' num2str(L)], 'FontSize', 16)
%title(['N' '2 Replicate' ' Diameter Sizes'], 'FontSize', 16)
set(gcf, 'Position',  [900, 100, 552, 310])
filename2 = ['N' num2str(N) ' Diameter' num2str(L) 'Sizes Violin Plot.png'];
saveas(gcf, filename2);



% 
% binnermatrix = 100*[Day1Bin1 Day1Bin2 Day1Bin3 Day1Bin4 ...
%     Day2Bin1 Day2Bin2 Day2Bin3 Day2Bin4 ...
%     Day3Bin1 Day3Bin2 Day3Bin3 Day3Bin4 ...
%     Day4Bin1 Day4Bin2 Day4Bin3 Day4Bin4 ...
%     Day5Bin1 Day5Bin2 Day5Bin3 Day5Bin4];

binnermatrix = 100*[NaN NaN NaN NaN ...
    NaN NaN NaN NaN ...
    Day3Bin1 Day3Bin2 Day3Bin3 Day3Bin4 ...
    NaN NaN NaN NaN ...
    NaN NaN NaN NaN];



%diametermatrix = [nanmean(Day1c)^(1/L) nanmean(Day2c)^(1/L) nanmean(Day3c)^(1/L) nanmean(Day4c)^(1/L) nanmean(Day5c)^(1/L) ...
%                  0 nanstd(Day1c)^(1/L) nanstd(Day2c)^(1/L) nanstd(Day3c)^(1/L) nanstd(Day4c)^(1/L) nanstd(Day5c)^(1/L)];

diametermatrix = [NaN NaN nanmean(Day3c)^(1/L) NaN NaN ...
                  0 NaN NaN nanstd(Day3c)^(1/L) NaN NaN];
              
              
writtenmatrix = [diametermatrix zeros(1,12) binnermatrix];


filename10 = ['N' num2str(N) ' Binned' num2str(L) '.txt'];
writematrix(writtenmatrix,filename10);
end
close all

end