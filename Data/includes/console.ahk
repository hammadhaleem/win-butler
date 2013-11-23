/**
 * Run CMD
 *
 * Run command prompt in the current folder.
 *
 */
RunConsole:
	full_path := GetCurrentFolder7()

	IfInString full_path, \
	{
		; Run, cmd /K cd /D "%full_path%"
		Run, Data\console2\console.exe -d "%full_path%"
	}
	Else ;If path is not valid
	{
		; Run, cmd /K cd /D "C:\ "
		Run, Data\console2\console.exe -d "C:\"
	}
Return

CloseCMD:
	WinKill, A
Return

ScrollUp:
	ControlGetFocus, control, A
	SendMessage, 0x115, 2, 0, %control%, A ; WM_VSCROLL = 0x115 | SB_LINEUP = 0
Return

ScrollDown:
	ControlGetFocus, control, A
	SendMessage, 0x115, 3, 0, %control%, A ; WM_VSCROLL = 0x115 | SB_LINEDOWN = 0
Return

ScrollTop:
	ControlGetFocus, control, A
	SendMessage, 0x115, 6, 0, %control%, A ; WM_VSCROLL = 0x115 | SB_TOP = 6
Return

ScrollBottom:
	ControlGetFocus, control, A
	SendMessage, 0x115, 7, 0, %control%, A ; WM_VSCROLL = 0x115 | SB_BOTTOM = 7
Return

/**
 * Used to send clipboard data to command prompt
 */
PasteClipboard:
	SendRaw %clipboard%
Return