@echo off
title Large file generator
color 0a
echo .-----.          .-.  .--. _ .-.        
echo `-. .-'         .' `.: .-':_;: :        
echo   : : .--.  .--.`. .': `; .-.: :   .--. 
echo   : :' '_.'`._-.': : : :  : :: :_ ' '_.'
echo   :_;`.__.'`.__.':_; :_;  :_;`.__;`.__.'                                          
echo                                     .-.           
echo                                    .' `.          
echo  .--.  .--. ,-.,-. .--. .--.  .--. `. .'.--. .--. 
echo ' .; :' '_.': ,. :' '_.': ..'' .; ; : :' .; :: ..'
echo `._. ;`.__.':_;:_;`.__.':_;  `.__,_;:_;`.__.':_;  
echo  .-. :                                            
echo  `._.'      
echo by bendix9009
echo --- -- ---
timeout 3
:options
cls
echo How large should you file be?
echo [1] 1 MB = 1048576 bytes
echo [2] 100 MB = 104857600 bytes
echo [3] 1 GB = 1073741824 bytes
echo [4] 10 GB = 10737418240 bytes
echo [5] 100 GB =107374182400 bytes
echo [6] 1 TB = 1099511627776 bytes
echo [7] 10 TB =10995116277760 bytes
echo [8] Custom size
SET /P option= Please enter an input:
color 0a
IF "%option%"=="1" goto 1
IF "%option%"=="2" goto 2
IF "%option%"=="3" goto 3
IF "%option%"=="4" goto 4
IF "%option%"=="5" goto 5
IF "%option%"=="6" goto 6
IF "%option%"=="7" goto 7
IF "%option%"=="8" goto 8
:fail
color 0c
echo Option not found. Enter a number between 1 and 8.
timeout 5
goto options
exit

:1
fsutil file createnew c:\users\%USERNAME%\desktop\1mb.test 1048576
goto done
:2
fsutil file createnew c:\users\%USERNAME%\desktop\100mb.test 104857600 
goto done
:3
fsutil file createnew c:\users\%USERNAME%\desktop\1gb.test 1073741824
goto done
:4
fsutil file createnew c:\users\%USERNAME%\desktop\10gb.test 10737418240 
goto done
:5
fsutil file createnew c:\users\%USERNAME%\desktop\100gb.test 107374182400 
goto done
:6
fsutil file createnew c:\users\%USERNAME%\desktop\1tb.test 1099511627776 
goto done
:7
fsutil file createnew c:\users\%USERNAME%\desktop\10tb.test 10995116277760 
goto done
:8
goto input
goto done






:input
cls
color 0e
echo The custom filesize must be entered in byte (1 = 1 byte). 
echo This was chosen to be able to create extremely accurate file sizes.
echo !! Important: !! 
echo Numbers are limited to 32-bits of precision. Batch files cant handle high integers. 
echo Maybe this promp will crash.
echo --- -- ---
set /P size=Enter the filesize you want: 
set /a varCheck=%size%
if %varCheck% == %size% (goto :confirmed) else (goto :failed)
exit
:failed
cls
color 0c
:: If Input NOT numeric continue here:
echo %size% is not a valid number. Try again with (0123456789)
timeout 5
goto input

:confirmed
cls
color 0a
:: If Input numeric continue here:
echo Creating %size% bytes large testfile...
fsutil file createnew c:\users\%USERNAME%\desktop\%size%bytes.test %size%
pause
exit
 
:done
color 0a
cls
echo File sucessfully created on your desktop.
pause