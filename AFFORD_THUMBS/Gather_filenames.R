
dirinput <- setwd('C:/Users/GFraga/Desktop/AFFORD_THUMBS/Spring/')
       
fnames <- dir(dirinput)
metadata <- as.data.frame(fnames[grepl('^JP*',fnames)])
colnames(metadata) <- 'file'
# split names 
parts <- strsplit(metadata$file,'-')
basenames <- sapply(strsplit(metadata$file,'.tif'),'[[',1)
metadata$specID <- sapply(strsplit(basenames,'-'),'[[',1)
metadata$status <- sapply(strsplit(basenames,'-'),'[[',2)
metadata$scan <- sapply(strsplit(basenames,'-'),'[[',3)
metadata$seq <- sapply(strsplit(basenames,'_'),'[[',2)
metadata$rec <- sapply(strsplit(basenames,'_rec'),'[[',2)
