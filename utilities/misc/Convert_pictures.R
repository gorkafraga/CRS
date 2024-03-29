#Load
rm(list=ls())
library("jpeg")
library("tiff")
library('magick')

dirinput <- 'C:/Users/GFraga/Documents/GitHub/CRS/AFFORD_data/images/SPring-8_Preview_Slices_0749'
diroutput <- 'C:/Users/GFraga/Documents/GitHub/CRS/AFFORD_data/images/SPring-8_Preview_Slices_0749_compressed' 
dir.create(diroutput)

fnames <- dir(dirinput)
fnames <- fnames[grepl('^JP*',fnames)]

setwd(dirinput)
for (f in 1:length(fnames)){
  img <- magick::image_read(file.path(dirinput,fnames[f]))
  img <- magick::image_resize(img, 300)
  magick::image_write(img,file.path(diroutput,gsub('.tif','.jpg',fnames[f])), format='jpg')
 }


