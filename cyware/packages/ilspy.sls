# Name: ILSpy
# Website: https://github.com/icsharpcode/ILSpy
# Description: Examine and decompile .NET programs.
# Category: Statically Analyze Code: .NET
# Author: AlphaSierraPapa and https://github.com/icsharpcode/ILSpy/graphs/contributors
# License: MIT License: https://github.com/icsharpcode/ILSpy/blob/master/doc/ILSpyAboutPage.txt
# Notes: This is the command-line version of ILSpy, which you can run using the `ilspycmd` command.

include:
  - cyware.repos.cyware
  - cyware.repos.microsoft
  
ilspycmd:
  pkg.installed:
    - version: latest
    - upgrade: True
    - pkgrepo: cyware