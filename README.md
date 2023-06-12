# CRS_AFFORD
Temporary Repository for my work at the Center for reproducible science - AFFORD project

 ## File naming
 
 020_Mouse89883_5823_PBS_27keV_9000proj_ring_z0_x0

### General principles

BIDS has a standardized way of naming files that tries to implement the following principles:

- No white spaces
-
Only letters, numbers, hyphens, and underscores

not rely on letter case (UPPERCASE and lowercase)

Use separators and case in a systematic and meaningful way.

thisIsCamelCase

this_is_snake_case


 ## Name parts 

### Modality agnostic 
 
 Recording identifiers [all REQUIRED]
 - <specID>:  specimen
 - <Loc>: country
 - <Lab>: /institution ?
 - <recID> stamp provided by machine

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
