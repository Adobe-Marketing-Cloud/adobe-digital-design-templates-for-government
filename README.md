# Adobe Digital Design Templates for Government

![](https://mavendc-utils.s3.amazonaws.com/Adobe/bootstrapamerica/images/homepage.png)

The goal of this new 18F AEM template is to bring these recently published standards and web components into AEM. This will give you the ability to create standards-compliant, responsive, and accessible AEM sites that leverage the latest modern web design trends.

This project has a number features that are intended to offer a quick starting point for new projects looking to leverage the latest 18F web standards:

* 7 Pages
  * With placeholder examples and text (download the content from Adobe Package Share available 2/24/16)

* 2 Templates
  * For homepage and content pages
  * Homepage templates are only allowed on top level, and content pages below

* Page component
  * Based upon modern 18F web standards for accessibility
  * Fixed and full-width page properties

* Structural Components
  * Top Navigation
  * Side Navigation
  * Responsive Grid
  * Footer: Dynamic with embedded logo and list components

* Content Components
  * Hero Container Component
  * Text Component
  * Button Component
  * Accordion Component
  * Search Trigger Component
  * Social Links Component
  * Alert Component
  * Address Component


![](https://mavendc-utils.s3.amazonaws.com/Adobe/bootstrapamerica/images/components-screenshot.png)


### Requirements

* CQ 5.6.*, AEM 6.*
* Apache Maven (3.1 or higher)
* Java 7 or higher

## Building

To compile and install locally, navigate to the ‘parent’ folder, and execute the following command

    mvn clean install

Then navigate to the ‘ui’ folder and find the built AEM package, named ‘gov.eighteenf.cq-code-{VERSION_HERE}.jar


These free templates are made available under the Apache 2.0 License. They are not part of an Adobe product and not covered by product support. See http://www.apache.org/licenses/LICENSE-2.0