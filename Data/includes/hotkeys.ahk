/**
 * Hotkey List
 *
 * ! = Alt
 * ^ = Ctrl
 * + = Shift
 * # = Windows Key
 *
 * Change hotkeys. Turn them On/Off.
 */

Activate_Hotkeys:

   ; Create a group of windows
   ; Note: Groups are used to club different windows together
   GroupAdd, Explorer_Group, ahk_class CabinetWClass
   GroupAdd, Explorer_Group, ahk_class ExploreWClass

   GroupAdd, Desktop_Group, ahk_class WorkerW
   GroupAdd, Desktop_Group, ahk_class Progman ; for Windows < Vista

   GroupAdd, Taskbar_Group, ahk_class Shell_TrayWnd
   GroupAdd, Taskbar_Group, ahk_class BaseBar
   GroupAdd, Taskbar_Group, ahk_class DV2ControlHost

   GroupAdd, Console_Group, ahk_class ConsoleWindowClass
   GroupAdd, Console_Group, ahk_class PuTTY

   ; CapsLock Be Gone!!
   SetCapsLockState, AlwaysOff

   ; Hotkey,   KeyName, Label,         Options

   Hotkey,     ^+Esc,   RunTaskMan,       On
   Hotkey,     !^r,     RunRegedit,       On
   Hotkey,     #t,      TopMost,          On
   Hotkey,     !^d,     OneLook,          On

   Hotkey,     !^s,     SaveText,         On
   Hotkey,     !+s,     SaveRunScript,    On

   Hotkey,     #Space,  RunScriptlet,     On

   Hotkey,     ^+q,     HelpPython,       On
   Hotkey,     ^+a,     HelpAHK,          On
   Hotkey,     ^+z,     HelpFolder,       On

   Hotkey,     !^c,     RunConsole,       On
   Hotkey,     !^x,     RunGitShell,      On

   Hotkey,     #s,      AutoShutdown,     On
   Hotkey,     ^#e,     RestartShell,     On
   Hotkey,     #Down,   Minimize,         On

   Hotkey, IfWinNotActive, ahk_class QWidget       ; VLC Media Player
   Hotkey,     ^Up,     VolumeUp,         On
   Hotkey,     ^Down,   VolumeDown,       On
   Hotkey, IfWinNotActive

   ; Run files open in sublime text
   Hotkey, IfWinActive, ahk_class PX_WINDOW_CLASS  ; Sublime Text 3
   Hotkey,     ^+s,     RunFromSublime,   On
   Hotkey, IfWinActive

   ; Command prompt improvements
   Hotkey, IfWinActive, ahk_group Console_Group
   Hotkey,     ^v,      PasteClipboard,   On
   Hotkey,     ^w,      CloseCMD,         On
   Hotkey,     PgUp,    ScrollUp,         On
   Hotkey,     PgDn,    ScrollDown,       On
   Hotkey,     Home,    ScrollTop,        On
   Hotkey, IfWinActive

   ; Extend windows explorer
   Hotkey, IfWinActive, ahk_group Explorer_Group
   Hotkey,     #y,      ToggleExt,        On
   Hotkey,     #j,      ToggleHidden,     On
   Hotkey,     !^f,     OpenInSublime,    On
   Hotkey,     ^PgDn,   QtTabDn,          On
   Hotkey,     ^PgUp,   QtTabUp,          On
   Hotkey,     ^s,      Show_SelectFiles_Gui, On
   Hotkey,     Esc,     DeselectAll, On
   Hotkey, IfWinActive

   ; Screener Hotkeys - <screenshot.ahk>
   Hotkey,  PrintScreen,   GrabScreen,             On
   Hotkey,  +PrintScreen,  GrabAndUpload,          On
   Hotkey,  ^PrintScreen,  GrabScreenSansTaskbar,  On
   Hotkey,  !PrintScreen,  GrabWindow,             On
   Hotkey,  #LButton,      GrabArea,               On

Return
