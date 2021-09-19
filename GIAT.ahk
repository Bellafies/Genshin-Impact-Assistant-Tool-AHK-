; # So its works fine in Genshin -------------------------------------------------------------------------------------------------------------------------------

; https://github.com/Bellafies

#UseHook
#KeyHistory, 0
#HotKeyInterval 1
#MaxHotkeysPerInterval 2
#maxthreadsperhotkey 2
#NoEnv
#SingleInstance, Force
#Persistent

; Needs to run as Admin ;

IF NOT A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}

; tray settings

Menu, tray, NoStandard

Menu, tray, Add, Reload, reload
Menu, tray, Add, Exit, exit

;-------------------------------------EXIT KEY---------------------------------------------------------------------------------

MButton::
ExitApp
return

;-------------------------------------AUTO WALK WITH SPRINT---------------------------------------------------------------------------------

XButton1::
KeyPressed := !KeyPressed

if KeyPressed {
	
	Send, {w down}
	
	Loop {
		
		Send, {Shift Down}
		
		BreakableSleep(1000, KeyPressed)
		
		Send, {Shift Up}
		
		BreakableSleep(8300, KeyPressed) ; 8300 is for 8.3 Seconds before it sprints again. You can change it to your own Stamina value.
	}until !KeyPressed
} else {
	
	Send, {w up}
	
}
Return

BreakableSleep(TimeToSleepForInMilliseconds, ByRef VariableThatStopsSleepingIfFalse)
{
	StartTickCount := A_TickCount
	Loop
		Sleep, 500 
	until (A_TickCount - StartTickCount >= TimeToSleepForInMilliseconds || !VariableThatStopsSleepingIfFalse)
}

;-------------------------------------SPAM LEFT MOUSE FOR SHOOTING---------------------------------------------------------------------------------

XButton2::
    while(GetKeyState("XButton2","P")) {
        MouseClick, left
        Sleep, 125
    }
return

;-------------------------------------SPAMS F WHILE YOU HOLDING F FOR FASTER PICKING UP---------------------------------------------------------------------------------

f::
    while(GetKeyState("f", "P")) {
        Send, {f}
        Sleep, 125
    }
return

;-------------------------------------SPAMS SPACE WHEN YOU HOLD SPACE FOR UNFREZZING AND GENERAL USAGE---------------------------------------------------------------------------------

Space::
    while(GetKeyState("Space", "P")) {
        Send, {Space}
        Sleep, 125
    }
return
 
;-------------------------------------AUTO TALKING TOGGLE FUNCTION---------------------------------------------------------------------------------

*Space:: ; Shift + Space

Toggle := !Toggle 
Start := true

if Toggle { ; On
	
	MouseMove, 1395, 801 ; Move to choice box
	
	while (Start == true) {
		Send, {Space}
		Sleep, 150
		MouseClick, left
		
	}
	
} else { ; Off
	Start := false
}
return

;------------------------------------------------------------------------------------------------------------------------------- Script end

exit:
ExitApp
return

reload:
Reload
return
