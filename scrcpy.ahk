#NoEnv
#SingleInstance Force 		;Reload when restart
#IfWinActive ahk_class SDL_app 	;Enable hotkey scripts when active scrcpy window

SendMode Input
Path:="C:\Program Files (x86)\scrcpy-win64-v1.17" ;Edit it to your path


Gui Font,s12,Microsoft YaHei UI
Gui Add,Button,,USB
Gui Add,Button,,TCP
Gui Show
return

ButtonUSB:
Gui Destroy
Run %Path%\scrcpy.exe,%Path%
WinWaitActive ahk_class SDL_app
Send !o 			;Turn device screen off after start
WinHide %Path%\scrcpy.exe 	;Hide the cmd window after start
return

ButtonTCP:
Gui Destroy
RunWait %A_ScriptDir%\sTCP.bat,%Path%,Hide
MsgBox 0x21,Success,Unplug to continue
IfMsgBox Cancel
	ExitApp

Run %Path%\scrcpy.exe,%Path%
WinWaitActive ahk_class SDL_app
Send !o
WinHide %Path%\scrcpy.exe
return


;Send button hotkey
CapsLock & 1:: 		;Hotkey
	WinGetPos,,,w,h,ahk_class SDL_app
	x:=632/1080*w 	;x of send button / Screen width
	y:=787/2400*h 	;y of send button / Screen height
	Click %x%,%y%
	return

;Selecting words hotkey
CapsLock & 2::
	Loop 1
		Send {Right}
	Send {Space}
	return

CapsLock & 3::
	Loop 2
		Send {Right}
	Send {Space}
	return

CapsLock & 4::
	Loop 3
		Send {Right}
	Send {Space}
	return

CapsLock & 5::
	Loop 4
		Send {Right}
	Send {Space}
	return

CapsLock & 6::
	Loop 5
		Send {Right}
	Send {Space}
	return


GuiClose:
	ExitApp
