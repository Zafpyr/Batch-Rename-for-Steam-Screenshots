# Batch Rename for Steam Screenshots
 [![GitHub All Releases](https://img.shields.io/github/downloads/Zafpyr/Batch-Rename-for-Steam-Screenshots/total)](https://somsubhra.github.io/github-release-stats/?username=Zafpyr&repository=Batch-Rename-for-Steam-Screenshots) [![GitHub followers](https://img.shields.io/github/followers/Zafpyr.svg?style=social&label=Follow)](https://github.com/Zafpyr) [![Twitter Follow](https://img.shields.io/twitter/follow/Zafpyr.svg?style=social&label=Follow)](https://twitter.com/Zafpyr)

## About
Ever taken screenshots of a game not with steam's built-in screenshot function and wanted to upload them to steam but didn't know how or the process was too tedious, well the script(s) in this repo will allow you do just that, provided the screenshots are in jpg format, which can be done with various software such as Adobe Lightroom. 

## Features
- Will generate a unique name for screenshots or any file(s) really based on it's "Creation Date" and Steam's screenshot naming scheme. (eg: 20211215151122_1.jpg), will increment the digit after the underscore, so no possibility for any files to be overwritten.
- Drag and drop functionality.
- Configure a custom output directory for the renamed images (**Line 3** in the script), if left blank, processed files will be put in the "**Batch renamed**" folder on your desktop instead.
- Automatically closes and relaunches steam so that it can rescan it's screenshot directories (**Disabled by default.** Enable it on **line 7** and configure customOutDir on **line 3**). Also Steam's screenshot UI will be displayed as soon as steam has finnished relaunching - so you can upload your screenshots.

## [Download](https://github.com/Zafpyr/Batch-Rename-for-Steam-Screenshots/releases/download/v0.1-vbs-alpha/BatchRenameForSteamScreenshots.vbs)
