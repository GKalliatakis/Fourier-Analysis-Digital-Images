function [I_SSD,I_NCC,I_SPOMF,Idata]=template_matching_gray(T,I,IdataIn)
% Calculate correlation output size  = input size + padding template
T_size = size(T); I_size = size(I);
outsize = I_size + T_size-1;

% calculate correlation in frequency domain
if(length(T_size)==2)
    FT = fft2(rot90(T,2),outsize(1),outsize(2));
    if(isempty(IdataIn))
        Idata.FI = fft2(I,outsize(1),outsize(2));
    else
        Idata.FI=IdataIn.FI;
    end
    Icorr = real(ifft2(Idata.FI.* FT));
end

% Calculate Local Quadratic sum of Image and Template
if(isempty(IdataIn))
    Idata.LocalQSumI= local_sum(I.*I,T_size);
else
    Idata.LocalQSumI=IdataIn.LocalQSumI;
end

QSumT = sum(T(:).^2);

% SSD between template and image
I_SSD=Idata.LocalQSumI+QSumT-2*Icorr;

% Normalize to range 0..1
I_SSD=I_SSD-min(I_SSD(:)); 
I_SSD=1-(I_SSD./max(I_SSD(:)));

% Remove padding
I_SSD=unpadarray(I_SSD,size(I));

if (nargout>1)
    % Normalized cross correlation STD
    if(isempty(IdataIn))
        Idata.LocalSumI= local_sum(I,T_size);
    else
        Idata.LocalSumI=IdataIn.LocalSumI;
    end
    
    % Standard deviation
    if(isempty(IdataIn))
        Idata.stdI=sqrt(max(Idata.LocalQSumI-(Idata.LocalSumI.^2)/numel(T),0) );
    else
        Idata.stdI=IdataIn.stdI;
    end
    stdT=sqrt(numel(T)-1)*std(T(:));
    % Mean compensation
    meanIT=Idata.LocalSumI*sum(T(:))/numel(T);
    I_NCC= 0.5+(Icorr-meanIT)./ (2*stdT*max(Idata.stdI,stdT/1e5));

    % Remove padding
    I_NCC=unpadarray(I_NCC,size(I));
end


% SPOMF between template and image

T = imresize(T,[186 258]);
I = imresize(I,[186 258]);

F_T = fft2(T);
angle_1 = angle(F_T);% detetcting phase of template
F_T_r = fft2(I);
angle_2 = angle(F_T_r); % detetcting phase of image



sz = size(angle_1,2);
sz_ref = size(angle_2,2);
nz = (sz_ref-sz);
angle_1= padarray(angle_1,[nz nz]);


inter = exp(i * (angle_1 - angle_2)); % step 5 of core FMI_SPOMF filter
I_SPOMF = real(ifft2(inter)); % step 6 of core algo
% I_SPOMF=temp.FI;

% Normalize to range 0..1
I_SPOMF=I_SPOMF-min(I_SPOMF(:)); 
I_SPOMF=1-(I_SPOMF./max(I_SPOMF(:)));
% Remove padding
I_SPOMF=unpadarray(I_SPOMF,size(I));

end