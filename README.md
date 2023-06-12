# CRS_AFFORD
Temporary Repository for my work at the Center for reproducible science - AFFORD project

 ## File naming
 Some example of file names:  
 From SOLEIL synchrotron: 020_Mouse89883_5823_PBS_27keV_9000proj_ring_z0_x0, 
 From Japan synchrotron: JP21-invivo-1scan-phase3-postinjection-brain-40min

### Known issues
```
- Different lab locations have different requirements. E.g., filenames in Synchrotron in France cannot be modified after recording
- Data from the same specimen maybe acquired in two locations, but assigned numeric label may not correspond. JP10 is not FR10 necessarily
```


### General principles
BIDS has a standardized way of naming files that tries to implement the following principles:

- No white spaces
- Only letters, numbers, hyphens, and underscores
- Do not rely on letter case (UPPERCASE and lowercase)
- Use separators (hyphen or underscore) in a systematic and meaningful way.

 ## Name parts 
### Modality agnostic 
 
 Recording identifiers [all REQUIRED]
 - `<specID>`   specimen
 - `<loc>` country
 - `<lab>` /institution ?
 - `<recID>` uneditable timestamp or alphanumeric id provided by the equiment when recording 

Suffixes [OPTIONAL]
- <...> e.g. version specification if redoing recording 
 
 
### Modality specific
 
##### SRµCT

Specimen description

- <status> Vivo | dead | Dying 

Acquisition parameters 

- <...>
 
##### MRI

Specimen description

- <status> Vivo | dead | Dying 

Acquisition parameters 

- <...>

##### Microscope




 ### Name parts
 
 Recording identifiers [all REQUIRED]
 - sID : specimen
 - Loc (country)
 - Lab/institution ?
 
 Acquisition parameters
 
 Specimen descriptors
 
 
 
 
 
 E.g., 
024_Mouse89875_5323_eth_9000proj_ring_redo_z1_x1
 
 
 
 
## NOTES 
- www.readthedocs.com as asset for easy to mantain documentation ?
