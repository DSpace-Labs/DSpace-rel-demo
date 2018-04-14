## Making DSpace Your Own

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
- Code 2: Change Collection Metadata
  - === 2a: Customize item submission process
  - === 2b: Customize item metadata to display
  - === 2c: Customize metadata navigation facets
- Code 3: Create a collection-specific theme

@ulend

+++

### About the presentation

- Not all of the code changes will make immediate sense
- The key is to see HOW the changes are made
- Once you know HOW to change something in DSpace, other types of changes are easy to learn
- As we rebuild DSpace, I will share some DigitalGeorgetown examples

---

### DSpace Code Overview

![DSpace Overlay Illustration](presentation-files/DSpaceOverlays.jpg)

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
- Docker or Vagrant containers (development tools) 
- Cloud development environment like Codenvy (codenvy.com) 
- For this presentation, Codenvy will be used 

@ulend

+++

### After the webinar, try it yourself!
- [This page](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/README.md) describes how you can configure a site on Codenvy
- [Codenvy Factory for this demo](https://codenvy.io/dashboard/#/load-factory/factoryk1vrec8gxat0diz6)

---

### Understanding Ingest Options
- Becoming comfortable with the ingest options for DSpace is a key way to make DSpace your own
- We will review a couple of options

+++ 

### Ingest into DSpace

![DSpace Ingest Options Illustration](presentation-files/DSpaceIngest.jpg)

---

### Ingest 1: Import Image Collection AIP Files 
- _For time, this has already been run_
- AIP Ingests preserve handle ids
- [Sample AIP Files with pictures of my dog](https://github.com/DSpace-Labs/DSpace-codenvy/tree/master/TestData)

+++?code=https://raw.githubusercontent.com/DSpace-Labs/DSpace-codenvy/master/Scripts/workspaceInit.sh
Workspace initialization script - already run
@[34](Before ingesting content, we need an administrator id)
@[36-43](Data Load Script)

+++

### Open Site and Navigate to Sample Images
![Live Demo Image](presentation-files/LiveDemo.png)

---

### Demo 1 - Modify Item List Navigation

+++ 

### Code 1 - Change item navigation view

- Branch: webinar-code1
- [Pull Request](https://github.com/DSpace-Labs/DSpace-rel-demo/pull/2/files)
- **Start Rebuild**

+++?image=presentation-files/code1.png&size=auto 90%

+++

### Property changes are made in **dspace/config/dspace.cfg**
- This file contains hundreds of properties that can be modified
- Many of the most common customization tasks are captured in this file
- When testing a change, you can also copy a property change into your local.cfg file

+++?code=https://raw.githubusercontent.com/DSpace-Labs/DSpace-rel-demo/webinar-code1/dspace/config/dspace.cfg
dspace/config/dspace.cfg
@[1896](Turn on thumbnail view in xmlui)

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

@[2-10](Environment variable setup)
@[12](Go to source directory)
@[13](Local config file contains server specific settings)
@[14](Run the maven build)
@[15](Go to build directory)
@[16](Stop tomcat)
@[17](Install built files to server)
@[18](Start Tomcat)

+++?code=dspace/config/dspace.cfg?lang=AsciiDoc
@[1](While the build is running...)
@[19](Basic System Config: directories, servers, email, database)
@[182](DOI Configuration)
@[227](Handle Configuration)
@[263](Default Permissions for Collection Administrators)
@[341](Media Plugins)
@[431](Crosswalk Configuration)
@[696](Named Embargo Policy Configuration)
@[782](Metadata hide configuration)
@[800](Item Submission Configration)
@[823](Creative Commons)
@[870](Thumbnails)
@[1261](RSS)
@[1342](Open Search)
@[1405](Sitemaps)
@[1422](Sherpa/Romeo)
@[1434](Authority Control)
@[1590](JSPUI Config)
@[1829](XMLUI Config)


