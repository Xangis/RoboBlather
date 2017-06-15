# RoboBlather

![RoboBlather Screenshot](https://github.com/Xangis/RoboBlather/blob/master/Images/RoboBlather1.2OnWindows10.png)

RoboBlather is a text-to-speech application for Windows. It uses the built-in speech 
synthesis power of the .NET Framework 3.0 to generate speech from whatever text you 
paste into  the edit window. You can control the speed of the voice, render the output
to a .wav file, and select any of the installed voices on your machine. 

On my development machines, these are the voices that were available:

### Windows XP

![Windows XP Voices](https://github.com/Xangis/RoboBlather/blob/master/Images/TextToSpeechVoiceListXP.png)

### Windows Vista

![Windows Vista Voices](https://github.com/Xangis/RoboBlather/blob/master/Images/TextToSpeechVoiceListVista.png)

### Windows 8

![Windows 8 Voices](https://github.com/Xangis/RoboBlather/blob/master/Images/TextToSpeechVoiceListWindows8.png)

### Windows 10

![Windows 10 Voices](https://github.com/Xangis/RoboBlather/blob/master/Images/TextToSpeechVoiceListWindows10.png)

The list of available voices will vary based on the software you have installed on 
your system, but with the .NET framework installed you should have one or more voices
and in many cases new voices can be added.

If you're on Windows 10, you can add the UK English voice Hazel by following these 
instructions: http://superuser.com/questions/956810/how-do-you-add-the-microsoft-hazel-text-to-speech-voice-back-to-windows-10. 
In addition, Microsoft Mike, Sam, and Mary can be added using the Microsoft TTS Voices 
v1.3 installer found in this forum thread: 
http://www.eightforums.com/customization/23916-microsoft-anna-windows-8-a-6.html.

This was originally released at http://zetacentauri.com/software_roboblather.htm

A prebuilt installer is available in the installer directory here: https://github.com/Xangis/RoboBlather/blob/master/Installer/RoboBlather1.2Setup.exe

This application was written using C# .NET 3.0 and should run on any system that
supports .NET 3.0 or newer fully. It has been tested on Windows XP, Vista, 7, 8, and 10. 
A project is included for Visual Studio 2010, but it should open just fine in newer
versions. It doesn't have any dependencies other than the .NET framework.

An installer script for InnoSetup is included in the installer directory, but you'll
probably have to modify the paths in order for it to work on your system. There's also
also an older NSIS installer that could probably be modified to work.

## Known Issues

When rendering speech to a .wav file, you will probably have to close RoboBlather before 
you can play the generated file. It seems to be one of the quirks of the speech 
synthesizer that it doesn't close a file when audio is rendered (because it expects to 
keep saying things). This may be fixable via a code change, but I haven't really looked
into it.

## Development Status

This was originally released as a proprietary but free application for Windows and has
been downloaded more than 25,000 times. Since there's no longer a business behind it, 
there's no reason not to make it open source.

There was some effort made to use the Desktop App Converter to package this for the
Windows Store, but it never quite made it. There's a package.bat file in the installer
directory with progress so far.

I consider this program "done" and feature-complete, but will accept pull requests if you
have an improvement to contribute.

I do sometimes still use it to generate .wav files of robot speech. To my knowledge, it's
the quickest, easiet, and free-est way to do so on a Windows machine. That means that it's
very likely that I'll update it if a new Windows version makes it necessary.
