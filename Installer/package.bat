echo This program runs the desktop app packager command to create a Windows 10 store package from an existing installer.
pause
DesktopAppConverter.exe -Installer "C:\Users\Xangis\code\RoboBlather\installer\RoboBlather1.2Setup.exe" -PackageName "RoboBlather" -Version 1.2.0.0 -Makeappx -Destination "C:\Users\Xangis\code\RoboBlather\installer" -InstallerArguments "/VERYSILENT" -Publisher "CN=Jason Champion" -Sign -PackageArch x86
Certutil -addStore TrustedPeople RoboBlather\auto-generated.cer



