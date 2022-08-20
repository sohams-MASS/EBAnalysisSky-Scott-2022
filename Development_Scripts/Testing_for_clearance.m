LL=1;
csvFiles = dir([pwd '/*.csv']); 
total = [];
totalc = [];
center_theta =[];
center_radius = [];
center =[];
full_matrix = [];
for i = 1: length(csvFiles)
filename = strcat(csvFiles(i).name);
matrix = readmatrix(filename);
    try
    %Clean Repeats
    center = [matrix(:,1:2); center];
    full_matrix = [full_matrix; matrix];

    %use pdist and squareform

    if mod(i, LL)==0
        D = pdist(center);
        %Get distance from each pair
        D_square = squareform(D);
        mask = (D_square < 40) & (D_square ~=0);
        [row, col] = find(mask);
        first_pair = [];
        second_pair = [];

        %Find all unique pairs
        for jj = 1:length(row)
            first_part = row(jj);
            second_part = col(jj);
            if (sum(second_part == first_pair)) == 0
                second_pair = [second_pair second_part];
                first_pair = [first_pair first_part];

            end
        end
        mask_tree = ones(1,length(center));
        mask_logical = logical(mask_tree);
        %Creating unique mask
        for jk = 1:length(second_pair)
            mask_logical(second_pair(jk)) = false;
        end

        total = [full_matrix(mask_logical,3)' total];
        totalc = [full_matrix(mask_logical,4)' totalc];

       center =[];
       full_matrix = [];
    end
    %   


    end
end