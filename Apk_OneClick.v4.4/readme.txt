FEATURES

- All features are integrated into the right-click menu of Windows.
- Decompile APK classes to Java source codes.
- Disassemble APK to smali code and decode its resources.
- Install APK to phone by right-click.
- Recompile APK after editing smali code and/or resources.
	- Optimize png images
	- Sign apks
	- Zipalign


REQUIREMENTS

    Java Runtime Environment (JRE) must be installed.


HOW TO INSTALL THE PACKAGE

    * Extract the attached archieve to hard disk.
    * Open the extracted folder.
    * double-click 'shellext-add.cmd'


HOW TO UNINSTALL THE PACKAGE

    * Run shellext-remove.cmd & you are done.


ITEMS ADDED TO RIGHT-CLICK CONTEXT MENU

    APK
        Browse Java Code of APK
        Disassemble APK and Decode Resources
        Install APK to Phone

    Folder
        Recompile APK from Disassembly


HOW TO DISASSEMBLE APK

    Suppose you want to disassemble yourapp.apk, all you have to do is:
    * right-click 'yourapp.apk' file
    * select -> 'Disassemble APK and Decode Resources'

    A folder named 'yourapp-disasm' will be created in the same folder as
    the apk. It will contain the smali disassembly and decoded resources .
    You can modify the smali code and/or resources inside that folder.

    For instant access to methods and fields and for better understanding
    of the smali disassembly, you can browse the hierarchy of reconstructed
    Java source code in the JD-GUI Java Decompiler. The Java source codes
    will be displayed like a Java project in IDE.
    * right-click 'yourapp.apk' file
    * select -> 'Browse Java Code of APK'


HOW TO RECOMPILE APK FROM DISASSEMBLY

    To assemble, sign and zipalign to a new APK, wether you modified the
    source code and/or resources or not:
    * right click 'yourapp-disasm' folder
    * select -> 'Recompile APK from Disassembly'


HOW TO INSTALL APK TO PHONE

    To install a non-system apk from pc (keeping its data if it was already
    installed on the phone)
    * connect android phone to pc via usb cable
    * right-click an APK in windows explorer
    * select -> 'Install APK to Phone'


NOTES ABOUT SYSTEM APKS

    Manufacturer's framework files:
    Standard framework is embedded into apktool, so you don't need to do
    anything for most apk files. But some manufacturers, for example HTC,
    add their own framework files and use them in system apps. Apktool
    needs these framework files to decode and build apks. To use apktool
    against such apps, you must pull framework from a device and
    install/register it to apktool.
    for a solution see, http://code.google.com/p/android-apktool/wiki/FrameworkFiles

    META-INF dir in resulting apk:
    This dir contains apk signatures mostly and after modifying apk it is
    no longer has valid signatures. you have to be careful when putting a
    recompiled system apk back on your device. Pushing that new apk to your
    phone will result in Force Closes (FCs).
    for a solution see, http://code.google.com/p/android-apktool/wiki/FAQ


TOOLS INCLUDED

    * android-apktool 1.3.2 by Brut.all - http://code.google.com/p/android-apktool/downloads/list
    * dex2jar-0.0.7.7-SNAPSHOT - http://code.google.com/p/dex2jar/downloads/list
    * jd-gui-0.3.3.windows - http://java.decompiler.free.fr/?q=jdgui#downloads


HOW TO UPDATE INCLUDED TOOLS

    * Peroidically check for updates to the included tools.
    * Web links are provided also inside the 'tools' folder.
    * When an update is available, download and extract it to the
      corresponding folder inside the 'tools' folder.


PACKAGE UPDATE v3 - AUGUST 2012
    * android-apktool 1.4.3
    * dex2jar-0.0.9.9
    * Added Recompile from source feature


PACKAGE UPDATE v4 - JANUARY 2013

    * android-apktool 1.5.1
    * dex2jar-0.0.9.12-a
    * jd-gui-0.3.5.windows
    * Modified: names of menu items for more clarity
    * Added: optimize png images, sign and zipalign during recompiling.
    * Added: Install APK to Phone


PACKAGE UPDATE v4.1 - 27 JANUARY 2013

    * Fixed: package fails to install properly when APK extension is currently assigned to another app.
    * Fixed: minor fixes when selecting 'Recompile APK from Disassembly'


PACKAGE UPDATE v4.2 - 2 FEBRUARY 2013

    * Updated: android-apktool 1.5.2
    * Fixed: the install and uninstall scripts have become more UAC friendly.


PACKAGE UPDATE v4.3-UNOFFICIAL - 14 DECEMBER 2014

    * dex2jar-0.0.9.15
	* jd-gui-0.3.6.windows

PACKAGE UPDATE v4.4-UNOFFICIAL - 30 MARCH 2015 by Kameo/XDA

	* Updated: android-apktool 2.0.0 rc4
    * Modified: buildapk.cmd, decompile.cmd, disassemble.cmd to match the new requirements induced in apktool v2.xx.
	* Added: renameapk-min.cmd which allows to rename boggus apk filename.
	* Modified: shellext-add.cmd and shellext-remove.cmd to include renameapk-min.cmd.

	
Enjoy ;-)
amroush_1800
