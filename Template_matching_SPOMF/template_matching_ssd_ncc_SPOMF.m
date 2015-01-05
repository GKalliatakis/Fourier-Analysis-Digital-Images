function [I_SSD,I_NCC,I_SPOMF,Idata] = template_matching_ssd_ncc_SPOMF(T,I,IdataIn)
% TEMPLATE_MATCHING is a cpu efficient function which calculates matching 
% score images between template and an (color) 2D image.
% It calculates:
% - The sum of squared difference (SSD Block Matching), robust template
%   matching.
%
% - The normalized cross correlation (NCC), independent of illumination,
%   only dependent on texture
%
% - The Phase information (structures) (Symmetric Phase Only Matched
% Filters-SPOMF), equal to the spectral phase of the image which preserves the location of objects
%
%
%   [I_SSD,I_NCC,Idata]=template_matching_ssd_ncc_SPOMF(T,I,Idata)
%
% inputs,
%   T : Image Template, can be grayscale or color 2D.
%   I : Color image, can be grayscale or color 2D.
%  (optional)
%   Idata : Storage of temporary variables from the image I, to allow 
%           faster search for multiple templates in the same image.
%
% outputs,
%   I_SSD: The sum of squared difference 2D image. The SSD sign is
%          reversed and normalized to range [0 1] 
%   I_NCC: The normalized cross correlation 2D image. The values
%          range between 0 and 1
%   I_SPOMF: The Symmetric Phase Only Matched Filters 2D image. The values
%          range between 0 and 1
%   Idata : Storage of temporary variables from the image I, to allow 
%           faster search for multiple templates in the same image.



%%   Example,Uncomment the follow lines to run the example
%   %Find maximum response
%    I = im2double(imread('images/b.png'));
%   %Template of Eye Lena
%    T = im2double(imread('images/qbear.png'));
%   %%Calculate SSD, NCC and SPOMF between Template and Image
%    [I_SSD,I_NCC,I_SPOMF]=template_matching_ssd_ncc_SPOMF(T,I);
%   %%Find maximum correspondence in I_SPOMF image
%    [x,y]=find(I_SSD==max(I_SSD(:)));
%      [z,w]=find(I_NCC==max(I_NCC(:)));
%      [a,b]=find(I_SPOMF==max(I_SPOMF(:)));
%   %%Show result
%    figure,title('Template Matching Results')
%    subplot(3,3,1), imshow(I); title('Reference Image')
%    subplot(3,3,2), imshow(T); title('Query Image');
%    subplot(3,3,4), imshow(I_SSD); title('SSD Matching');
%    subplot(3,3,5), imshow(I_NCC); title('Normalized-CC');
%    subplot(3,3,6), imshow(I_SPOMF); title('SPOMF');
%    subplot(3,3,7), imshow(I); hold on; plot(x,y,'r*'); title('Result for SSD')
%    subplot(3,3,8), imshow(I); hold on; plot(z,w,'r*'); title('Result for NCC')
%    subplot(3,3,9), imshow(I); hold on; plot(a,b,'r*'); title('Result for SPOMF')
%
%%
if(nargin<3), IdataIn=[]; end

% Convert images to double
T=double(T); I=double(I);

if(size(T,3)==3) 
    % Color Image detected
    [I_SSD,I_NCC,I_SPOMF,Idata]=template_matching_color(T,I,IdataIn);
else
    % Grayscale image
    [I_SSD,I_NCC,I_SPOMF,Idata]=template_matching_gray(T,I,IdataIn);
end


end

