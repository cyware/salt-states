# Name: AndroidProjectCreator
# Website: https://maxkersten.nl/projects/androidprojectcreator
# Description: Convert an Android APK application file into an Android Studio project for easier analysis.
# Category: Statically Analyze Code: Android
# Author: Max Kersten: https://twitter.com/LibraAnalysis
# License: GNU General Public License (GPL) v3: https://github.com/ThisIsLibra/AndroidProjectCreator/blob/master/LICENSE
# Notes: Use AndroidProjectCreator to run the tool. Before running it for the first time, execute `AndroidProjectCreator -compactInstall` to download the latest dependencies. Use Android Studio to examine the output of the tool.

include:
  - cyware.repos.cyware
  
android-project-creator:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: cyware