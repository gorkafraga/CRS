#Load
library("jpeg")
library("tiff")
library('magick')

dirinput <- 'C:/Users/GFraga/Documents/GitHub/CRS_AFFORD/AFFORD_THUMBS/Spring_jpg/'

fnames <- dir(dirinput)
fnames <- fnames[grepl('^JP*',fnames)]

setwd(dirinput)
for (f in 1:length(fnames)){
  img <- magick::image_read(fnames[f])
  img <- magick::image_resize(img, 300)
  magick::image_write(img,fnames[f], format='jpg')
 }

