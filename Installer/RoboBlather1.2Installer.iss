; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "RoboBlather"
#define MyAppVersion "1.2"
#define MyAppPublisher "Zeta Centauri"
#define MyAppURL "http://zetacentauri.com/software_roboblather.htm"
#define MyAppExeName "RoboBlather.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{82FE27C8-E07C-4B74-81E0-16F0B5FE384B}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\Zeta Centauri\RoboBlather
DefaultGroupName=Zeta Centauri\RoboBlather
DisableProgramGroupPage=yes
LicenseFile=C:\Users\Xangis\code\RoboBlather\License.txt
OutputDir=C:\Users\Xangis\code\RoboBlather\Installer
OutputBaseFilename=RoboBlather1.2Setup
SetupIconFile=C:\Users\Xangis\code\RoboBlather\RoboBlather.ico
UninstallDisplayIcon={app}\RoboBlather.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "C:\Users\Xangis\code\RoboBlather\bin\Release\RoboBlather.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\Xangis\code\RoboBlather\RoboBlather.ico"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall skipifsilent
