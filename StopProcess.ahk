I_Icon = StopProcessLogoPngIco.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%

^p::
WinGet, active_name, ProcessName, A
clipboard := active_name
tooltip %active_name%
sleep 1500
tooltip
return

^<^>!p::
inputbox, pse, Stop Process, Inser the process you want to stop:
if (errorlevel = 1)
{
return
}
else 
{
pse := pse
}
While WinExist("ahk_exe " pse)
process, close, %pse%
;soundplay %DING_FILE% 
;this is a sound file
tooltip %pse% closed
sleep, 1000
tooltip
return

^<^>!k::
WinGet, active_name, ProcessName, A
clipboard := active_name
tooltip %active_name%
sleep 1500
tooltip
if (errorlevel = 1)
{
return
}
else 
{
While WinExist("ahk_exe " clipboard)
process, close, %clipboard%
tooltip %clipboard% closed
sleep, 1000
tooltip
}
return