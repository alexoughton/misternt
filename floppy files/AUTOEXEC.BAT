@echo off

MSCDEX.EXE  /D:ACD /L:R
SMARTDRV.EXE

cls
echo This is the Windows NT install floppy for MiSTer.
echo.

echo You should have the Windows NT setup CD mounted
echo in drive IDE1-0 and misternt.iso in IDE1-1.
echo.

echo Mount this floppy image when prompted for video
echo and storage drivers.
echo. 

echo This tool will blindly ERASE and format your
echo first hard disk if it has not been formatted in FAT16.
echo Cancel now if you don't want this!
echo.
pause

if not exist a:\uniata.sys goto drivermissing

:proceed
vinfo /d c
if errorlevel 15 goto partition
if errorlevel 5 goto format

echo Found a valid file system on your hard disk.
echo Will continue installing NT as-is.
goto winnt

:partition
echo.
echo Detected that your hard disk is not yet partitioned.
echo Will partition your disk and reboot.
echo.
pause

fdisk /clear 1
fdisk /prio:100,100 1
fdisk /mbr /reboot

:format
echo Detected that your hard disk is not formatted.
echo Will format your disk now.
echo.

echo Do you want setup to create an MS-DOS prompt boot option?
echo For this to work, you must not convert to NTFS during setup.
echo.
choice

if errorlevel 2 goto nosys
if errorlevel 1 goto sys
goto format

:sys
format c: /v:nt /s
goto winnt

:nosys
format c: /v:nt
goto winnt

:winnt
REM r:\i386\winnt.exe /s:r:\i386 /X /t:C:
mkdir c:\$win_nt$.~ls
mkdir c:\$win_nt$.~ls\i386
xcopy r:\i386 c:\$win_nt$.~ls\i386 /Y /S
xcopy s:\ss c:\$win_nt$.~ls\i386 /Y /S

echo.
echo File copy complete. Now mount disk
echo "Windows NT Workstation Boot Disk" in floppy A:
echo and press CTRL+ALT+DEL to reboot.
echo.
:endlessloop
goto endlessloop

:drivermissing
echo This disk does not yet include the required uniata driver,
echo but can copy it from your MisTer's "shared" directory.
echo.
:drivercheck2
echo Download the latest release from:
echo http://alter.org.ua/en/soft/win/uni_ata/
echo.
echo Place uniata.sys from the archive in your MiSTer's
echo "ao486\shared" directory.
echo.
pause
a:\misterfs m

:drivercheck2
if not exist m:\uniata.sys goto driverstillmissing
goto driverpresent

:driverstillmissing
echo.
echo Not seeing the required file in the shared directory.
goto drivercheck2

:driverpresent
copy m:\uniata.sys a:\
echo.
echo File copied to the floppy image. You will not
echo need to repeat this step in the future.
echo.
goto proceed