@echo off
CLS
echo ---------------------------------------------------------------------
echo ���������Զ��Թ���ԱȨ������
echo ---------------------------------------------------------------------
rem --------------------------�����Ǵ����--------------------------------
:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO ********************************
ECHO ���� UAC Ȩ����׼����
ECHO ********************************

ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B

:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

rem ---------------------------����ν���--------------------------------
rem �����ϲ��ַ���Ҫִ�е�������֮ǰ��




@echo off


title Win10 �����������ϵͳһ������������ By joinlidong


color 1e


echo --------------------------------------------------------------------------------
echo ********************************************************************************

echo 1.���������е�Cortana����Ϊ����
echo.
echo 2.���ء�������ͼ����ť
echo.
echo 3.ʼ������������ʾ����ͼ���֪ͨ
echo.
echo 4.����������ռ��ʱ�ϲ�
echo.
echo 5.����������
echo.
echo 6.������ʹ�ô�ͼ��
echo.
echo 7.�����������ϵ�����
echo.
echo 8.��ʾ��ʼ�˵������������������ĺͱ���������ɫ
echo.
echo 9.ʹ��ʼ�˵�������������������͸��
echo.
echo 10.���û��˺ſ��Ƴ���UAC������Ϊ�Ӳ�֪ͨ
echo.
echo 11.�������ù���Ա�ʻ��Ĺ���Ա��׼ģʽ
echo.
echo 12.�ر�SmartscreenӦ��ɸѡ��
echo.
echo 13.�رմ򿪳���ġ���ȫ����
echo.
echo 14.����Windows Defender
echo.
echo 15.����Դ������ʱ��ʾ�˵���
echo.
echo 16.��ʾ�����ļ���չ��
echo.
echo 17.�ر���Ϸ¼�ƹ���
echo.
echo 18.��ʾ��ݷ�ʽС��ͷ
echo.
echo 19.������ݷ�ʽʱ����ӡ���ݷ�ʽ������
echo.
echo 20.���ش˵�������Ƶ��ͼƬ���ĵ������ء����֡����桢3D�����߸��ļ���
echo.
echo 21.��ֹ�Զ�����
echo.
echo 22.�ڵ����Ľ����д��ļ��д���
echo.
echo 23.ʼ����ʾ�˵���
echo.
echo 24.�ر���Ӧ���̵��в��ҹ���Ӧ��
echo.
echo 25.�ر��̵�Ӧ���ƹ�
echo.
echo 26.��������ʾ�ҵĵ���
echo.
echo 27.��������ʾ����վ
echo.
echo 28.��������ʾ�������
echo.
echo 29.���¹���ʱ������û���¼���Զ����������
echo.
echo 30.��������ʾ����
echo.
echo 31.���������ؿ�
echo.
echo 32.�ر�OneDrive
echo.
echo 33.Windows���²������������ɾ������
echo.
echo 34.�رտ�������
echo.
echo 35.�Զ���װ���������ĸ���
echo.
echo 36.���¹���ʱ������û���¼���Զ����������
echo.
echo 37.��Windows Update�Զ����µ���Ϊ�Զ���װ����
echo.
echo 38.���±������Զ�����
echo.
echo 39.���±�����ʾ״̬��
echo.
echo 40.�ر�Ĭ�Ϲ���
echo.
echo 41.�رշ���ǽ
echo.
echo 42.�ر�Զ��Э��
echo.
echo 43.���ó������������
echo.
echo 44.����Զ���޸�ע���
echo.
echo 45.����Windows Search
echo.
echo 46.���ô��󱨸�
echo.
echo 47.���ü�ͥ��
echo.
echo 48.���ÿͻ�������Ƽƻ�
echo.
echo 49.����NTFS���Ӹ��ٷ���
echo.
echo 50.��ֹ�Զ�ά���ƻ�
echo.
echo 51.�ر�ϵͳ����
echo.
echo 52.������ʱ�Ӿ�ȷ����
echo.
echo 53.�ر�����ʱ��Windows �۽��ƹ�
echo.
echo 54.�رա�ʹ��Windowsʱ��ȡ���ɺͽ���
echo.
echo 55.��ֹ�Զ���װ�Ƽ���Ӧ�ó��� 
echo.
echo 56.��½����Ĭ�ϴ�С����
echo.
echo 57.�رն����С��
echo.
echo 58.������Դ������������
echo.
echo 59.���ٷ��ʲ���ʾ�����ļ���
echo.
echo 60.���ٷ��ʲ���ʾ���ʹ�õ��ļ�
echo.
echo 61.��ʾ��Դ���������������еĿ�
echo.
echo 62.������Դ���������������е��ղؼ�
echo.
echo 63.������Դ���������������еļ�ͥ��
echo. 
echo 64.��ʾ��Դ���������������е�����
echo.
echo 65.������Դ���������������еĿ��ƶ��豸
echo.
echo 66.������Դ���������������е�OneDrive
echo.
echo 67.��ʾ��Դ���������������еĿ��ٷ���
echo.
echo ********************************************************************************
echo --------------------------------------------------------------------------------
pause

echo 1.���������е�Cortana����Ϊ����
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t reg_dword /d "0" /f  >nul 2>nul      
echo.
echo 2.���ء�������ͼ����ť
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t reg_dword /d "0" /f  >nul 2>nul       
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t reg_dword /d "0" /f  >nul 2>nul      
echo.
echo 3.ʼ������������ʾ����ͼ���֪ͨ
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t reg_dword /d "0" /f  >nul 2>nul  
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t reg_dword /d "0" /f  >nul 2>nul   
echo.
echo 4.����������ռ��ʱ�ϲ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t reg_dword /d "1" /f  >nul 2>nul      
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t reg_dword /d "1" /f  >nul 2>nul      
echo.
echo 5.����������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t reg_dword /d "0" /f  >nul 2>nul      
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t reg_dword /d "0" /f  >nul 2>nul      
echo.
echo 6.������ʹ�ô�ͼ��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 7.�����������ϵ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f  >nul 2>nul  
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f  >nul 2>nul  
echo.
echo 8.��ʾ��ʼ�˵������������������ĺͱ���������ɫ
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 9.ʹ��ʼ�˵�������������������͸��
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 10.���û��˺ſ��Ƴ���UAC������Ϊ�Ӳ�֪ͨ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 11.�������ù���Ա�ʻ��Ĺ���Ա��׼ģʽ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 12.�ر�SmartscreenӦ��ɸѡ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "off" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 13.�رմ򿪳���ġ���ȫ����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t REG_SZ /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t REG_SZ /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t REG_SZ /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd" /f  >nul 2>nul    
echo.
echo 14.����Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 15.����Դ������ʱ��ʾ�˵���
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 16.��ʾ�����ļ���չ��
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 17.�ر���Ϸ¼�ƹ���
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0"  /f  >nul 2>nul  
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f  >nul 2>nul  
echo.
echo 18.��ʾ��ݷ�ʽС��ͷ
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /f  >nul 2>nul    
echo.
echo 19.������ݷ�ʽʱ����ӡ���ݷ�ʽ������
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Link" /t REG_BINARY /d "00000000" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Link" /t REG_BINARY /d "00000000" /f  >nul 2>nul    
echo.
echo 20.���ش˵�������Ƶ��ͼƬ���ĵ������ء����֡����桢3D�����߸��ļ���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
echo.
echo 21.��ֹ�Զ�����
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 22.�ڵ����Ľ����д��ļ��д���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 23.ʼ����ʾ�˵���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 24.�ر���Ӧ���̵��в��ҹ���Ӧ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 25.�ر��̵�Ӧ���ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f  >nul 2>nul    
echo.
echo 26.��������ʾ�ҵĵ���
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 27.��������ʾ����վ
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 28.��������ʾ�������
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 29.���¹���ʱ������û���¼���Զ����������
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t reg_dword /d "1" /f  >nul 2>nul
echo.
echo 30.��������ʾ����
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 31.���������ؿ�
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d "1" /f  >nul 2>nul
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 32.�ر�OneDrive
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 33.Windows���²������������ɾ������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1"  /f  >nul 2>nul    
echo.
echo 34.�رտ�������
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul    
echo.
echo 35.�Զ���װ���������ĸ���
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 36.���¹���ʱ������û���¼���Զ����������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 37.��Windows Update�Զ����µ���Ϊ�Զ���װ����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /t REG_DWORD /d "4"  /f  >nul 2>nul    
echo.
echo 38.���±������Զ�����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Notepad" /v "fWrap" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 39.���±�����ʾ״̬��
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Notepad" /v "StatusBar" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 40.�ر�Ĭ�Ϲ���
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 41.�رշ���ǽ
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "EnableFirewall" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 42.�ر�Զ��Э��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 43.���ó������������
net stop PcaSvc   >nul 2>nul
sc config PcaSvc start= disabled    >nul 2>nul
echo.
echo 44.����Զ���޸�ע���
net stop RemoteRegistry   >nul 2>nul
sc config RemoteRegistry start= disabled   >nul 2>nul
echo.
echo 45.����Windows Search
net stop WSearch   >nul 2>nul
sc config WSearch start= disabled   >nul 2>nul
echo.
echo 46.���ô��󱨸�
net stop WerSvc    >nul 2>nul
sc config WerSvc start= disabled   >nul 2>nul
echo.
echo 47.���ü�ͥ��
net stop HomeGroupProvider   >nul 2>nul
sc config HomeGroupProvider start= disabled   >nul 2>nul
echo.
echo 48.���ÿͻ�������Ƽƻ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 49.����NTFS���Ӹ��ٷ���
net stop TrkWks   >nul 2>nul 
sc config TrkWks start= disabled   >nul 2>nul
echo.
echo 50.��ֹ�Զ�ά���ƻ�
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 51.�ر�ϵͳ����
powercfg -h off   >nul 2>nul
echo.
echo 52.������ʱ�Ӿ�ȷ����
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d "1" /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d "1" /f  >nul 2>nul   
echo.
echo 53.�ر�����ʱ��Windows �۽��ƹ�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnable" /t REG_DWORD /d "0"   /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnable" /t REG_DWORD /d "0"   /f  >nul 2>nul   
echo.
echo 54.�رա�ʹ��Windowsʱ��ȡ���ɺͽ���
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul   
echo.
echo 55.��ֹ�Զ���װ�Ƽ���Ӧ�ó��� 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul   
echo.
echo 56.��½����Ĭ�ϴ�С����
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2"  /f  >nul 2>nul
echo.
echo 57.�رն����С��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0"  /f  >nul 2>nul   
echo.
echo 58.������Դ������������
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" /v "MinimizedStateTabletModeOff" /t REG_DWORD /d "1"  /f  >nul 2>nul   
reg delete "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" /v "MinimizedStateTabletModeOff"  /f  >nul 2>nul   
echo.
echo 59.���ٷ��ʲ���ʾ�����ļ���
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0"  /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0"  /f  >nul 2>nul   
echo.
echo 60.���ٷ��ʲ���ʾ���ʹ�õ��ļ�
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f  >nul 2>nul   
echo.
echo 61.��ʾ��Դ���������������еĿ�
reg add "HKEY_CLASSES_ROOT\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2961178893"  /f  >nul 2>nul   
echo.
echo 62.������Դ���������������е��ղؼ�
reg add "HKEY_CLASSES_ROOT\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2696937728"  /f  >nul 2>nul   
echo.
echo 63.������Դ���������������еļ�ͥ��
reg add "HKEY_CLASSES_ROOT\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489612"  /f  >nul 2>nul   
echo. 
echo 64.��ʾ��Դ���������������е�����
reg add "HKEY_CLASSES_ROOT\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2953052260"  /f  >nul 2>nul   
echo.
echo 65.������Դ���������������еĿ��ƶ��豸
reg add "HKEY_CLASSES_ROOT\CLSID\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2953838592"  /f  >nul 2>nul   
echo.
echo 66.������Դ���������������е�OneDrive
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /v "Attributes" /t REG_DWORD /d "4035969101"  /f  >nul 2>nul   
echo.
echo 67.��ʾ��Դ���������������еĿ��ٷ���
reg add "HKEY_CLASSES_ROOT\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2685403136"  /f  >nul 2>nul
pause