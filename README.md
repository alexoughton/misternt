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

1. You must have updated the main MiSTer binary, ao486 itself and boot0.rom and boot1.rom at least as recently as March 26th 2022, as several important fixes affecting Windows NT have been released.
2. Do not attempt to set the system time during setup, as this will cause a BSOD crash. You may select time zone if you wish, but changing to the date/time tab will cause a crash.
3. During setup you will see an error related to the installation of the graphics driver which should be ignored (the driver will be fully initialized later by a script which runs at the end of setup). Just clear the three dialog boxes which appear, and then click "cancel" on the Display Configuration window to continue.

## Getting started

A full setup guide is provided on the MiSTer forums: https://misterfpga.org/viewtopic.php?p=47436#p47436

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

The "boot first" image is an MS-DOS boot disk with the necessary environment to perform step 1. The main script is in autoexec.bat. The image also includes the "fdisk" and "vinfo" tools from FreeDOS to assist with partitioning.