;Include Modern UI

  !include "MUI2.nsh"
  !include "FileAssociation.nsh"

Name "RoboBlather 1"
OutFile "RoboBlather1Setup.exe"
InstallDir "$PROGRAMFILES\Zeta Centauri\RoboBlather"
InstallDirRegKey HKLM "Software\RoboBlather" "Install_Dir"
RequestExecutionLevel admin
!define MUI_ICON "RoboBlather.ico"
!define MUI_UNICON "RoboBlather.ico"

;Version Information

  VIProductVersion "1.0.4.0"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "RoboBlather"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "Zeta Centauri"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "Copyright 2012 Zeta Centauri"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "RoboBlather Installer"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "1.0.0.0"
  VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "1.0.0.0"

;Interface Settings

  !define MUI_ABORTWARNING

;Pages

  !insertmacro MUI_PAGE_LICENSE "License.txt"
;  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
      !define MUI_FINISHPAGE_NOAUTOCLOSE
      !define MUI_FINISHPAGE_RUN
      !define MUI_FINISHPAGE_RUN_CHECKED
      !define MUI_FINISHPAGE_RUN_TEXT "Launch RoboBlather"
      !define MUI_FINISHPAGE_RUN_FUNCTION "LaunchProgram"
      !define MUI_FINISHPAGE_SHOWREADME ""
      !define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
      !define MUI_FINISHPAGE_SHOWREADME_TEXT "Create Desktop Shortcut"
      !define MUI_FINISHPAGE_SHOWREADME_FUNCTION finishpageaction
  !insertmacro MUI_PAGE_FINISH
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;Languages
 
  !insertmacro MUI_LANGUAGE "English"


; The stuff to install
Section "RoboBlather"

  SectionIn RO
  
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File "RoboBlather.exe"
  File "License.txt"
  File "RoboBlather.ico"
  
  ; Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\RoboBlather "Install_Dir" "$INSTDIR"
  
  ; Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\RoboBlather" "DisplayName" "RoboBlather"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\RoboBlather" "DisplayVersion" "1"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\RoboBlather" "Publisher" "Zeta Centauri"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\RoboBlather" "DisplayIcon" "$INSTDIR\RoboBlather.ico"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\RoboBlather" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\RoboBlather" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\RoboBlather" "NoRepair" 1
  WriteUninstaller "uninstall.exe"

SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\Zeta Centauri\RoboBlather"
  CreateShortCut "$SMPROGRAMS\Zeta Centauri\RoboBlather\RoboBlather.lnk" "$INSTDIR\RoboBlather.exe" "" "$INSTDIR\RoboBlather.ico" 0
  WriteINIStr "$SMPROGRAMS\Zeta Centauri\RoboBlather\RoboBlather Website.url" "InternetShortcut" "URL" "http://zetacentauri.com/software_roboblather.htm"
  
SectionEnd

; Uninstaller

Section "Uninstall"
  
  ; Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\RoboBlather"
  DeleteRegKey HKLM SOFTWARE\RoboBlather

  ; Remove files and uninstaller
  Delete $INSTDIR\RoboBlather.exe
  Delete $INSTDIR\License.txt
  Delete $INSTDIR\uninstall.exe
  Delete $INSTDIR\RoboBlather.ico

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\Zeta Centauri\RoboBlather\*.*"
  Delete "$DESKTOP\RoboBlather.lnk"
  Delete "$SMPROGRAMS\Zeta Centauri\RoboBlather\RoboBlather Website.url"
  ;DeleteINISec "$SMPROGRAMS\Zeta Centauri\RoboBlather\RoboBlather Website.url" "InternetShortcut"

  ; Remove directories used
  RMDir "$SMPROGRAMS\Zeta Centauri\RoboBlather"
  RMDir "$SMPROGRAMS\Zeta Centauri"
  RMDir "$INSTDIR"


SectionEnd

Function LaunchProgram
  ExecShell "" "$SMPROGRAMS\Zeta Centauri\RoboBlather\RoboBlather.lnk"
FunctionEnd

Function finishpageaction
  CreateShortcut "$DESKTOP\RoboBlather.lnk" "$INSTDIR\RoboBlather.exe" "$INSTDIR\RoboBlather.ico" 0
FunctionEnd