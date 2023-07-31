#Load
library("jpeg")
library("tiff")
library('magick')

dirinput <- 'C:/Users/GFraga/Desktop/AFFORD_THUMBS/Spring/'

fnames <- dir(dirinput)
fnames <- fnames[grepl('^JP*',fnames)]

setwd(dirinput)
for (f in 1:length(fnames)){
  img <- magick::image_read(fnames[f])
  magick::image_write(img, gsub('.tif','.jpg',fnames[f]), format='jpg')
 }

