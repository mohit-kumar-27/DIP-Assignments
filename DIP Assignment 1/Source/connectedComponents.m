function [nDigits] = connectedComponents(img)

[~,~,~,~,A,~] = otsuBinarization(img);
A=double(A);
visited = false(size(A));
[rows,cols] = size(A);
B = zeros(rows,cols);
ID_counter = 1;

for row = 1 : rows
    for col = 1 : cols
        if A(row,col) == 0
            visited(row,col) = true;
        elseif visited(row,col)
            continue;
        else
            stack = [row col];
            while ~isempty(stack)
                loc = stack(1,:);
                stack(1,:) = [];
                if visited(loc(1),loc(2))
                    continue;
                end
                
                visited(loc(1),loc(2)) = true;
                B(loc(1),loc(2)) = ID_counter;
                [locs_y, locs_x] = meshgrid(loc(2)-1:loc(2)+1, loc(1)-1:loc(1)+1);
                locs_y = locs_y(:);
                locs_x = locs_x(:);

                out_of_bounds = locs_x < 1 | locs_x > rows | locs_y < 1 | locs_y > cols;

                locs_y(out_of_bounds) = [];
                locs_x(out_of_bounds) = [];

                is_visited = visited(sub2ind([rows cols], locs_x, locs_y));

                locs_y(is_visited) = [];
                locs_x(is_visited) = [];

                is_1 = A(sub2ind([rows cols], locs_x, locs_y));
                locs_y(~is_1) = [];
                locs_x(~is_1) = [];

                stack = [stack; [locs_x locs_y]];
            end
            ID_counter = ID_counter + 1;
        end
    end 
end   
nComps=ID_counter-1;

CSize=zeros(1,nComps);
for j=1:cols
    for i=1:rows
        for n=1:nComps
             if B(i,j)==n
                   CSize(n)=CSize(n)+1;
             end       
        end   
    end
end
nDigits=length(CSize(CSize>min(CSize)));
end


