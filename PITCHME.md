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

- Demonstrate multiple ways to ingest content into DSpace
- Code 1: Change browse display properties
- Code 2: Change Collection Metadata
  - 2a: Customize item submission process
  - 2b: Customize item metadata to display
  - 2c: Customize metadata navigation facets
- Code 3: Create a collection-specific theme

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

### Ingest 1: Import Image Collection AIP Files 
- _For time, this has already been run_
- AIP Ingests preserve handle ids
- [Sample AIP Files with pictures of my dog](https://github.com/DSpace-Labs/DSpace-codenvy/tree/master/TestData)
- [Create Administrator Script](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/Scripts/workspaceInit.sh#L34) 
- [Data Load Script](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/Scripts/workspaceInit.sh#L36-L43) 

+++

### Open Site

---

### Demo 1 - Modify Item List Navigation

### Code 1 - Change item listing

- Branch: webinar-code1
- [Pull Request](https://github.com/DSpace-Labs/DSpace-rel-demo/pull/2/files)
- Rebuild system

+++?image=presentation-files/code1.png

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

@[2-7](Codeny workspace config settings)
@[10](Tomcat server path)
@[12](Go to source directory)
@[13](Local config file contains server specific settings)
@[14](Run the maven build)
@[15](Go to build directory)
@[16](Stop tomcat)
@[17](Install built files to server)
@[18](Start Tomcat)

+++

### Browse site and see thumbnails

---

### Ingest 2A: Create items from metadata only

- [Metadata Upload CSV](https://github.com/DSpace-Labs/DSpace-codenvy/blob/master/TestData/metadataUpload.csv)

+++

### Demo 2 - Tour the Collection

- Note the facets that are present
- Note the items that have been added
- Manually submit an item to the collection

---

### Code 2A - Modify submission workflow

- Branch: webinar-code2
- [Pull Request](https://github.com/DSpace-Labs/DSpace-rel-demo/pull/3/files)
- Rebuild system
- Submit a new item to a collection

+++?image=presentation-files/code2a.png

+++?code=https://raw.githubusercontent.com/DSpace-Labs/DSpace-rel-demo/webinar-code2/dspace/config/input-forms.xml
dspace/config/input-forms.xml
@[74-84](This input field is moved towards the top)
@[79](Type field label change)
@[82](Type field defined as mandatory)

---

### Code 2B - Modify item summary page

- Branch: webinar-code2b
- [Pull Request](https://github.com/DSpace-Labs/DSpace-rel-demo/pull/4)
- Rebuild system
- View item page

+++?image=presentation-files/code2b.png

+++

### Code change - Graft to Overlay Area
- Copy the following from the source branch
  - **dspace-xmlui**/src/main/webapp/themes/Mirage/Mirage.xsl
- And graft it into the overlay area
  - **dspace/modules/xmlui**/src/main/webapp/themes/Mirage/Mirage.xsl
- Add the item summary display template from the following file
  - dspace-xmlui/src/main/webapp/themes/Mirage/lib/xsl/aspect/artifactbrowser/item-view.xsl
  
+++?code=https://raw.githubusercontent.com/DSpace-Labs/DSpace-rel-demo/webinar-code2b/dspace/modules/xmlui/src/main/webapp/themes/Mirage/Mirage.xsl
themes/Mirage/Mirage.xsl
@[46](Item summary view template)
@[245](Add block to show subject field on page)
@[263](Add block to show type field)
@[282](Update field sequence)
@[294](Update field sequence)

---

### Code 2C - Modify facets

- Branch: webinar-code2c
- [Pull Request](https://github.com/DSpace-Labs/DSpace-rel-demo/pull/5)
- Rebuild system
- Re-index content if needed `[dspace-install]/bin/dspace index-discovery -b`

+++?image=presentation-files/code2c.png

+++?code=https://raw.githubusercontent.com/DSpace-Labs/DSpace-rel-demo/webinar-code2c/dspace/config/spring/api/discovery.xml
dspace/config/spring/api/discovery.xml
@[404-416](Define facet field for type)
@[99](Add new facet to sidebar)
@[112](Add new facet to advanced search filter list)

+++

### Code change - Graft to Overlay Area
- Copy the following from the source branch
  - *dspace-xmlui*/src/main/webapp/i18n/messages.xml
- And graft it into the overlay area
  - *dspace/modules/xmlui*/src/main/webapp/i18n/messages.xml

+++?code=https://raw.githubusercontent.com/DSpace-Labs/DSpace-rel-demo/webinar-code2c/dspace/modules/xmlui/src/main/webapp/i18n/messages.xml&lang=xml
i18n/messages.xml
@[2506-2509](customize/translate name for new facet)

---

### Ingest 2C: Bulk update of metadata

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
- [Pull Request](https://github.com/DSpace-Labs/DSpace-rel-demo/pull/6)

+++?image=presentation-files/code3.png

+++

### Code change - Graft to Overlay Area
- Copy the following from the source branch
  - *dspace-xmlui*/src/main/webapp/themes/*Mirage*/sitemap.xmap
- And graft it into the overlay area
  - *dspace/modules/xmlui*/src/main/webapp/themes/*Demo*/sitemap.xmap

+++?code=https://raw.githubusercontent.com/DSpace-Labs/DSpace-rel-demo/webinar-code3/dspace/modules/xmlui/src/main/webapp/themes/Demo/sitemap.xmap&lang=xml
themes/Demo/sitemap.xmap
@[81-82](Add custom css demo.css)
@[103-104](Reuse the Mirage.xsl stylesheet)
@[125-130](Reference Mirage paths for most resources)

+++?code=https://raw.githubusercontent.com/DSpace-Labs/DSpace-rel-demo/webinar-code3/dspace/modules/xmlui/src/main/webapp/themes/Demo/demo.css
themes/Demo/demo.css
@[2-4](Change background color)

+++?code=https://raw.githubusercontent.com/DSpace-Labs/DSpace-rel-demo/webinar-code3/dspace/config/xmlui.xconf
dspace/config/xmlui.xconf
@[157](Set collection-specific theme for a specific handle)

---

### Questions

--- 

### Thank You

Terry Brady

Georgetown University Library

https://github.com/terrywbrady/info

![](https://www.library.georgetown.edu/sites/default/files/library-logo.png)
