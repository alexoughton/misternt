# Windows NT install for MiSTer.

This is a set of disk images for installing Windows NT 4 on the ao486 core for MiSTer.

In addition to the images provided here, you will need to separately provide:

1. The latest version of uniata.sys from http://alter.org.ua/en/soft/win/uni_ata/.
2. The Windows NT Workstation 4 setup ISO.
3. The hard disk image you will be installing on.

## Acknowledgments

It would not be possible to run Windows NT on the MiSTer without two amazing drivers which have been provided to the community. If you find any of this useful or interesting, you should send them some thanks!

1. UniATA by Alter: http://alter.org.ua/en/soft/win/uni_ata/
2. VBEMP NT by BearWindows: https://bearwindows.zcm.com.au/vbemp.htm

## Important setup notes - READ FIRST

1. There is a bug in MiSTer's floppy implementation for x86 which has been fixed but is awaiting release. Until this is released, you will either need to use a version of MiSTer from unstable nightlies or "eject" floppies (by pressing backspace on the floppy image selection screen) and then select the next one. Just swapping floppy images will not work until this fix is released.
2. Do not attempt to set the system time during setup, as this will cause a BSOD crash. You may select time zone if you wish, but changing to the date/time tab will cause a crash.
3. During setup you will see an error related to the installation of the graphics driver which should be ignored (the driver will be fully initialized later by a script which runs at the end of setup). Just clear the three dialog boxes which appear, and then click "cancel" on the Display Configuration window to continue.

## Getting started

A full setup guide will soon be provided on the MiSTer forums. Here's the short version...

To begin, place uniata.sys in your MiSTer's ao486\shared directory. You will also need to copy the NT setup ISO and all of the images provided here to your ao486 directory. The hard disk image will need to be in ao486 as well. Start up the ao486 core in MiSTer and mount the following:

1. The floppy image "Boot first - Manufacturer-supplied hardware support disk.img" from this project in Floppy A:
2. Your hard disk image in IDE 0-0.
3. The Windows NT Workstation setup ISO in IDE 1-0.
4. The CD image "misternt.iso" from this project in IDE 1-1.

Then select "Reset and apply HDD" from the ao486 menu to begin. During setup you should skip automatic detection of mass storage devices and then use the option to provide your own driver. This can be found on the "boot first" image. You should also ensure that the "Display" type has been changed from "Auto Detect" to "Other", and then again specify the driver found on that image.

## Technical information

A normal Windows NT setup process starts from MS-DOS and does the following:

1. Copies the setup CD to a temporary location on disk
2. Creates three boot floppies containing the setup environment
3. Boots from those floppies, auto-detects hardware and drivers and proceeds with Windows NT setup

This modified setup process does the following:

1. Copies the setup CD to a temporary location on disk, and then partially replaces many of the files with those from Service Pack 6a (on the CD image)
2. Provides pre-created boot floppies for the setup environment which specify MiSTer-specific steps and include the SP6a components
3. Boots from those floppies, provides drivers to use during manual device specification, and proceeds with Windows NT setup
4. Executes a final script which finishes Service Pack 6a setup, and properly sets display resolution registry keys.