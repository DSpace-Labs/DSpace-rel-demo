# Making DSpace Your Own

Terry Brady

Georgetown University Library

https://github.com/terrywbrady/info

![](https://www.library.georgetown.edu/sites/default/files/library-logo.png)

---


### About Me

- DSpace Committer
- Software Developer for the Georgetown University Library
  - Lead developer for [DigitalGeorgetown](https://repository.library.georgetown.edu)

  ![Digital Georgetown Institutional Repository](https://repository.library.georgetown.edu/themes/ir//images/ir-logo.png)

---

### DSpace Code Overview

![DSpace Overlay Illustration](presentation-files/DSpace%20Overlays.jpg)

+++

### DSpace Code
- [DSpace 6x "Source" Code Branch](https://github.com/DSpace/DSpace/tree/dspace-6_x)
- [DSpace 6.2 Release Packages](https://github.com/DSpace/DSpace/releases/tag/dspace-6.2)

+++

### DSpace Code
- [DSpace 6.2 "Release" Code - For This Demo](https://github.com/DSpace-Labs/DSpace-rel-demo)
  - This is what we will modify

---

### Running DSpace
- You need a runtime environment for your code |
- A server with tomcat and a postgres database (linux preferred) |
- Docker or Vagrant containers (for developers) |
- Cloud development environment like [Codenvy](http://codenvy.com) |
  - For this presentation, Codenvy will be used |
  - [This page](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/README.md) describes how you can configure a site on Codenvy

---
### Agenda
- Options for loading content into DSpace |
- Configuration customization |
- Creating a custom DSpace theme |
- Modifying the item submission process |
- Modifying metadata fields to display |
- Modifying facets (time permitting) |
- Creating a custom crosswalk (time permitting) |

---

### Options for loading content into DSpace
- Import AIP File (exported metadata and bitstreams) |
- Manually submit item |
- Create items from metadata only |
- Bulk update of metadata |
- Other Options |
  - SIP Import |
  - OAI Ingest |
  
+++

### Ingest into DSpace

![DSpace Ingest Options Illustration](presentation-files/DSpaceIngest.jpg)

+++

### Demo: Import AIP File (exported metadata and bitstreams)
- _For time, this has already been run_
- [Sample AIP Files with pictures of my dog](https://github.com/DSpace-Labs/DSpace-codenvy/tree/master/TestData)
- [Create Administrator Script](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/Scripts/workspaceInit.sh#L34) 
- [Data Load Script](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/Scripts/workspaceInit.sh#L36-L43) 

+++

### Demo: Manually submit item

- Submit item to Demo Collection

+++

### Demo: Create items from metadata only

- [Metadata Upload CSV](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/TestData/metadataUpload.csv)

+++

### Demo: Bulk update of metadata

- Open report page: `/rest/static/reports/query.html`
- Search for items with a title like "Demo%"
- Show type field
- Add type to CSV file
- Upload metadata file

---

### Customize DSpace via Config File

- xmlui.user.registration=false
- webui.browse.thumbnail.show = false

+++

### Customize Language
- Change repository name

---
### Create custom theme

- Change background colors
- Add logo
- Apply to a specific community

---
### Modify the submission process

- Add custom field to ingest form

---
### Modify data on a page via theme

- Add new field to item display page

---
### Modify crosswalk

---
### Add custom facet
