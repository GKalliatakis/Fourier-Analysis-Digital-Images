# Fourier Analysis with Digital Images

### Fourier analysis applications for image matching
![alt tag](https://raw.githubusercontent.com/GKalliatakis/Fourier_Analysis_Digital_Images/master/Fourier_Analysis_with_Digital_Images.png)


### Overview
The goal of this Fourier analysis exercise is to understand the Fourier analysis itself alongside some applications mainly focused on magnitude and phase.
Two main exercises will be discussed in this repository:
1. Template matching using Symmetric Phase Only Matched Filters (SPOMF)
2. Image registration with Fourier-Mellin Invariant (FMI) – SPOMF
.


### Introduction
Image matching is defined as the problem of evaluating the similarity of objects in different images. It is used for detecting changes in a scene, estimating object motion, locating targets, integrating information from different types of images or identifying objects, etc. A matching algorithm should be robust with respect to low signal to noise ratio (SNR), and should remain accurate even when the same object has different intensities or different orientations and sizes in the two images to be matched, or when the object is partially truncated in one of the images.
The most common approach to image matching is based on the cross-correlation technique, also referred to as template matching. However the maximum of the cross-correlation between two images is rather broad, and therefore difficult to locate in the presence of noise.
Several alternatives to the cross-correlation function have been proposed, such as the Sum of Squared Differences (SSD) which most of the time seems to work better than the cross-correlation technique.
In this exercise, a normalized cross-correlation matching was implemented alongside a SSD matching in order to test their result against the SPOMF method.

### SPOMF Approach
This technique, referred to as a symmetric phase-only matched filtering (SPOMF), can be seen as a nonlinear two step process, the first step being the extraction of the phases of the input images and the second the phase-only matched filtering. Because cross-correlation is very sensitive to luminance, one solution is to normalize the images before the comparison, which leads to Normalized Cross-correlation. Furthermore, another solution can be adopted by comparing only the phase information, namely SPOMF. 

### Template matching with SPOMF
For this exercise a normalized cross-correlation matching, an SSD matching and the SPOMF matching were implemented. Then these algorithms were tested on the images provided. The results can be showed in the above figure. The first line contains the reference image alongside the query image. The second line shows the three different approaches used and the last line presents the location of the query image inside the reference image based on each method.
The code for the template matching can be found in the function named *template_matching_ssd_ncc_SPOMF* and can be used for gray-scale and color images. The code itself contains lots of explanatory comments.


### Image registration with FMI-SPOMF
In this exercise, image registration with the FMI-SPOMF method was introduced.
First a distorted version of the “cameraman.tif” image was constructed with arbitrary rotation and scaling only with 30 degrees rotation and 0.7 scaling.
After that, the sampling of images on a log-polar grid was implemented in a function named *logsample*. The implementation was based on *Log-polar image sampling*.

License
----


Fourier analysis applications for image matching is released under the MIT License.




**This app is for learning purposes, and not meant for any use in production / commercial purposes.**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [@thomasfuchs]: <http://twitter.com/thomasfuchs>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [keymaster.js]: <https://github.com/madrobby/keymaster>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]:  <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
