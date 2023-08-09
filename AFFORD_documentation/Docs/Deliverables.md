# Deliverables
With the FAIR principles in mind, we consider the ORD needs of the reference project and potential solutions

## Storage: data, code and documentation
We consider the following **features** of storage 
### Duration 
_persistent_ | _temporal_ 
- `permanent`: permanent, for long-term archiving 
- `temporal`: intended for short-term or just for transferring files 
### Intended Duration 
_permanent_ | _temporal_ 
- `permanent`: permanent, for long-term archiving 
- `temporal`: intended for short-term or just for transferring files
### File sizes
_large_ | _small_ 
- `large`: large files (e.g., raw scanner 4-D images) and/or many medium size (e.g., pictures in high res)
- `small`: small files like e.g., code, thumbnails, text
### Scalability 
_high_ | _low_ 
- `high`: users have the option to expand memory capacity (with or without cost)
- `low`: memory capacity cannot be changed (e.g., a external harddrive)

### Persistent identification
_yes_ | _no_ 
- `yes`: the content can get a persistent identifier that will facilitate referencing and citing. For example, a digital object identifyer ([DOI](https://www.doi.org/)). E.g., Code in [Zenodo](https://zenodo.org/) will receive a DOI.

>[!NOTE]
> To facilitate academic citations, a [Github](https://github.com/) public repository can be archived in Zenodo [see integration Github-Zenodo](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content). Zenodo can only access public repositories. If the repository belongs to an organization, the organization owner may need to approve access for the Zenodo application. The repository should contain a license so readers know how they can reuse your work.

- `no`: no persistent identifier  


### Accessibility
_public_ | _restricted_ 
- `public`: anyone with the link can access (see permissions)
- `restricted`: there is a log in, an admin must give accss to the user 
### Security
_high_ | _low_ 
- `high`: access management and data are secured, protected from bots and unwanted downloaded or deletions
- `low`: there are no special measures taken to ensure data or privacy security 
### Permissions
_write_ | _read_
- `_write_` can edit files (and delete, no restricted _write_ is considered)
-  `_read_` can view (and download) but cannot edit
### Version control
_yes_ | _no_ 
- `yes`:  users can roll back to previous versions (e.g., previous uploads or _'git push'_). Users can track changes from the different versions
- `no`: users cannot see what was before in that folder or file
### Backup
_yes_ | _no_ 
- `yes`:  users can restore previous versions of a folder which are regularly backed up into an external server
- `no`: no restore previous versions available. 

____


`#0969DA` 

1. Permanent data storage 
2. Sharing lighter data
3. Managing and storing code with version control
4. Managing and storing documentation with version control
5. Hosting a central project html  with links and utilities like the interactive tables
