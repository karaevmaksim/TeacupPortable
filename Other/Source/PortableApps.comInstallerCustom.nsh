!macro CustomCodePostInstall
    Rename "$INSTDIR\TeacupTemp\Teacup_Firmware-master" "$INSTDIR\App\Teacup"
    RMDir /r "$INSTDIR\TeacupTemp"
    Delete "$INSTDIR\App\Python\python38._pth"
    System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("PATH", "$INSTDIR\App\Python").r0'
    System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("PATH", "$INSTDIR\App\Python\Scripts").r0'
    System::Call 'Kernel32::SetEnvironmentVariable(t, t) i("PATH", "$INSTDIR\App\Python\Scripts\Lib\site-packages").r0'
    CopyFiles /SILENT "$INSTDIR\Other\Source\get-pip.py" "$INSTDIR\App\Python"
    nsExec::Exec '"$INSTDIR\App\Python\python.exe" "$INSTDIR\App\Python\get-pip.py"'
    Delete "$INSTDIR\App\Python\get-pip.py"
    nsExec::Exec '"$INSTDIR\App\Python\Scripts\pip.exe" install -U wxPython'
!macroend
