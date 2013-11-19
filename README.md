# Windows Butler v2.1

![Butler](/data/butler.png)

An Autohotkey script to help you with common windows tasks.

That's putting it mildly.

Actually, this is a life-saver, and I just can't imagine using windows without it.

## Table of Contents

* [Usage Instructions](#usage)
* [List of Shortcuts](#hotkeys)
* [Stuff to do](#todo)
* [Could be added later](#later)
* [Changelog](#changelog)

## <a name="usage"></a>Usage Instructions

You'll need to have [Autohotkey](http://l.autohotkey.net/AutoHotkey_L_Install.exe) installed.

Just do it, if you already haven't, you'll be needing it for most of my stuff.

Once you have AHK installed, download the [zip](https://github.com/dufferzafar/win-butler/archive/master.zip), extract the contents, and Run WinButler.ahk

Have fun!

NOTE:

The capslock key's functionality has been disabled in versions greater than 1.8.

Though I know I've done you a [great](http://www.ihatethecapslockkey.com/) favor but if you don't think so, Download the [older version](https://github.com/dufferzafar/win-butler/archive/v1.8.zip) instead.

## <a name="hotkeys"></a>List of Shortcuts

* In windows explorer press these for the desired action

  * **Windows + J** : Show/Hide hidden files and folders.
  * **Windows + Y** : Show/Hide file extensions.

* Screenshot capabilities

  Grab screenshots with ease; press one of the shortcuts and a screenshot will be saved to your My Pictures folder. You can change the path if you want to.

  * **Printscreen** : Save the screen but not the taskbar portion.
  * **Shift + Printscreen** : Save the screen, upload to imgur and copy URL to clipboard.
  * **Ctrl + Printscreen** : Save the entire screen.
  * **Alt + Printscreen** : Save the active window.

* **Alt + Ctrl + C** : Launch Console in the current directory.

  Launches to root "C:\" if path cannot be grabbed.

* **Ctrl + Space** : Launch Scriptlet Library

  Take quick notes. Press Ctrl + Space again to save and exit.

  Useful to save random chunks of code/text or whatever.

  Scriptlets can then be executed, saved to file or copied to clipboard.

* **Alt + Ctrl + D** : Select a phrase and then press to find words similar to it via OneLook Reverse Dictionary.

* **Alt + Ctrl + S** : Save selected text

  Select some text and press Alt+Ctrl+S, give a filename and it'll be saved to desktop.

  When no extension is provided, the deafult i.e txt will be used.

* **Ctrl + Shift + S** : Works in *Sublime text*, Press it to launch the currently open file.

  PHP files are opened by the path from localhost.

* **Ctrl + Shift + Esc** : Launch Task manager

  Ever had that nagging "Task Manager has been disabled by your administrator" dialog?

  Worry no more. This hotkey first removes any sort of restriction placed and then launches the task manager. Sweet!

* **Alt + Ctrl + R** : Launch Registry Editor

  Similar to task manager, any restriction on registry editor is removed.

  Select a registry key like "HKEY_CLASSES_ROOT\Python.File\shell\open" and then Press the hotkey to directly jump to that Key. Sweet, ain't it?

* **Ctrl + V** in a command prompt window

  It is not possible to paste data directly to a command prompt window. Not anymore. :)

* Disabled

  These hotkeys won't work by default for the simple reason that I do not know where you have your files stored. You'll have to tweak the script to provide paths to your help files.

  * **Ctrl + Shift + Q** : Launch Python's help file.
  * **Ctrl + Shift + A** : Launch Autohotkey's help file.
  * **Ctrl + Shift + Z** : Launch Help Folder

## <a name="todo"></a>To Do ASAP

* Screenshots
  * Upload Prompt ??
  * Imgur User Account

* Global Ctrl + W
  * WhiteList/BlackList
  * Maps to Alt+F4
  * But in some applications to Ctrl+W

* Backup Buddy Module ??
* Core Sorting Hat Module

## <a name="later"></a>Could be added later

* Copy selected File/Folder's path.

* Quick Features
  * Ask to run on startup.

* Hide/Unhide Windows Media Player

* TrayMenu
  * Turn Backup Buddy On/Off
  * Settings GUI
  * About Dialog

* AutoShutdown
  * Inputbox
  * Add to Main Process

* Settings GUI
  * Hotkeys - Bindings, On/Off
  * Folder Paths
  * Backup Settings

* Session Store - like chrome extension

* A launcher for some tasks
  * Radial Menu or Sublime like command pallette ?
  * Select text and then play with it: Google, Wiki, WikiQuotes, OneLook.
  * Detect whether the text is url, if so, open it.
  * If the text is larger than 7 words show a save to file action rather than One Look.

* Add other scripts:
  * Renamer
  * Sorting Hat

## <a name="changelog"></a>Changelog

* Enabled: SelectArea. Bug Fixed :)
* Modified: Ctrl+Space remapped to Windows+Space.

* Added: GrabAndUpload - Upload screenshots to Imgur (Shift + Printscreen )

* Refactored: Screenshot.ahk
* Disabled: SelectArea Screenshot (not reliable)
* Added Windows + LButton to grab screen area.

* Added: Alt+Shift+S - Save and Run AHK Scripts
* Modified: Minor improvements to SaveScript:

* Modified: Windows+Down minimizes instead of restoring.

* Added: Windows+S - Autoshutdown in X minutes.
* Updated: Multiple files can be opened in sublime from explorer.
* Added: QtTabBar Improvements. Ctrl+PgDn, Ctrl+PgUp.
* Added: ALt+Ctrl+F Opens the selected file in sublime text.
* Remapped: CapsLock to Backspace.

* **1.8**:

  Removed: Ctrl + N (New File) Hotkey. Useless.

  Changed: Printscreen now captures the screen but avoids the sidebar. Use Shift+Printscreen to capture the entirety, and Ctrl+Printscreen to capture Active Windows.

  Changed: Alt+Ctrl+C - Runs Console2 instead of CommandPrompt.

  New Modules:
    * AutoShutdown
    * Volume OSD

  Refactored into Modules:
    * Run from Sublime
    * Screennshot
    * Registry
    * Explorer

  Added: RegJump - Jumps to a specified registry key

* **1.5**:

  Modified: Ctrl+Shift+Z to open Help Folder instead of PHP.

  Added: Alt+Ctrl+C to launch Console2

  Added: Ctrl+W closes the Command Prompt.

  Added: Ctrl+N to create a new file in folder.

  Explicitly added Gdip.ahk incase it is not present in your standard library.

* **1.4** :

  Added: Alt+Ctrl+D to reverse lookup words on OneLook.

  Added: Some naive hotstrings. Like "i'm" gets converted to "I'm" and such.

  Fixed: The Screenshot directory will be created if it doesn't already exist.

  Added: For Markdown (*.md*) files in sublime. Send Alt+M Hotkey which builds the markdown file and opens in browser - I use the MarkdownEditing plugin.

* **1.3** : Added Run from Sublime

* **1.2** : Added Screenshot features

* **1.0** : Initial Release

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/dufferzafar/win-butler/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

