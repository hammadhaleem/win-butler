/**
 * Windows Butler
 *
 * Got inspired after seeing a friend's pitiful laptop.
 */

/**
 * Script Settings
 *
 * Do not touch if you are unsure of anything.
 */
#NoEnv
#SingleInstance Force
#Persistent
#NoTrayIcon
#KeyHistory 0
SetWorkingDir %A_ScriptDir%

; Create a group of explorer windows
GroupAdd, Explorer, ahk_class CabinetWClass
GroupAdd, Explorer, ahk_class Progman

; Modify the Menu
Menu, Tray, NoStandard
Menu, Tray, Tip, Windows Butler v0.9

Menu, Tray, Add, &Suspend, SuspendMe
Menu, Tray, Add, &Exit, CloseMe

; Set the icon if it exist
IfExist, %A_ScriptDir%\Data\Butler.ico
	Menu, Tray, Icon, %A_ScriptDir%\Data\Butler.ico

Menu, Tray, Icon	;Else show default icon

; Let the user know we have started
TrayTip, Windows Butler v0.9,
(
I'm right here.....

Consult readme for usage instructions.
)
SetTimer, RemoveTrayTip, 1000

/**
 * Hotkey List
 *
 * ! = Alt
 * ^ = Ctrl
 * + = Shift
 * # = Windows Key
 *
 * Change hotkeys. Turn them On/Off
 */

; Hotkey, 	KeyName,	Label, 			Options

Hotkey, 		^+Esc, 	RunTaskMan, 		On
Hotkey, 		!^r, 		RunRegedit, 		On
Hotkey, 		!^s, 		SaveText, 			On
Hotkey, 		#t, 		TopMost, 			On

Hotkey, 		^Space, 	RunScriptlet, 		On

Hotkey, 		^+q, 		HelpLUA, 			Off
Hotkey, 		^+a, 		HelpAHK, 			Off
Hotkey, 		^+z, 		HelpPHP, 			Off

; Paste text in command prompt
Hotkey, IfWinActive, ahk_class ConsoleWindowClass
Hotkey, 		^v, 		PasteClipboard, 	On
Hotkey, IfWinActive

; Extend windows explorer
Hotkey, IfWinActive, ahk_group Explorer
Hotkey, 		#y, 		ToggleExt, 			On
Hotkey, 		#j, 		ToggleHidden, 		On
Hotkey, 		#c, 		RunCMD, 				On
Hotkey, IfWinActive


Return	 ; End of Auto Execute Section

/**
 * Save selected text to a file
 *
 * Just select some text and Press Alt+Ctrl+S.
 * Enter the filename. Press Enter.
 *
 * The file will be saved to the desktop :)
 */
SaveText:
	tmp = %ClipboardAll% 	;save clipboard
	Clipboard := "" 			;clear
	Send, ^c 					;copy the selection
	ClipWait, 3
	selection = %Clipboard% ;save the selection
	Clipboard = %tmp% 		;restore old content of the clipboard

	If selection <> 			;if something is selected
	{
		;Create a file
		InputBox, FileName, Filename, Please enter a filename with extension., ,250, 150
		SplitPath, FileName, , , Ext

		If (FileName != "")
			If (Ext == "") ; Default - Text File
				FileAppend, %selection%, %A_Desktop%\%FileName%.txt
			Else
				FileAppend, %selection%, %A_Desktop%\%FileName%
	}
Return

/**
 * Always On Top
 *
 * The "current" window becomes the topmost.
 */
TopMost:
	WinSet, AlwaysOnTop, Toggle, A
Return

/**
 * Launch Help Files
 *
 * Make sure the paths are correct
 */
HelpAHK:
	SplitPath, A_AhkPath,, ahk_dir

	If wnd := WinExist("AutoHotkey_L Help")
		WinActivate, ahk_id %wnd%
	Else
		Run, %ahk_dir%\AutoHotkey.chm, , Max
Return

HelpLUA:
	Run, D:\I`, Coder\Scripts`, Codes & Tut\Lua\[Help]\Pdf\luaaio.chm, , Max
Return

HelpPHP:
	Run, D:\I`, Coder\Scripts`, Codes & Tut\PHP\php.chm, , Max
Return


/**
 * Run Task Manager and Registry Editor
 *
 * Applications are run after removing any administrator restrictions (usually caused by viruses)
 */
RunTaskMan:
	RegDelete, HKCU, Software\Microsoft\Windows\CurrentVersion\Policies
	RegDelete, HKCU, Software\Microsoft\Windows NT\CurrentVersion\TaskManager

	RegDelete, HKLM, Software\Microsoft\Windows\CurrentVersion\Policies\Explorer

	RegDelete, HKLM, SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon, DisableCAD
	RegDelete, HKLM, SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System, DisableTaskMgr

	Run Taskmgr.exe
Return

; Also deletes the "LastKey". So, basically starts from scratch
RunRegedit:
	RegDelete, HKCU, Software\Microsoft\Windows\CurrentVersion\Policies
	RegDelete, HKCU, Software\Microsoft\Windows\CurrentVersion\Applets\Regedit, LastKey

	Run Regedit.exe, , Max
Return

/**
 * Scriptlet Library
 *
 * Make sure the additional ahk exists.
 */
RunScriptlet:
	IfWinExist, My Scriptlet Library
	{
		PostMessage, 0x112, 0xF060,,, My Scriptlet Library
	}
	Else
	{
		ScriptletPath := A_ScriptDir . "\data\scriptLib\Scriptlet Library.ahk"
		SplitPath, ScriptletPath,,ScriptletDir
		Run, %ScriptletPath%, %ScriptletDir%
	}
Return

/**
 * Toggle Extension
 *
 * Show/Hide file extensions.
 */
ToggleExt:
	RegRead, FileExt_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt
	If FileExt_Status = 1
		RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 0
	Else
		RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, HideFileExt, 1
	Refresh()
Return

/**
 * Toggle Hidden Files
 *
 * Show/Hide hidden files and folders.
 */
ToggleHidden:
	RegRead, SuperHidden_Status, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, ShowSuperHidden
	If SuperHidden_Status = 0
		{
			RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1
			RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, ShowSuperHidden, 1
		}
	Else
		{
			RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2
			RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, ShowSuperHidden, 0
		}
	Refresh()
Return

/**
 * Run CMD
 *
 * Run command prompt in the current folder
 */
RunCMD:
	;Get the full path from the address bar
	WinGetText, full_path, A

	;Split on newline (`n)
	StringSplit, word_array, full_path, `n

	; Take the first element from the array
	full_path = %word_array1%

	;Remove all carriage returns (`r)
	StringReplace, full_path, full_path, `r, , all
	StringTrimLeft, full_path, full_path, 9

	IfInString full_path, \
	{
		Run, cmd /K cd /D "%full_path%"
	}
	else ;If path is not valid
	{
		Run, cmd /K cd /D "C:\ "
	}
Return

/**
 * Used to send clipboard data to command prompt
 */
PasteClipboard:
	SendRaw %clipboard%
Return

/**
 * Miscellaneous Subroutines
 */

Refresh()
{
    WinGetClass, eh_Class, A
    If (eh_Class = "#32770" OR A_OSVersion = "WIN_VISTA" OR A_OSVersion = "WIN_7")
        Send, {F5}
	Else PostMessage, 0x111, 28931,,, A
}

RemoveTrayTip:
	SetTimer, RemoveTrayTip, Off
	TrayTip
Return

SuspendMe:
	Suspend, Toggle
Return

CloseMe:
ExitApp