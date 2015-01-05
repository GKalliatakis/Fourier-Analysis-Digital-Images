function [I_SSD,I_NCC,I_SPOMF,Idata]=template_matching_color(T,I,IdataIn)
if(isempty(IdataIn)), IdataIn.r=[];  IdataIn.g=[]; IdataIn.b=[];  end
% Splite color image, and do template matching on R,G and B image
[I_SSD_R,I_NCC_R,I_SPOMF_R,Idata.r]=template_matching_gray(T(:,:,1),I(:,:,1),IdataIn.r);
[I_SSD_G,I_NCC_G,I_SPOMF_G,Idata.g]=template_matching_gray(T(:,:,2),I(:,:,2),IdataIn.g);
[I_SSD_B,I_NCC_B,I_SPOMF_B,Idata.b]=template_matching_gray(T(:,:,3),I(:,:,3),IdataIn.b);
% Combine the results
I_SSD=(I_SSD_R+I_SSD_G+I_SSD_B)/3;
I_NCC=(I_NCC_R+I_NCC_G+I_NCC_B)/3;
I_SPOMF=(I_SPOMF_R+I_SPOMF_G+I_SPOMF_B)/3;

end
