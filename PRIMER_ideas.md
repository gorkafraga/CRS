
# CRS PRIMER ideas


## 1. Project folder trees
This would be a few principles to guide a research project folder structure, and some examples of increasing complexity
_Main Principles_
 - Fix a global structure from the start, not too rigid, not too open to changes
 - Terminology for dummies: root directory, parent folder, children, etc.
 - Healthy habits: Readme.txt files at each level when relevant to SHORTLY show what's inside 
 - Raw data separate from analysis folder, and why 
 - Scripts separate from data, and why  


The PRIMERS below are oriented for researchers using coding to some extent, but not necessarily advanced programmers

## 2. Forget the Backlash: project folders and relative paths
Why? reproducibility, interoperability 
Integrates well with primer #1. Explains the concept of relative and absolute path. Familiar problem: everytime you share the script with someone or you run it in a different device the paths to your data change. Recommends a fix global structure, e.g., script folder at the same level as data folder. Gives examples in matlab, python and R with functions to avoid this issue. Another problem: file separator differs acrross operating systems. Again Matlab, py and R examples on how to avoid hardcoding that. 

## 3. A very basic setup of Github to make your code more FAIR 
Why? version control, accessibility, findability 

The Git-related terminology can be confusing. Available documentation is too technical and can push some researchers away: they run a research lab, not a team of developers. 
However, they increasingly depend on coding to produce reproducible findings. 

This is a concise, very practical manual describing a user scenario in which no advanced coding skills are needed. Only the simplest Git functionalities are used:  
keeping your code synchronized online and being able access previous versions. Additional content for users with advanced interest describes how this could work in a lab where several projects are run. 
A box clarifies terms like Git, Gitlab and Github, push, commit, pull, etc.  

> There are some papers (e.g. https://doi.org/10.1007/s40614-019-00202-5) . The idea here is to do it more concise and practical (primer style), with better visuals. 
And more readable than IT tutorials

## 4. Making a website with R and Github 
Why? facilitates sharing, dissemination, education 

Intended for regular users of R and python (not necessarily expert programmers) and basic users of Github.
Making a static website, hosted free, without external dependences and minimal amount of coding (R markdown | Quarto).
This can be helpful to researchers in multiple scenarios: as a main lab website (documentation, vacancies, projects, education), to promote an event or as a personal website. 
Researchers can disseminate text, figures and tables (even with basic interactive widgets are possible), code and links, without the need for IT support or paid subscriptions. 
A simple workflow is described and links for more complicated possibilities provided.    

> Limited to R, including python tools will make it too long
 
## 5. Using R interactive data tables as a data finder or an image explorer  
Why? facilitates data sharing, findability, accessibility  

Interactive html tables to share or explore results or data available. Shows a simple pipeline which only requires R markdown or Quarto, so just R coding experience. 
No expert programming in R is required either. Shows different examples, with filter search panes, rendering images in the table or clickable links. 
For basic users it introduces the distinction between static and dynamic html, Server vs Client side apps 
For advance users interested it introduces tools like Crosstalk and flexdashboard.

> Integrates well with other primers. Things like rendering the images are simple once you know but took me a while to figure it out. 
