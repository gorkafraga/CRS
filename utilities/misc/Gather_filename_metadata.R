rm(list=ls())
library(DT)
library(dplyr)
#-------------------------------------------------
diroutput <-  'C:/Users/GFraga/Documents/GitHub/CRS_AFFORD/AFFORD_THUMBS/' 
# Read filenames from directory
dirinput <-
  'C:/Users/GFraga/Documents/GitHub/CRS_AFFORD/AFFORD_THUMBS/Spring/'
fnames <- dir(dirinput)
ext = '.jpg'
pattern = paste0('^JP*.*',ext,'$')
# Create metadata table
metadata <- as.data.frame(fnames[grepl(pattern, fnames)])
colnames(metadata) <- 'file'

# Fill metadata columns from different filename parts

basenames <- sapply(strsplit(metadata$file, ext), '[[', 1)
basenames_firstpart <- sapply(strsplit(basenames,'_'),'[[',1)


metadata$specID <- sapply(strsplit(basenames, '-'), '[[', 1)
metadata$status <- sapply(strsplit(basenames, '-'), '[[', 2)
metadata$scanID <- sapply(strsplit(basenames_firstpart, '-'), '[[', 3)
metadata$desc <- sapply(strsplit(basenames_firstpart, '-'), function(x) paste(x[-(1:3)], collapse = '-')) # take everything after the first 2 elements of the first part

#metadata$version <- sapply(strsplit(basenames,'-v'), function(x) paste0(x[-(1)],collapse = ''))
#metadata$version <- sapply(metadata$version, function(x) sub('_.*', '', x))

metadata$seq <- sapply(strsplit(sapply(strsplit(basenames, '_rec'), '[[', 1),'_'),function(x) paste(x[-1],collapse=''))

# Move version info from desc to seq 
metadata$desc[which(sapply(metadata$seq, function(x) grepl('v.*',x)))] <- metadata$seq[which(sapply(metadata$seq, function(x) grepl('v.*',x)))]
metadata$seq[which(sapply(metadata$seq, function(x) grepl('v.*',x)))] <- 'inconsistent filename' 

# recording ID 
metadata$rec <- sapply(strsplit(basenames, '_rec'), function(x) paste0('rec',x[(2)]))


#metadata %>% relocate(file, .after = last_col())


# save csv 
#--------------

write.csv(metadata,file = file.path(diroutput,'Metadata_filenames.csv'),row.names = FALSE)




