;=================================================================================================================
;F ROW MACRO (F1-F12)
;=================================================================================================================


F2::AutoClick()

F9::Send "#^{Left}"				;F9 as Win + Ctrl + Left Arrow to move to left desktop window 

Alt & F9::SpamBackSlash()

F10::Send "#^{Right}"			;F10 as Win + Ctrl + Right Arrow to move to right desktop window


;F12 will pause the entire script
#SuspendExempt					;Exempt macro from suspended 
F12::{
	Pause -1
	Suspend
}

Ctrl & F12::ExitApp
#SuspendExempt False			;script after this only run when autohotkey is enabled(H logo is white)

;=================================================================================================================
;NON F ROW MACRO
;=================================================================================================================

;shortcut used for restart JVM & screenshot
Alt & 1::PressYAndEnter(2)		;alt + 1 to spam Y & Enter
Alt & 2::screenshot_n_show_word_app()			;alt + 2 to press Printscreen button
Alt & 3::paste_n_minimize_word_app()				;alt + 3 to Win + 4/Open Pinned 4th app in the taskbar
Alt & Esc::Send "#4"				;alt + 4 to Ctrl + V/Paste


;Alt + WASD become arrow keys
Alt & a::left
Alt & s::down
Alt & d::right
Alt & w::up

Ctrl & r::Reload	;Ctrl + R to reload scripts

RAlt & >::Send "{Volume_Up}"	;Right Alt + > for volume up
RAlt & <::Send "{Volume_Down}"	;Right Alt + < for volume down
RAlt & m::Send "{Volume_Mute}"	;Right Alt + m for volume mute

RAlt & /::Send "#+/"			;Right Alt + / to Win + Shift + / (Show Powertoys Shortcut Guide)

:*:slc::select * from 

;increase running script time limit interval 
A_HotkeyInterval := 2000  		;This is the default value (milliseconds).
A_MaxHotkeysPerInterval := 200

;=================================================================================================================
;Remap for 65% keyboard
;=================================================================================================================

;ctrl + number become numpad
Ctrl & 0::Numpad0
Ctrl & 1::Numpad1
Ctrl & 2::Numpad2
Ctrl & 3::Numpad3
Ctrl & 4::Numpad4
Ctrl & 5::Numpad5
Ctrl & 6::Numpad6
Ctrl & 7::Numpad7
Ctrl & 8::Numpad8
Ctrl & 9::Numpad9

;=================================================================================================================
;FUNCTIONS
;=================================================================================================================

;Autoclick "A". press F2 to start. press Capslock to stop or F12 to pause
AutoClick(){
	/*
	if !WinExist("Untitled - Notepad"){
		Run "notepad.exe"
		WinWait("Untitled - Notepad")
		WinShow ("Untitled - Notepad")
		WinActive("Untitled - Notepad")
	}else{
		WinRestore				;Restore the window if it is minimized
		WinActivate				;Activate the window to bring it to the foreground
	}*/

	if(GetKeyState("CapsLock", "T") == 0){
		SetCapsLockState(1)
	}
    
    Loop{

        Send "{A}"
        Sleep 1000  			;Start pressing the key every X miliseconds
    }until (GetKeyState("CapsLock", "T")  != 1)
	Persistent
    
}

SpamBackSlash(){

	if(GetKeyState("CapsLock", "T") == 0){
		SetCapsLockState(1)
	}
    
    Loop{

        Send "{\}"
        Sleep 1000  ; Start pressing the key every X miliseconds
    }until (GetKeyState("CapsLock", "T") != 1)
	Persistent
    
}

PressYAndEnter(times) {
    Loop times {
        Send "{Y}"
        Sleep 200  				
        Send "{Enter}"
        Sleep 200
    }
}

show_app(string_name){
	SetTitleMatchMode 2
	SetTitleMatchMode "Fast"
	WinRestore(string_name)
}

hide_app(string_name){
	SetTitleMatchMode 2
	SetTitleMatchMode "Fast"
	WinMinimize(string_name)
}

screenshot_n_show_word_app(){
	Send "#{PrintScreen}"
	Sleep 500
	show_app("Midtrans Bi-Fast DMB Omni WinWas1234 IL IL Timer")	
}

paste_n_minimize_word_app(){
	Send "^v"
	Sleep 500
	hide_app("Midtrans Bi-Fast DMB Omni WinWas1234 IL IL Timer")
}