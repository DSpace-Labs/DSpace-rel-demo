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

