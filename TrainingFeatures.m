clc;
clear all;
close all;
prompt = 'Cuantas imagenes quiere verificar: ';
x = input(prompt);  %variable N traint
n= x/2;
for r = 1:x
if r<=n
    prompt = 'ingrese las personas con mascarilla: ',;    
%% Taking an Image
%[fname, path] = imgetfile('InitialPath','C:\Users\AdrianGarcia\Desktop\Inteligencia Artificial II\Unidad 3\clasificador-de-animales\MLP Classification\img','MultiSelect',true)
[fname, path]=uigetfile('.jpg','Open an Image as input for training');
fname=strcat(path, fname);
im=imread(fname);
im=im2bw(im);
imshow(im);
title('Input Image');
c=input('Enter the Class(Number from 1-12): ');
%% Feature Extraction
F=FeatureStatistical(im);
%% Saving features 
try 
    load db1;
    F=[F c];
    db1=[db1; F];
    save db1.mat db1 
catch 
    db1=[F c]; % 10 12 1
    save db1.mat db1
end

    else
        prompt = 'ingrese las personas sin mascarilla: ',;
 
       
%% Taking an Image
[fname, path]=uigetfile('.jpg','Open an Image as input for training');
fname=strcat(path, fname);
im=imread(fname);
im=im2bw(im);
imshow(im);
title('Input Image');
c=input('Enter the Class(Number from 1-12): ');
%% Feature Extraction
F=FeatureStatistical(im);
%% Saving features 
try 
    load db1;
    F=[F c];
    db1=[db1; F];
    save db1.mat db1 
catch 
    db1=[F c]; % 10 12 1
    save db1.mat db1
end

    end   

end

