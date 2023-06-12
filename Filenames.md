# Formatting principles
- No white spaces
- Only letters, numbers, hyphens, and underscores
- Do not rely on letter case 
- Use separators (hyphen or underscore) in a systematic and meaningful way.

> Known issues
> - [ ] *Information and length*: informative filenames to minimize reliance on additional 'key' metadata file, while avoiding too long names 
> - [ ] *Lab-specific restrictions*:  e.g., filenames in Synchrotron in France cannot be modified after recording, while in Japan they could 
> - [ ] *Unifying*: Data from the same specimen maybe acquired in two locations, but assigned numeric label may not correspond. JP10 is not FR10 necessarily
  
# Name fields 
On this section: 
*Modelity-agnostic*: field should be common to all subprojects and types of data
*Modality agnostic*: field that are exclusive to the specific type of recording and/or lab
*[REQUIRED | OPTIONAL]*: if an field described as OPTIONAL is missing the user should be able to infer the 'default' information

## Modality agnostic  
### Identifiers [REQUIRED]
 - `<specID>` specimen | `<ID>` e.g., if calibrating
 - `<loc>` country
 - `<lab>` institution 
 - `<recID>` (not-user defined) timestamp or alphanumeric id provided by the equiment when recording 

> Known issues
> - [ ] Filenames from equipment calibration or tests like: implant02_dremel, test01, etc. They would ideally also include loc, lab, recID 

### Suffix [OPTIONAL]
- ``<...>`` e.g. xxx_v02 indicates the recording was redone. 
> Known issues
> - [ ] Suffix assumptions need to be specified here, e.g., is the last version always the valid one? 
 
#### Modality specific
 
##### SRµCT
Specimen description
- ``<status>`` Vivo | dead | Dying 

Acquisition parameters 

- ``<...>``
 
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
 
 
 # Examples
 From SOLEIL synchrotron: 020_Mouse89883_5823_PBS_27keV_9000proj_ring_z0_x0, 
 From Japan synchrotron: JP21-invivo-1scan-phase3-postinjection-brain-40min

 
## NOTES 
- www.readthedocs.com as asset for easy to mantain documentation ?
