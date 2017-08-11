# XcodeTemplates
Template system for Xcode projects that's much easier to manage and add to.

note: Static lib templates require Xcode 9 and above.

Usage
-----

Clone this repository, and navigate to it on the command line.

`./useTemplate.sh <template> <new_name> <directory>`
  
Example:

```bash
$ ./useTemplate.sh SwiftUtilityLib MyUtilityLib ~/MyWorkDirectory

Copying SwiftUtilityLib to ~/MyWorkDirectory/MyUtilityLib
Renaming files ...
Renaming files ...
Renaming files ...
Replacing occurences of SwiftUtilityLib with MyUtilityLib ...

Enter the desired Organization name:
"Brandon Sneed Heavy Industries"

Done.  The new project now lives here: ~/MyWorkDirectory/MyUtilityLib

```

Now you can open the MyUtilityLib project and see it has been catered to your needs.

Creating your own Templates
---------------------------

Simply start a new Xcode project and place it next to useTemplate.sh on the file system.  The only things you need to do initially is set the organization name to `__TemplateOrgName__`, and use `__templateorgname__` as a bundle identifier, ie: `com.__templateorgname__` or `com.--templateorgname--`.  It's probably also best to avoid using dashes and underscores in your template names as Xcode wants to convert dashes to underscores and vice versa depending on where.


Templates Descriptions
----------------------

`SwiftUtilityLib`

This template uses Swift as the language and builds static libraries for iOS and MacOS.  It also contains test targets for both iOS and MacOS and provides for os specific tests as well as tests that should run on both platforms.



