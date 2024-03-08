;~ Process,priority, , high
#NoTrayIcon
#Persistent
#SingleInstance,Force
#NoEnv

;==========================================================
; Indicator on Screen - CapsLock ScrollLock NumLock state
;==========================================================

SetTimer, minToRestart, 6000000  ; optional, auto-reload per x ms

SetTimer, CheckCapsLock, 1000  ; timer frequent to check state Capslock state in ms
SetTimer, CheckScrollLock, 1000  ; timer frequent to check state Scrolllock state in ms
SetTimer, CheckNumLock, 1000  ; timer frequent to check state Numlock state in ms

CheckCapsLock:
    if GetKeyState("CapsLock", "T")
    {
        if (!CapsLockOn) {
            ; Store the title of the currently active window
            WinGetActiveTitle, ActiveTitle

            Gui, LockDisplay_CapsLock: New
            Gui, LockDisplay_CapsLock: +AlwaysOnTop -Caption
            Gui, LockDisplay_CapsLock: +ToolWindow
            Gui, LockDisplay_CapsLock: Color, F0EAD6 ; Base color GUI
            Gui, LockDisplay_CapsLock: Font, s10 cRed Bold ; Font customisation

            GuiWidth := 200  ; Width of the GUI window
            GuiHeight := 28  ; Height of the GUI window
            TextWidth := 180  ; Width of the text
            TextHeight := 14  ; Height of the text
            TextX := (GuiWidth - TextWidth) // 2  ; Calculate X position for centering horizontally
            TextY := (GuiHeight - TextHeight) // 2  ; Calculate Y position for centering vertically
            Gui, LockDisplay_CapsLock: Add, Text, x%TextX% y%TextY% w%TextWidth% h%TextHeight% Center, CAPS LOCK is ON  ; Text on GUI

            ;~ Gui, LockDisplay_CapsLock: Show, x1165 y698 w200 h28
            Gui, LockDisplay_CapsLock: Show, x1238 y830 w200 h28  ; GUI's X Y position, width & height

            WinSet, Transparent, 140, LockStateDisplayer.ahk  ; Transparency value
            WinSet, ExStyle, +0x80020, LockStateDisplayer.ahk  ; "LockStateDisplayer.ahk" rename as per actual script name, should match the name of script
            WinSet, AlwaysOnTop, On, LockStateDisplayer.ahk
            CapsLockOn := true

            ; Activate the previously active window
            WinActivate, %ActiveTitle%
        }
    }
    else
    {
        if (CapsLockOn) {
            Gui, LockDisplay_CapsLock: Destroy
            CapsLockOn := false
        }
    }
Return

CheckScrollLock:
    if GetKeyState("ScrollLock", "T")
    {
        if (!ScrollLockOn) {
            WinGetActiveTitle, ActiveTitle

            Gui, LockDisplay_ScrollLock: New
            Gui, LockDisplay_ScrollLock: +AlwaysOnTop -Caption
            Gui, LockDisplay_ScrollLock: +ToolWindow
            Gui, LockDisplay_ScrollLock: Color, F0EAD6
            Gui, LockDisplay_ScrollLock: Font, s10 cRed Bold

            GuiWidth := 200
            GuiHeight := 28
            TextWidth := 180
            TextHeight := 14
            TextX := (GuiWidth - TextWidth) // 2
            TextY := (GuiHeight - TextHeight) // 2
            Gui, LockDisplay_ScrollLock: Add, Text, x%TextX% y%TextY% w%TextWidth% h%TextHeight% Center, SCROLL LOCK is ON

            ;~ Gui, LockDisplay_ScrollLock: Show, x1165 y668 w200 h28
            Gui, LockDisplay_ScrollLock: Show, x1238 y800 w200 h28

            WinSet, Transparent, 140, LockStateDisplayer.ahk
            WinSet, ExStyle, +0x80020, LockStateDisplayer.ahk
            WinSet, AlwaysOnTop, On, LockStateDisplayer.ahk
            ScrollLockOn := true

            WinActivate, %ActiveTitle%
        }
    }
    else
    {
        if (ScrollLockOn) {
            Gui, LockDisplay_ScrollLock: Destroy
            ScrollLockOn := false
        }
    }
Return

CheckNumLock:
    ; For case NumLock, set on reverse condition, GUI will be displayed when NumLock state is Off
    if !GetKeyState("NumLock", "T")
    {
        if (!NumLockOn) {
            WinGetActiveTitle, ActiveTitle

            Gui, LockDisplay_NumLock: New
            Gui, LockDisplay_NumLock: +AlwaysOnTop -Caption
            Gui, LockDisplay_NumLock: +ToolWindow
            Gui, LockDisplay_NumLock: Color, F0EAD6
            Gui, LockDisplay_NumLock: Font, s10 cRed Bold

            GuiWidth := 200
            GuiHeight := 28
            TextWidth := 180
            TextHeight := 14
            TextX := (GuiWidth - TextWidth) // 2
            TextY := (GuiHeight - TextHeight) // 2
            Gui, LockDisplay_NumLock: Add, Text, x%TextX% y%TextY% w%TextWidth% h%TextHeight% Center, NUM LOCK is OFF

            ;~ Gui, LockDisplay_NumLock: Show, x1165 y638 w200 h28
            Gui, LockDisplay_NumLock: Show, x1238 y770 w200 h28

            WinSet, Transparent, 140, LockStateDisplayer.ahk
            WinSet, ExStyle, +0x80020, LockStateDisplayer.ahk
            WinSet, AlwaysOnTop, On, LockStateDisplayer.ahk
            NumLockOn := true

            WinActivate, %ActiveTitle%
        }
    }
    else
    {
        if (NumLockOn) {
            Gui, LockDisplay_NumLock: Destroy
            NumLockOn := false
        }
    }
Return

minToRestart:
    Reload
Return
