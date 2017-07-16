% Code to access the intensity value (i,j)  of the given image 

function []=myImage()
I=imread('sachin.jpg');
Igray=rgb2gray(I);

s=size(Igray)
Igray
for i=1:s(1)
    for j=1:s(2)
        %Igray(i,j)
        Igray(i,j)=Igray(i,j) +1;
    end
end

imwrite(Igray,'New.jpg');