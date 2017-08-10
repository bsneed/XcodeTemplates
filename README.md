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

Now you can open the MyUtilityLib project and see it has been catered to your project.


Templates
---------

`SwiftUtilityLib`

This template uses Swift as the language and builds static libraries for iOS and MacOS.  It also contains test targets for both iOS and MacOS and provides for os specific tests as well as tests that should run on both platforms.



