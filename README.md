# Batch Rename for Steam Screenshots
 [![GitHub All Releases](https://img.shields.io/github/downloads/Zafpyr/Batch-Rename-for-Steam-Screenshots/total)](https://somsubhra.github.io/github-release-stats/?username=Zafpyr&repository=Batch-Rename-for-Steam-Screenshots) [![GitHub followers](https://img.shields.io/github/followers/Zafpyr.svg?style=social&label=Follow)](https://github.com/Zafpyr) [![Twitter Follow](https://img.shields.io/twitter/follow/Zafpyr.svg?style=social&label=Follow)](https://twitter.com/Zafpyr)

## About
Ever taken screenshots of a game not with steam's built-in screenshot function and wanted to upload them to steam but didn't know how or the process was too tedious (if you have many), well the script(s) in here will allow you to do just that, provided the images are in jpg format, which can be converted in bulk with various software such as Adobe Lightroom. 

## System Compatibility
- Sorry Linux and Mac users, **this script will only work on Windows**.
- Yes, it will **probably** run on your Windows toaster and Windows potato, feel free to test and let me know :)

## Features
- Will generate a unique name for screenshots or any file(s) based on its "Creation Date" and Steam's screenshot naming scheme. (eg: 20211215151122_1.jpg), if the file already exists in the output directory it will increment the number after the underscore, so no possibility for any files to be overwritten.
- Drag and drop functionality.
- Configure a custom output directory for the renamed images.
- Automatically closes and relaunches steam so that it can rescan its screenshot directories (**Disabled by default.**). Also, Steam's screenshot UI will be displayed as soon as steam has finished relaunching - so you can upload your screenshots.

## Usage - Quickstart
- [Download](https://github.com/Zafpyr/Batch-Rename-for-Steam-Screenshots/releases/download/v0.1-vbs-alpha/BatchRenameForSteamScreenshots.vbs) the script
- Batch convert any images that aren't in jpg format using Adobe Lightroom or similar (Only if they're images you wish to upload to steam).
- Select multiple files in Windows file explorer with either CTRL+A (All), CTRL+left mouse click (one at a time), SHIFT+left mouse click(range), or left mouse click and drag. 
- Now click and drag like you're copying them, but drop them onto the script.
- Now watch the output directory (**Default: "Batch renamed" on your desktop**)
- If needed, move the screenshots from the output directory (**Default: "Batch renamed" on your desktop**) to the steam screenshots directory relevant to the game and your account. (eg: C:\Program Files (x86)\Steam\userdata\42069\760\remote\5318008\screenshots)
- Relaunch steam.
- Click **view** then **screenshots** in the top left of the main steam window.
- Upload your screenshots!

## Usage
- [Download](https://github.com/Zafpyr/Batch-Rename-for-Steam-Screenshots/releases/download/v0.1-vbs-alpha/BatchRenameForSteamScreenshots.vbs) the script.
- Right-click on the script and open it with notepad.
- Configure **customOutDir** on **line 3** (Optional) (eg: C:\Program Files (x86)\Steam\userdata\**UserID**\760\remote\**GameID**\screenshots) replace **UserID** and **GameID** relevant to your needs. 
- Set automateSteamRelaunch to **True** on **line 7** (Optional)
- Select multiple files in Windows file explorer with either CTRL+A (All), CTRL+left mouse click (one at a time), SHIFT+left mouse click(range), or left mouse click and drag. 
- **click and drag** like you're copying them, but **drop them onto the script**.
- Now watch the output directory (**Default: "Batch renamed" on your desktop**)
- If needed, move the screenshots from the output directory (**Default: "Batch renamed" on your desktop**) to the steam screenshots directory relevant to the game and your account. (eg: C:\Program Files (x86)\Steam\userdata\42069\760\remote\5318008\screenshots)
- Relaunch steam (if it didn't automatically, not configured to).
- Click **view** then **screenshots** in the top left of the main steam window. (if it didn't appear automatically).
- Select the images you wish to upload to steam as screenshots and upload them.

## Notes
** If the script fails to close steam, you may have to tell it where steam is installed, if different from the default (C:\Program Files (x86)\Steam)

## [Download](https://github.com/Zafpyr/Batch-Rename-for-Steam-Screenshots/releases/download/v0.1-vbs-alpha/BatchRenameForSteamScreenshots.vbs)
