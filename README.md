# RoboBlather

![RoboBlather Screenshot](https://github.com/Xangis/RoboBlather/blob/master/Images/RoboBlather1.2OnWindows10.png)

RoboBlather is a text-to-speech application. It uses the built-in speech synthesis 
power of the .NET Framework 3.0 to generate speech from whatever text you paste into 
the edit window. You can control the speed of the voice, render the output to a .wav 
file, and select any of the installed voices on your machine. 

The list of available voices will vary based on the software you have installed on 
your system, but with the .NET framework installed you should have one or more voices
and in many cases new voices can be added.

If you're on Windows 10, you can add the UK English voice Hazel by following these 
instructions: http://superuser.com/questions/956810/how-do-you-add-the-microsoft-hazel-text-to-speech-voice-back-to-windows-10. 
In addition, Microsoft Mike, Sam, and Mary can be added using the Microsoft TTS Voices 
v1.3 installer found in this forum thread: 
http://www.eightforums.com/customization/23916-microsoft-anna-windows-8-a-6.html.

This was originally released at http://zetacentauri.com/software_roboblather.htm

A prebuilt installer is available in the installer directory.

This application was written using C# .NET 3.0 and should run on any system that
supports .NET 3.0 or newer fully. It has been tested on Windows XP, Vista, 7, 8, and 10. 
A project is included for Visual Studio 11. It doesn't have any complicated dependencies, 
so you can create a project for an earlier version simply by including the source files.

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

I do not actively maintain this application, but will accept pull requests. There are
probably things to be done to make it easier to build and run since I've been the only
developer and the project may make assumptions about paths and development environment
that only apply to me.

I do sometimes still use it to generate .wav files of robot speech. To my knowledge, it's
the quickest, easiet, and free-est way to do so on a Windows machine.
