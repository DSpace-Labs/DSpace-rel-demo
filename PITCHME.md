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

### Presentation Tasks

@ul

- Demonstrate multiple ways to ingest content into DSpace
- Code 1: Change browse display properties
- Code 2a: Customize item submission process
- Code 2b: Customize item metadata to display
- Code 2c: Customize metadata navigation facets
- Code 3: Create a collection-specific theme

@ulend

+++

### About the presentation

- Not all of the code changes will make immediate sense
- The key is to see HOW the changes are made
- Once you know HOW to change something in DSpace, other types of changes are easy to learn

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

@ul

- You need a runtime environment for your code 
- A server with tomcat and a postgres database (linux preferred) 
- Docker or Vagrant containers (for developers) 
- Cloud development environment like Codenvy (codenvy.com) 
- For this presentation, Codenvy will be used 

@ulend

+++

### After the webinar, try it yourself!
- [This page](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/README.md) describes how you can configure a site on Codenvy
- [Codenvy Factory for this demo](https://codenvy.io/dashboard/#/load-factory/factoryzf5xhtlskikjevyk)

---

### Understanding Ingest Options
- Becoming comfortable with the ingest options for DSpace is a key way to make DSpace your own
- We will review a couple of options

+++ 

### Ingest into DSpace

![DSpace Ingest Options Illustration](presentation-files/DSpaceIngest.jpg)


---
### Overview

@ul 

- Demo 1. Ingest image collection from AIP files 
- Reconfigure item list options 
- Demo 2. Ingest collection from Metadata 
- Customize metadata for collection 
- Demo 3. Create custom theme

@ulend

---

### Ingest Demo 1: Import Image Collection AIP Files 
- _For time, this has already been run_
- [Sample AIP Files with pictures of my dog](https://github.com/DSpace-Labs/DSpace-codenvy/tree/master/TestData)
- [Create Administrator Script](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/Scripts/workspaceInit.sh#L34) 
- [Data Load Script](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/Scripts/workspaceInit.sh#L36-L43) 

+++

### Demo 1 - Tour the Collection

+++ 

### Code 1 - Change item listing

- Branch: webinar-code1
- https://github.com/DSpace-Labs/DSpace-rel-demo/pull/2/files
- Rebuild system

+++ 

### Rebuild System

    # set the following in Codenvy configs
    # DSPACE_SRC=/home/user/dspace-src/DSpace
    # DSPACE_INSTALL=/home/user/dspace
    # LOCAL_CFG=/projects/DSpace-codenvy/CodenvyConfig/local.cfg
    # MVN_TARGET=package
    # MVN_TARGET="package -Dmirage2.on=true"
    # DSPACE_VER=6
    
    START_TOMCAT=${1:-1}
    TOMCAT=/home/user/tomcat8/bin/catalina.sh
    
    cd ${DSPACE_SRC} || die "src dir ${DSPACE_SRC} does not exist"
    cp ${LOCAL_CFG} . || die "error copying local: ${LOCAL_CFG}"
    mvn ${MVN_TARGET} || die "maven failed"
    cd dspace/target/dspace-installer || die "install dir not found"
    ${TOMCAT} stop
    ant update clean_backups || die "ant update failed"
    ${TOMCAT} run

@[1](Go to source directory)
@[2](Local config file contains server specific settings)
@[3](Run the maven build)
@[4](Go to build directory)
@[5](Stop tomcat)
@[6](Install built files to server)
@[7](Start Tomcat)

+++

### Browse site and see thumbnails

---

### Ingest Demo 2A: Create items from metadata only

- [Metadata Upload CSV](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/TestData/metadataUpload.csv)

+++

### Demo 2 - Tour the Collection

- Note the facets that are present
- Note the items that have been added
- Manually submit an item to the collection

+++

### Code 2A - Modify submission workflow

- Branch: webinar-code2
- https://github.com/DSpace-Labs/DSpace-rel-demo/pull/3/files
- Rebuild system
- Submit a new item to a collection

+++

### Code 2B - Modify item summary page

- Branch: webinar-code2b
- https://github.com/DSpace-Labs/DSpace-rel-demo/pull/4
- Rebuild system
- View item page

+++

### Code 2C - Modify facets

- Branch: webinar-code2c
- https://github.com/DSpace-Labs/DSpace-rel-demo/pull/5
- Rebuild system
- Re-index content if needed `[dspace-install]/bin/dspace index-discovery -b`

---

### Ingest Demo 2B: Bulk update of metadata

- Open report page: `/rest/static/reports/query.html`
- Search for items with a title like "Demo%"
- Show type field
- Add type to CSV file
- Upload metadata file

---

### Demo 3: Create a Custom Theme

- Change background colors
- Add logo
- Apply to a specific community

+++ 

### Code 3 - Define Custom Theme

- Branch: webinar-code3
- https://github.com/DSpace-Labs/DSpace-rel-demo/pull/6

---

### Questions

--- 

### Thank You

Terry Brady

Georgetown University Library

https://github.com/terrywbrady/info

![](https://www.library.georgetown.edu/sites/default/files/library-logo.png)
