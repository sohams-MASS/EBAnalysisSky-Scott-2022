clear
currentdir = dir([pwd '/*.nd2']);
currentdirc = struct2table(currentdir);
[len,~] = size(currentdirc);
for i = 1:len
   try
    filenamec = table2array(currentdirc(i,1));
    filename =filenamec{1};
    %filename = filenamec{1};
        LL = 4 ;
    [convertedImage,~,~] = nd2read(filename);
    %imshow(convertedImage);
    newfilename = [filename(1:end-3) 'png'];
    imwrite(convertedImage, newfilename);
    imhandle = imread(newfilename);
    textfilename = [filename(1:end-4) int2str(LL) '.csv'];
    imhandle = imread(newfilename);
    %figure(1); imshow(imhandle)
    ibw = imhandle(:,:,1)+10;
    ibw = im2bw(imadjust(ibw),0.455);
    ibwn = ~ibw;
    filename3 = [filename(1:end-4) 'bw.png'];
    imwrite(ibw,filename3);
    [xDim, yDim] = size(ibw);
        %try
        %After Day 1 - can bump up to 0.92, otherwise 0.88 
        %Start 2ith 20-200 0.72
        %Then with 40-200 0.76
        %then with 60-200 0.80
        %Then 80-200 0.88
        %Then with 90-200 with 0.92
            figure(2); imshow(ibw);
            
            [centersm,radiim,metric]=imfindcircles(ibw,[90 200], 'ObjectPolarity', 'dark',...
                'Sensitivity',0.88, 'Method', 'TwoStage', 'EdgeThreshold', 0);
            
            
            
%             %[centerssm,radiism,metricsm]=imfindcircles(ibw,[10 30], 'ObjectPolarity', 'dark',...
%                 'Sensitivity',0.70, 'Method', 'TwoStage', 'EdgeThreshold', 0);
%             [centersbm,radiibm,metricbm]=imfindcircles(ibw,[30 90], 'ObjectPolarity', 'dark',...
%                 'Sensitivity',0.82, 'Method', 'TwoStage', 'EdgeThreshold', 0);
%             [centersbvm,radiibvm,metricbvm]=imfindcircles(ibw,[90 200], 'ObjectPolarity', 'dark',...
%                 'Sensitivity',0.88, 'Method', 'TwoStage', 'EdgeThreshold', 0);
%             [centersbbm,radiibbm,metricbbm]=imfindcircles(ibw,[200 500], 'ObjectPolarity', 'dark',...
%                 'Sensitivity',0.95, 'Method', 'TwoStage', 'EdgeThreshold', 0);
            centers2x=[];
            centers2y=[];
            radii2=[];
            metric2=[];
            xc = centersm(:,1);%; centersbm(:,1); centersbvm(:,1); centersbbm(:,1)];
            yc = centersm(:,2);%; centersbm(:,2); centersbvm(:,2); centersbbm(:,2)];
            radii = radiim;%; radiibm; radiibvm; radiibbm];
            centers = [xc yc];
            counters = 0;
            badindex=[];    
    
                    
            %Clean Inside Circles
            for cent = 1:numel(radii)
              Ytest = interp1([1 xDim], [1 2424], yc(cent) );
              Xtest = interp1([1 xDim], [1 2424], xc(cent) );        
  
                 for ii = 1:numel(radii)
                     %Determine edge points
%                      maskcheck = maskcheck | hypot(xx - xc(ii), yy - yc(ii)) <= radii(ii);
%                      maskcheck = boundarymask(maskcheck);
%                      indices = find(maskcheck);
%                      [rowc,colc] = ind2sub([xDim,yDim], indices);
%                      %Ycoords = interp1( [1 xDim], [1 2424], rowc );
%                      %Xcoords = interp1( [1 yDim], [1 2424], colc );
%                      Ytest = interp1([1 xDim], [1 2424], yc(cent) );
%                      Xtest = interp1([1 xDim], [1 2424], xc(cent) );
                     Ycent = interp1([1 xDim], [1 2424], yc(ii) );
                     Xcent = interp1([1 xDim], [1 2424], xc(ii) );
                     if cent ~= ii
                         %[in,on] = inpolygon(Xtest,Ytest,Xcoords,Ycoords);
                         if (Xtest-Xcent)^2 + (Ytest-Ycent)^2 <= (radii(ii)+7)^2
                            counters = counters + 1;
                         end
                     end
                 end
                 if counters > 0
                     centers2x(cent)=NaN;
                     centers2y(cent)=NaN;
                     radii2(cent) = NaN;
                     radii2(cent)=NaN;
                     %metric2(cent)=NaN;
                     badindex = [badindex cent];
                 else
                     centers2x(cent) = centers(cent,1);
                     centers2y(cent) = centers(cent,2);
                     radii2(cent) = radii(cent);
                     %metric2(cent)=metric(cent);
                  end
              
                     counters=0;
            end
            %h = viscircles([centers2x',centers2y'],radii2);
            %filename2 = [filename(1:end-4) 'clean1.png'];
            %saveas(gcf, filename2);
     %end 
          %centers2x, centers2y are the holded out radii centers 
           %Clean Edge Circles
           
           centers2x2 = [];
           centers2y2 = [];
           radii2y2 = [];
           [nrow, ncolumn] = size(ibw);
           for inr = 1:length(centers2x)
               %Count individual centers
               centerxinquestion = [centers2x(inr)-radii2(inr) centers2x(inr)+radii2(inr)];
               centeryinquestion = [centers2y(inr)-radii2(inr) centers2y(inr)+radii2(inr)];
               trutharray = centerxinquestion >= 0 & centerxinquestion <=ncolumn & centeryinquestion >=0 & centeryinquestion <=nrow;
               if all(trutharray)
                   centers2x2 = [centers2x2 centers2x(inr)];
                   centers2y2 = [centers2y2 centers2y(inr)];
                   radii2y2 = [radii2y2 radii2(inr)];
               end
           end
           
           %Redo Mask out found circles
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
            h = viscircles([centers2x2',centers2y2'],radii2y2);
           % h = viscircles(centers,radii);
            %h = viscircles(centers,radii);
            onfilename2 = [filename(1:end-4) 'clean2' int2str(LL) '.png'];
            saveas(gcf, onfilename2);
            xc = centers(:,1);
            yc = centers(:,2);
            [xx,yy] = meshgrid(1:yDim,1:xDim);
            
            maskbig = false(xDim,yDim);
            masksmall = false(xDim,yDim);

            metricn=[];
            
            for ii = 1:numel(radii2y2)
                try
                maskbig = maskbig | hypot(xx - centers2x2(ii), yy - centers2y2(ii)) <= radii2y2(ii)+4;
                
                [B,L] = bwboundaries(ibwn.*maskbig,'noholes');
                stats = regionprops(L,'Area','Centroid');
                boundary = B;
                for k = 1 
                    boundary = B{k};
                    delta_sq = diff(boundary).^2;    
                    perimeter = sum(sqrt(sum(delta_sq,2)));
                    area = stats(k).Area;
                    metricbig = 4*pi*area/perimeter^2;
                end
                masksmall = masksmall | hypot(xx - centers2x2(ii), yy - centers2y2(ii)) <= radii2y2(ii)-4;
                [B,L] = bwboundaries(ibwn.*masksmall,'noholes');
                stats = regionprops(L,'Area','Centroid');
                boundary = B;
                for k = 1 
                    boundary = B{k};
                    delta_sq = diff(boundary).^2;    
                    perimeter = sum(sqrt(sum(delta_sq,2)));
                    area = stats(k).Area;
                    metricsmall = 4*pi*area/perimeter^2;
                end
                [xx,yy] = meshgrid(1:yDim,1:xDim);
                maskbig = false(xDim, yDim); 
                masksmall = false(xDim, yDim);
                if metricbig < 1 & metricsmall < 1;
                    metricn(ii) = mean([metricbig metricsmall]);
                elseif metricbig > 1 
                    metricn(ii) = metricsmall;
                elseif metricsmall > 1
                    metricn(ii) = metricbig;
                end
                end
            end
            matrixtobewritten = [centers2x2',centers2y2',radii2y2',metricn'];
            writematrix(matrixtobewritten, textfilename, 'Delimiter', ' ');
            
            
            sortedmatrixtobewritten = sortrows(matrixtobewritten, 4);
            centers2x2 = sortedmatrixtobewritten(:,1);
            centers2y2 = sortedmatrixtobewritten(:,2);
            radii2y2 = sortedmatrixtobewritten(:,3);
            colormapped = hot(1000);
            for hk = 1:length(metricn)
            point = floor(metricn(hk)*1000);
            if point > 1000 
               point = 1;
            end
            h = viscircles([centers2x2(hk) centers2y2(hk)], radii2y2(hk), 'Color', colormapped(point,:), 'LineWidth', 4);
            end
            hold on
            title([filename(1:end-4) ' Colormapped Metric Score'], 'FontSize', 15)
            ax2 = axes;
            ax2.Visible = 'off';
            colormap(ax2, 'hot');
            cb2 = colorbar(ax2, 'Position',[.95 .05 .0275 .925]);
            filename4 = [filename(1:end-4) 'colormappedrealBW' int2str(LL) '.png'];
            saveas(gcf, filename4);
            close all
            imshow(convertedImage);
            for hk = 1:length(metricn)
            point = floor(metricn(hk)*1000);
            if point > 1000 
               point = 1;
            end
            h = viscircles([centers2x2(hk) centers2y2(hk)], radii2y2(hk), 'Color', colormapped(point,:), 'LineWidth', 4);
            end
            hold on
            title([filename(1:end-4) ' Colormapped Metric Score'], 'FontSize', 15)
            ax2 = axes;
            ax2.Visible = 'off';
            colormap(ax2, 'hot');
            cb2 = colorbar(ax2, 'Position',[.95 .05 .0275 .925]);
            filename5 = [filename(1:end-4) 'colormappedreal' int2str(LL) '.png'];
            saveas(gcf, filename5);
            close all
            
  end
end
csvFiles = dir([pwd '/*.csv']); 
total = [];
totalc = [];
N = input("What N is it?");
D = input("What Day is it?");
for i = 1: length(csvFiles)
filename = strcat(csvFiles(i).name);
matrix = readmatrix(filename);
try
total = [matrix(:,3)' total];
totalc = [matrix(:,4)' totalc];
end
end
newfilename = ['N' num2str(N) ' Day' num2str(D) '.txt'];
writematrix(total, newfilename);
newfilename2 = ['N' num2str(N) ' Day' num2str(D) 'circle.txt'];
writematrix(totalc,newfilename2);













function finfo = nd2finfo(file, varargin)
fid = fopen(file, 'r');
sigbyte = [218, 206, 190, 10];
count = 1;
fs = struct;
signature = fread(fid, 4, '*uint8')';
if ~isempty(signature) && strfind(signature, sigbyte)
    [fs, count, ~] = readHeader(fid, fs, count);
end
fseek(fid, 4096, 'bof');
flag = 0;
while flag == 0
    signature = fread(fid, 4, '*uint8')';
    if ~isempty(signature) && sum(signature == sigbyte) == 4
        [fs, count, flag] = readHeader(fid, fs, count);
        if strfind(fs(count-1).nameAttribute, 'ImageDataSeq')
            break;
        end
    else
        break
    end
end
temp = fread(fid, 10000, '*uint8')';
idx_nxt = strfind(temp, sigbyte);
fseek(fid, fs(count-1).dataStartPos + fs(count-1).dataLength + ...
    idx_nxt(1)-1, 'bof');
flag = 0;
while flag == 0
  signature = fread(fid, 4, '*uint8')';
  if ~isempty(signature) && sum(signature == sigbyte) == 4
      [fs, count, flag] = readHeader(fid, fs, count);   
  else
      break
  end
end
for ii = 1 : length(fs)
  if strfind(fs(ii).nameAttribute, 'ImageAttributesLV!')
    img_attrib_idx = ii;
  elseif strfind(fs(ii).nameAttribute, 'ImageDataSeq')
    img_data_idx = ii;
  elseif strfind(fs(ii).nameAttribute, 'ImageMetadataSeq')
    img_metadata_idx = ii;
  elseif strfind(fs(ii).nameAttribute, 'ImageCalibration')
    img_calib_idx = ii;
  elseif strfind(fs(ii).nameAttribute, 'ImageTextInfo')
    img_txt_idx = ii;  
  end
end
finfo = struct;
finfo.file_structure = fs;
fseek(fid, fs(img_attrib_idx).dataStartPos, 'bof');
img_attrib = fread(fid, fs(img_attrib_idx).dataLength, '*char')';
strloc(fid,fs, img_attrib_idx, img_attrib, 'uiWidth');
finfo.img_width = fread(fid, 1, '*uint32');
strloc(fid, fs, img_attrib_idx, img_attrib, 'uiHeight');
finfo.img_height = fread(fid, 1, '*uint32');
strloc(fid, fs, img_attrib_idx, img_attrib, 'uiSequenceCount');
finfo.img_seq_count = fread(fid, 1, '*uint32');
fseek(fid, fs(img_metadata_idx).dataStartPos, 'bof');
img_metadata = fread(fid, fs(img_metadata_idx).dataLength, '*char')';
strloc(fid, fs, img_metadata_idx, img_metadata, 'XPos');
finfo.center_x = fread(fid, 1, 'float64');
strloc(fid, fs, img_metadata_idx, img_metadata, 'YPos');
finfo.center_y = fread(fid, 1, 'float64');
strloc(fid, fs, img_metadata_idx, img_metadata, 'dCalibration');
finfo.calib_factor = fread(fid, 1, 'float64');
pos = strfind(img_metadata, insert0('ChannelIsActive'));
finfo.ch_count = length(pos);
finfo.padding_bytes = fs(img_data_idx).dataLength - 8 - ...
    finfo.img_width * finfo.img_height *finfo.ch_count *2;
if finfo.padding_bytes == finfo.img_height * 2
  finfo.padding_style = 1;
elseif finfo.padding_bytes == 0
  finfo.padding_style = 2;
else
  finfo.padding_style = 3;
end
if ~isempty(varargin) && strcmpi(varargin{1}, 'getmeta')
  fseek(fid, fs(img_calib_idx).dataStartPos, 'bof');
  finfo.meta.img_calib = fread(fid, fs(img_calib_idx).dataLength, '*char')';
  
  fseek(fid, fs(img_txt_idx).dataStartPos, 'bof');
  finfo.meta.img_txt = fread(fid, fs(img_txt_idx).dataLength, '*char')';
  
  finfo.meta.img_meta = img_metadata;
end
function [attrib, count, flag] = readHeader(fid, attrib, count)
attrib(count).nameLength = fread(fid, 1, 'uint32');
attrib(count).dataLength = fread(fid, 1, 'uint64');
attrib(count).nameAttribute = fread(fid, attrib(count).nameLength, '*char')';
attrib(count).dataStartPos = ftell(fid);
flag = fseek(fid, attrib(count).dataLength, 'cof');
count = count + 1;
end
function out = insert0(in)
num = in + 0;
out = char([reshape(cat(1, num, zeros(size(num))), [1, length(num)*2]), 0]);
end
function strloc( fid, fs, fsidx, text, str )
idx = strfind(text, insert0(str)) + length(insert0(str));
fseek(fid, fs(fsidx).dataStartPos + idx(1), 'bof');
end
end


function [im_ch1, im_ch2, im_ch3] = nd2read(filename, varargin)
tic
finfo = nd2finfo(filename);
disp(['analyzing file structure used ', sprintf('%0.2f', toc), ' seconds'])
im_ch1 = zeros(finfo.img_width, finfo.img_height, 'uint16');
im_ch2 = zeros(finfo.img_width, finfo.img_height, 'uint16');
im_ch3 = zeros(finfo.img_width, finfo.img_height, 'uint16');
if finfo.ch_count == 4
  im_ch4 = zeros(finfo.img_width, finfo.img_height, 'uint16');
end
fid = fopen(filename, 'r');
fseek(fid, finfo.file_structure(strncmp('ImageDataSeq', ...
  {finfo.file_structure(:).nameAttribute}, 12)).dataStartPos, 'bof');
tic
if finfo.padding_style == 1
  if finfo.ch_count == 4
    for ii = 1: finfo.img_height
        temp = reshape(fread(fid, finfo.ch_count * finfo.img_width, '*uint16'),...
          [finfo.ch_count finfo.img_width]);
        im_ch3(:, ii) = temp(1, :);
        fseek(fid, 2, 'cof');
    end
  else
    for ii = 1: finfo.img_height
        temp = reshape(fread(fid, finfo.ch_count * finfo.img_width, '*uint16'),...
          [finfo.ch_count finfo.img_width]);
        im_ch3(:, ii) = temp(1, :);
        im_ch1(:, ii) = temp(2, :);
        im_ch2(:, ii) = temp(3, :);
        fseek(fid, 2, 'cof');
    end
  end
else
  if finfo.ch_count == 4
    for ii = 1: finfo.img_height
        temp = reshape(fread(fid, finfo.ch_count * finfo.img_width, '*uint16'),...
          [finfo.ch_count finfo.img_width]);
        im_ch1(:, ii) = temp(1, :);
        im_ch2(:, ii) = temp(2, :);
        im_ch3(:, ii) = temp(3, :);
        im_ch4(:, ii) = temp(4, :);
    end
  else
    for ii = 1: finfo.img_height
        temp = reshape(fread(fid, finfo.ch_count * finfo.img_width, '*uint16'),...
          [finfo.ch_count finfo.img_width]);
        im_ch1(:, ii) = temp(1, :);
    end 
  end
end
fclose(fid);
im_ch1 = permute(im_ch1, [2 1]);
im_ch2 = permute(im_ch2, [2 1]);
im_ch3 = permute(im_ch3, [2 1]);
if finfo.ch_count == 4
    im_ch4 = permute(im_ch4, [2 1]);
end
if any(strcmpi(varargin, 'use_ch4'))
  im_ch3 = im_ch4;
end
  
disp(['reading complete image data used ', sprintf('%0.2f', toc), ' seconds'])
end