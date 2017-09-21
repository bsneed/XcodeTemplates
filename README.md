# XcodeTemplates
Template system for Xcode projects that's much easier to manage and add to.

note: Swift Static lib templates require Xcode 9 and above.

Why?
-----
Xcode's built in templating system is a pain to use.  Projects/Files can't be easily edited or modified within Xcode, and Xcode's templating isn't very well documented (only by 3rd parties) and tends to change between releases, which in turn creates a great deal of work just keeping templates up to date.

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

This template uses Swift as the language and builds a static library for both iOS and MacOS, along with unit test targets for each.  Both product targets use the same files/tests, and output a static lib with the same name regardless of platform.  ie: `mylib.a` and *not* `mylib-ios.a` or `mylib-macos.a`.

`SwiftUtilityLibiOS`

This template uses Swift as the language and builds a static library for iOS along with a unit test target.

`SwiftUtilityLibMacOS`

This template uses Swift as the language and builds a static library for MacOS, along with a unit test target.

`SwiftFeatureiOS`

This template uses Swift as the language and builds a framework for iOS, along with a unit test target.  A Test Harness target is also included to build/test/automate features in a standalone environment, which facilitates better feature isolation.  An automation target that points to the Test Harness is also included.

`SwiftFeatureLibiOS`

This template uses Swift as the language and builds a static library for iOS, along with a unit test target, and a separate bundle for resources.  A Test Harness target is also included to build/test/automate features in a standalone environment, which facilitates better feature isolation.  An automation target that points to the Test Harness is included as well.

