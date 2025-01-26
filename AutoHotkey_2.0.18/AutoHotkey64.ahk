;=================================================================================================================
;F ROW MACRO (F1-F12)
;=================================================================================================================

F2::AutoClick()

F9::Send "#^{Left}"				;F9 as Win + Ctrl + Left Arrow to move to left desktop window 

;Alt & F9::SpamBackSlash()

F10::Send "#^{Right}"			;F10 as Win + Ctrl + Right Arrow to move to right desktop window


;F12 will pause the entire script
#SuspendExempt					;Exempt macro from suspended 
F12::{
	Pause -1					;toggle script
	Suspend						;toggle entire mapped hotkey for macro
}

Ctrl & F12::ExitApp
#SuspendExempt False			;script after this only run when autohotkey is enabled(H logo is white)

;=================================================================================================================
;NON F ROW MACRO
;=================================================================================================================

;shortcut used for restart JVM & screenshot
Alt & 1::PressYAndEnter(2)				;alt + 1 to spam Y & Enter
Alt & 2::screenshot_n_show_word_app()	;alt + 2 to press Printscreen button
Alt & 3::paste_n_minimize_word_app()	;alt + 3 to Ctrl + V/Paste and minimize
Alt & Esc::Send "#4"					;alt + esc to Win + 4/Open Pinned 4th app in the taskbar

;Tab::Send "/{Tab}"

;Alt + WASD become arrow keys
Alt & a::Send "{Left}"
Alt & s::Send "{Down}"
Alt & d::Send "{Right}"
Alt & w::Send "{Up}"

Ctrl & r::Reload	;Ctrl + R to reload scripts

RAlt & 4::Send "!{F4}"			;Alt + 4 as Alt + F4

;Media button
RAlt & [::Send "{Media_Prev}"		;Right Alt + [ for previous media
RAlt & ]::Send "{Media_Next}"		;Right Alt + ] for next media
RAlt & p::Send "{Media_Play_Pause}"	;Right Alt + ; for play/pause media
RAlt & o::Send "{Media_Stop}"		;Right Alt + ' for stop media
RAlt & >::Send "{Volume_Up}"		;Right Alt + > for volume up
RAlt & <::Send "{Volume_Down}"		;Right Alt + < for volume down
RAlt & m::Send "{Volume_Mute}"		;Right Alt + m for volume mute

RAlt & /::Send "#+/"			;Right Alt + / to Win + Shift + / (Show Powertoys Shortcut Guide)

;increase running script time limit interval 
A_HotkeyInterval := 2000  		;This is the default value (milliseconds).
A_MaxHotkeysPerInterval := 200

;=================================================================================================================
;Sentence macro/Replace a keyword with sentence
;=================================================================================================================

:*:slc::select * from a 					;after typing "slc" replace it with "select * from a"
:*:slw::select * `nfrom  `nwhere			;after typing "slw" replace it with "select * from x where"
:*:slo::select * `nfrom  `nwhere `norder by ;after typing "slo" replace it with "select * from x where order by"
:*:upw::update `nset  `nwhere				;after typing "upw" replace it with "update x where"
:*:dlw::delete `nfrom  `nwhere				;after typing "dlw" replace it with "delete from x where"

;=================================================================================================================
;Remap for 65% keyboard
;=================================================================================================================

;ctrl + number become numpad
^0::Numpad0
^1::Numpad1
^2::Numpad2
^3::Numpad3
^4::Numpad4
^5::Numpad5
^6::Numpad6
^7::Numpad7
^8::Numpad8
^9::Numpad9

/*
;number become numpad when numlock is enabled
Pause::SetNumLockState !GetKeyState("NumLock", "T") ;toggle numlock using pause key
0::number_become_numpad()
1::number_become_numpad()
2::number_become_numpad()
3::number_become_numpad()
4::number_become_numpad()
5::number_become_numpad()
6::number_become_numpad()
7::number_become_numpad()
8::number_become_numpad()
9::number_become_numpad()
*/

;=================================================================================================================
;FUNCTIONS
;=================================================================================================================

;Autoclick "A". press F2 to start. press Capslock to stop or F12 to pause
AutoClick(){
	
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

;number only become numpad when numlock is enabled. when disabled do nothing.
number_become_numpad(){
	if(GetKeyState("NumLock", "T") == 1){

		if(GetKeyState("1", "P") == 1)
			Send "{Numpad1}"
		if(GetKeyState("2", "P") == 1)
			Send "{Numpad2}"
		if(GetKeyState("3", "P") == 1)
			Send "{Numpad3}"
		if(GetKeyState("4", "P") == 1)
			Send "{Numpad4}"
		if(GetKeyState("5", "P") == 1)
			Send "{Numpad5}"
		if(GetKeyState("6", "P") == 1)
			Send "{Numpad6}"
		if(GetKeyState("7", "P") == 1)
			Send "{Numpad7}"
		if(GetKeyState("8", "P") == 1)
			Send "{Numpad8}"
		if(GetKeyState("9", "P") == 1)
			Send "{Numpad9}"
		if(GetKeyState("0", "P") == 1)
			Send "{Numpad0}"
	}
}