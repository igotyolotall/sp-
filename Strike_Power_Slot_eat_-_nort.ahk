#maxThreadsPerHotkey, 2

Loop, 3
{	
	CenterWindow("ahk_exe RobloxPlayerBeta.exe")
	Sleep 100
}
CenterWindow(WinTitle)
{	
	WinGetPos,,, Width, Height, %WinTitle%
	WinMove, %WinTitle%,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2), 400, 400
}
rtooltip:
tooltip
return
end::reload

f1::
macro_on := !macro_on
if (macro_on)
{
    CoordMode Pixel, Window
    CoordMode Mouse, Window
    current = 0
    slot = 2
    Rythm = 0
    Loop,
    {
        PixelSearch, x, y, 184, 132, 186, 134, 0x3A3A3A, 40, Fast
        if ErrorLevel = 0
        {
            if Rythm = 0
            {
            }
            Send {Click, 50}{Click, Right}
        } 
        Else
        {
            Rythm = 0
            Sendinput, {w up}{s up}
            Sleep 1000
            Sendinput, {w down}{w up}{w down}{s down}
            Sleep 100
            StartTime := A_TickCount
            Loop,
            {
                PixelSearch, x, y, 184, 132, 186, 134, 0x3A3A3A, 40, Fast 
                If ErrorLevel = 0
                {
                    Sleep 2000
                    Sendinput, {w up}{s up}
                    Sleep 100
                    Send {Click, 50}{Click, Right}
                    Break
                }
            } Until A_TickCount - StartTime > 17000
	    Sendinput, {w up}{s up}
        }
        PixelSearch, x, y, 40, 132, 65, 134, 0x3A3A3A, 40, Fast  ; if too low stam
        if ErrorLevel = 0
        {
            Sendinput, {w up}{s up}
            Sleep 10000
        }
        PixelSearch , x, y, 80, 144, 85, 146, 0x3A3A3A, 40, Fast
        If ErrorLevel = 0
        {
		tooltip, eat
		settimer, rtooltip, -3000
            if current <= 5
            {
                Sleep 100
                Send %slot%
                Sleep 200
                Send {Click 10}
                Sleep 5500
                Send %slot%
		Sleep 100
		Send 1
                current++
            }
            if slot = 0
            {
                if current >= 5
                {
                    Send !{f4}
                    Exitapp
                }
            }
            if current >= 5
            {
                slot++
                current = 0
                if slot >= 10
                {
                    slot = 0
                }
            }
        }
        PixelSearch , x, y, 25, 144, 30, 146, 0x3A3A3A, 40, Fast ; logs when hungry
        If ErrorLevel = 0
        {
            Send !{f4}
            Reload
        }
        PixelSearch, x, y, 409, 151, 411, 153, 0x242424,, Fast ;auto flow
        If ErrorLevel = 0
        {
            Send e
            Sleep 100
        }
    }
}
else
{
    ExitApp
}
Return

