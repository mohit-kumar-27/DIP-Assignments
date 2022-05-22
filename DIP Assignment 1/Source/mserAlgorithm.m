function [mserThresh] = mserAlgorithm(img)

thC=5;
thS=500;
maxNcomps=100;
cSize=zeros(maxNcomps,256);
mserThresh=-1;
minSize=500;
maxSize=4000;
[rows,cols] = size(img);

for k=0:255
    A=img>k;
    A=double(A);
    B = zeros(rows,cols);
    visited = false(size(A));
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
    for i=1:rows
        for j=1:cols
            for n1=1:maxNcomps
                if B(i,j)==n1
                    cSize(n1,k+1)=cSize(n1,k+1)+1;
                end
            end
        end
    end
end



for k=thC+1:256-thC
    for k1=k-thC:k+thC-1
        for n1=1:maxnComps
            if(cSize(n1,k1)<minSize||cSize(n1,k1)>maxSize)
                continue
            end
            if abs(cSize(n1,k1)-cSize(n1,k1+1))>thS
                flag=1;
                break;
            end
            if flag==1
                break;
            end
        end
        if flag==0
            mserThresh=k;
            break;
        end
    end
    
end

end

