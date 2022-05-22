function [threshSigB,threshSigW,timeSigB,timeSigW,binImg,threshLib] = otsuBinarization(img)

[freq]=myHistGS(img,256);

tot_pix=sum(freq);
pmf=freq/tot_pix;
pmf=pmf';
varB=zeros(1,256);

tic;
for k= 1:256
    W0=sum(pmf(1:k));
    W1=sum(pmf(k+1:256));
    if W1==0||W0==0
        continue;
    end
    U0=sum([0:k-1].*pmf(1:k))/W0;
    U1=sum([k:255].*pmf(k+1:256))/W1;
    varB(k)=W0*W1*((U0-U1)^2);
end

max_varB=max(varB);
threshSigB=find(max_varB==varB,1)-1;
timeSigB=toc;

varW=ones(1,256)*1e10;

tic;
for k= 1:256
    W0=sum(pmf(1:k));
    W1=sum(pmf(k+1:256));
    if W1==0||W0==0
        continue;
    end
    U0=sum([0:k-1].*pmf(1:k))/W0;
    U1=sum([k:255].*pmf(k+1:256))/W1;
    S0=sum((([0:k-1]-U0).^2).*pmf(1:k))/W0;
    S1=sum((([k:255]-U1).^2).*pmf(k+1:256))/W1;
    varW(k)=W0*S0+W1*S1;
end

min_varW=min(varW);
threshSigW=find(min_varW==varW,1)-1;
timeSigW=toc;

threshLib = graythresh(img)*255;
binImg = img>threshSigB;

end

