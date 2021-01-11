# MLP-Classification-facial-mask

Dataset <br>
https://www.kaggle.com/andrewmvd/face-mask-detection/download
<br>
Ejecución de Trainingimgs.m 

Este script es para cargar las imágenes y hacer la clasificación de las de las imágenes en clase 1 y clase 0 Figura 2.  
1.	Se crea una variable para ingresar la ruta donde estén almacenada nuestras imágenes para hacer las clases. La ruta de la imagen tiene que ir entre comillas simples como se detalla en la Figura 1.
 


Figura 1 ruta de imagen por teclado
 
Figura 2 Definición de clases

prompt = 'Ingrese la ruta de las imagenes: ';<br> 
xruta = input(prompt);  %variable ruta Img<br> 
folder = xruta;<br> 
2.	Cargan las imágenes y mediante un bucle For, las imágenes se almacenarán en una base de datos la cual se llamará db1.mat <br> 

for k = 1 : length(myFiles)<br> 
  fullFileName = fullfile(folder, myFiles(k).name);<br> 
  
  im=imread(fullFileName)<br> 
  im=im2bw(im);<br> 
%   imshow(im);<br> 
  subplot(rows, rows, k);<br> 
  imshow(fullFileName);<br> 
  title(myFiles(k).name, 'Interpreter', 'none');<br> 
  drawnow;<br> 
%% Feature Extraction<br> 
F=FeatureStatistical(im);<br> 
%% Saving features <br> 
try <br> 
    load db1;<br> 
    F=[F c];<br> 
    db1=[db1; F];<br> 
    save db1.mat db1 <br> 
catch <br> 
    db1=[F c]; % 10 12 1<br> 
    save db1.mat db1<br> 
end<br> 

 	 
En esta base de datos se almacenan un total de 440 en la primer clase 220 con mascarillas y 220 sin mascarillas las mismas que servirán para el entrenamiento de nuestra red.<br> 



3.	Se ejecuta el script con el nombro TrainigMLP.m para generar nuestra red neuronal.
 

4.	Ejecución de TestMLP.m aquí se hacen las pruebas de la red neuronal para eso se descargará 2 imágenes de internet en las cuales esten una persona con mascarilla y la otra sin mascarilla para luego ver la eficiencia del algoritmo de clasificación.

 
 	Ftest =0.6374    0.1547

predict_object =<br> 
   0<br> 
   0<br> 
   0<br> 
   0.5701<br> 
class =<br> 
     0<br> 
     0<br> 
     0<br> 
     1<br> 
<br> 
pred =<br> 
     1<br> 
Si Usa Mascarilla <br>
 	Ftest =0.1208    0.1694<br> 

predict_object =<br> 
         0<br> 
         0<br> 
         0<br> 
    0.2311<br> 
<br> 
class =<br> 
     0<br> 
     0<br> 
     0<br> 
     0<br> 
<br> 
pred =<br> 
     0<br> 
No Usa Mascarilla<br> 

1	Conclusiones<br>
Este trabajo nos deja muy conformes con los resultados porque hemos obtenido un 97% de eficacia en la clasificación de personas que usan mascarilla y personas que no usan mascarilla.
También podemos concluir que para este tipo de proyectos el uso de redes MLP no es el mejor ya que estamos expuestos a experimentar muchos errores de eficiencia lo cual se realiza mejor con RBF con lo que podemos obtener resultados muy próximos a los esperados.
