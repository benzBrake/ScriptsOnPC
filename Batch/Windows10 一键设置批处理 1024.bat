@echo off
CLS
echo ---------------------------------------------------------------------
echo 本批处理将自动以管理员权限运行
echo ---------------------------------------------------------------------
rem --------------------------以下是代码段--------------------------------
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
ECHO 请求 UAC 权限批准……
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

rem ---------------------------代码段结束--------------------------------
rem 将以上部分放在要执行的批处理之前。




@echo off


title Win10 基于批处理的系统一键设置批处理 By joinlidong


color 1e


echo --------------------------------------------------------------------------------
echo ********************************************************************************

echo 1.将任务栏中的Cortana调整为隐藏
echo.
echo 2.隐藏“任务视图”按钮
echo.
echo 3.始终在任务栏显示所有图标和通知
echo.
echo 4.当任务栏被占满时合并
echo.
echo 5.锁定任务栏
echo.
echo 6.任务栏使用大图标
echo.
echo 7.隐藏任务栏上的人脉
echo.
echo 8.显示开始菜单、任务栏、操作中心和标题栏的颜色
echo.
echo 9.使开始菜单、任务栏、操作中心透明
echo.
echo 10.将用户账号控制程序（UAC）调整为从不通知
echo.
echo 11.用于内置管理员帐户的管理员批准模式
echo.
echo 12.关闭Smartscreen应用筛选器
echo.
echo 13.关闭打开程序的“安全警告
echo.
echo 14.禁用Windows Defender
echo.
echo 15.打开资源管理器时显示此电脑
echo.
echo 16.显示所有文件扩展名
echo.
echo 17.关闭游戏录制工具
echo.
echo 18.显示快捷方式小箭头
echo.
echo 19.创建快捷方式时不添加“快捷方式”文字
echo.
echo 20.隐藏此电脑中视频、图片、文档、下载、音乐、桌面、3D对象七个文件夹
echo.
echo 21.禁止自动播放
echo.
echo 22.在单独的进程中打开文件夹窗口
echo.
echo 23.始终显示菜单栏
echo.
echo 24.关闭在应用商店中查找关联应用
echo.
echo 25.关闭商店应用推广
echo.
echo 26.在桌面显示我的电脑
echo.
echo 27.在桌面显示回收站
echo.
echo 28.在桌面显示控制面板
echo.
echo 29.更新挂起时如果有用户登录不自动重启计算机
echo.
echo 30.在桌面显示网络
echo.
echo 31.在桌面隐藏库
echo.
echo 32.关闭OneDrive
echo.
echo 33.Windows更新不包括恶意软件删除工具
echo.
echo 34.关闭快速启动
echo.
echo 35.自动安装无需重启的更新
echo.
echo 36.更新挂起时如果有用户登录不自动重启计算机
echo.
echo 37.将Windows Update自动更新调整为自动安装更新
echo.
echo 38.记事本启用自动换行
echo.
echo 39.记事本终显示状态栏
echo.
echo 40.关闭默认共享
echo.
echo 41.关闭防火墙
echo.
echo 42.关闭远程协助
echo.
echo 43.禁用程序兼容性助手
echo.
echo 44.禁用远程修改注册表
echo.
echo 45.禁用Windows Search
echo.
echo 46.禁用错误报告
echo.
echo 47.禁用家庭组
echo.
echo 48.禁用客户体验改善计划
echo.
echo 49.禁用NTFS链接跟踪服务
echo.
echo 50.禁止自动维护计划
echo.
echo 51.关闭系统休眠
echo.
echo 52.任务栏时钟精确到秒
echo.
echo 53.关闭锁屏时的Windows 聚焦推广
echo.
echo 54.关闭“使用Windows时获取技巧和建议
echo.
echo 55.禁止自动安装推荐的应用程序 
echo.
echo 56.登陆界面默认打开小键盘
echo.
echo 57.关闭多嘴的小娜
echo.
echo 58.收起资源管理器功能区
echo.
echo 59.快速访问不显示常用文件夹
echo.
echo 60.快速访问不显示最近使用的文件
echo.
echo 61.显示资源管理器导航窗口中的库
echo.
echo 62.隐藏资源管理器导航窗口中的收藏夹
echo.
echo 63.隐藏资源管理器导航窗口中的家庭组
echo. 
echo 64.显示资源管理器导航窗口中的网络
echo.
echo 65.隐藏资源管理器导航窗口中的可移动设备
echo.
echo 66.隐藏资源管理器导航窗口中的OneDrive
echo.
echo 67.显示资源管理器导航窗口中的快速访问
echo.
echo ********************************************************************************
echo --------------------------------------------------------------------------------
pause

echo 1.将任务栏中的Cortana调整为隐藏
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t reg_dword /d "0" /f  >nul 2>nul      
echo.
echo 2.隐藏“任务视图”按钮
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t reg_dword /d "0" /f  >nul 2>nul       
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t reg_dword /d "0" /f  >nul 2>nul      
echo.
echo 3.始终在任务栏显示所有图标和通知
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t reg_dword /d "0" /f  >nul 2>nul  
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t reg_dword /d "0" /f  >nul 2>nul   
echo.
echo 4.当任务栏被占满时合并
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t reg_dword /d "1" /f  >nul 2>nul      
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t reg_dword /d "1" /f  >nul 2>nul      
echo.
echo 5.锁定任务栏
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t reg_dword /d "0" /f  >nul 2>nul      
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t reg_dword /d "0" /f  >nul 2>nul      
echo.
echo 6.任务栏使用大图标
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 7.隐藏任务栏上的人脉
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f  >nul 2>nul  
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f  >nul 2>nul  
echo.
echo 8.显示开始菜单、任务栏、操作中心和标题栏的颜色
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 9.使开始菜单、任务栏、操作中心透明
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 10.将用户账号控制程序（UAC）调整为从不通知
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 11.用于内置管理员帐户的管理员批准模式
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 12.关闭Smartscreen应用筛选器
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "off" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 13.关闭打开程序的“安全警告
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t REG_SZ /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t REG_SZ /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t REG_SZ /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd" /f  >nul 2>nul    
echo.
echo 14.禁用Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 15.打开资源管理器时显示此电脑
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 16.显示所有文件扩展名
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 17.关闭游戏录制工具
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0"  /f  >nul 2>nul  
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f  >nul 2>nul  
echo.
echo 18.显示快捷方式小箭头
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "29" /f  >nul 2>nul    
echo.
echo 19.创建快捷方式时不添加“快捷方式”文字
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Link" /t REG_BINARY /d "00000000" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Link" /t REG_BINARY /d "00000000" /f  >nul 2>nul    
echo.
echo 20.隐藏此电脑中视频、图片、文档、下载、音乐、桌面、3D对象七个文件夹
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{7d83ee9b-2244-4e70-b1f5-5393042af1e4}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{f42ee2d3-909f-4907-8871-4c22fc0bf756}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{0ddd015d-b06c-45d5-8c4c-f59713854639}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{35286a68-3c57-41a1-bbb1-0eae73d76c95}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{a0c69a99-21c8-4671-8703-7934162fcf1d}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FolderDescriptions\{31C0DD25-9439-4F12-BF41-7FF4EDA38722}\PropertyBag" /v "ThisPCPolicy" /t REG_SZ /d "Hide"   /f  >nul 2>nul
echo.
echo 21.禁止自动播放
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" /v "DisableAutoplay" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 22.在单独的进程中打开文件夹窗口
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 23.始终显示菜单栏
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 24.关闭在应用商店中查找关联应用
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 25.关闭商店应用推广
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f  >nul 2>nul    
echo.
echo 26.在桌面显示我的电脑
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 27.在桌面显示回收站
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 28.在桌面显示控制面板
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 29.更新挂起时如果有用户登录不自动重启计算机
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl" /v "AutoReboot" /t reg_dword /d "1" /f  >nul 2>nul
echo.
echo 30.在桌面显示网络
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 31.在桌面隐藏库
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d "1" /f  >nul 2>nul
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 32.关闭OneDrive
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 33.Windows更新不包括恶意软件删除工具
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1"  /f  >nul 2>nul    
echo.
echo 34.关闭快速启动
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul    
echo.
echo 35.自动安装无需重启的更新
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 36.更新挂起时如果有用户登录不自动重启计算机
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 37.将Windows Update自动更新调整为自动安装更新
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /t REG_DWORD /d "4"  /f  >nul 2>nul    
echo.
echo 38.记事本启用自动换行
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "fWrap" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Notepad" /v "fWrap" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 39.记事本终显示状态栏
reg add "HKEY_CURRENT_USER\Software\Microsoft\Notepad" /v "StatusBar" /t reg_dword /d "1" /f  >nul 2>nul    
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Notepad" /v "StatusBar" /t reg_dword /d "1" /f  >nul 2>nul    
echo.
echo 40.关闭默认共享
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareServer" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "AutoShareWks" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 41.关闭防火墙
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" /t reg_dword /d "0" /f  >nul 2>nul    
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "EnableFirewall" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 42.关闭远程协助
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 43.禁用程序兼容性助手
net stop PcaSvc   >nul 2>nul
sc config PcaSvc start= disabled    >nul 2>nul
echo.
echo 44.禁用远程修改注册表
net stop RemoteRegistry   >nul 2>nul
sc config RemoteRegistry start= disabled   >nul 2>nul
echo.
echo 45.禁用Windows Search
net stop WSearch   >nul 2>nul
sc config WSearch start= disabled   >nul 2>nul
echo.
echo 46.禁用错误报告
net stop WerSvc    >nul 2>nul
sc config WerSvc start= disabled   >nul 2>nul
echo.
echo 47.禁用家庭组
net stop HomeGroupProvider   >nul 2>nul
sc config HomeGroupProvider start= disabled   >nul 2>nul
echo.
echo 48.禁用客户体验改善计划
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 49.禁用NTFS链接跟踪服务
net stop TrkWks   >nul 2>nul 
sc config TrkWks start= disabled   >nul 2>nul
echo.
echo 50.禁止自动维护计划
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t reg_dword /d "0" /f  >nul 2>nul    
echo.
echo 51.关闭系统休眠
powercfg -h off   >nul 2>nul
echo.
echo 52.任务栏时钟精确到秒
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d "1" /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t REG_DWORD /d "1" /f  >nul 2>nul   
echo.
echo 53.关闭锁屏时的Windows 聚焦推广
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnable" /t REG_DWORD /d "0"   /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnable" /t REG_DWORD /d "0"   /f  >nul 2>nul   
echo.
echo 54.关闭“使用Windows时获取技巧和建议
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul   
echo.
echo 55.禁止自动安装推荐的应用程序 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0"  /f  >nul 2>nul   
echo.
echo 56.登陆界面默认打开小键盘
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2"  /f  >nul 2>nul
echo.
echo 57.关闭多嘴的小娜
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0"  /f  >nul 2>nul   
echo.
echo 58.收起资源管理器功能区
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" /v "MinimizedStateTabletModeOff" /t REG_DWORD /d "1"  /f  >nul 2>nul   
reg delete "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" /v "MinimizedStateTabletModeOff"  /f  >nul 2>nul   
echo.
echo 59.快速访问不显示常用文件夹
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0"  /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0"  /f  >nul 2>nul   
echo.
echo 60.快速访问不显示最近使用的文件
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f  >nul 2>nul   
reg add "HKEY_USERS\DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f  >nul 2>nul   
echo.
echo 61.显示资源管理器导航窗口中的库
reg add "HKEY_CLASSES_ROOT\CLSID\{031E4825-7B94-4dc3-B131-E946B44C8DD5}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2961178893"  /f  >nul 2>nul   
echo.
echo 62.隐藏资源管理器导航窗口中的收藏夹
reg add "HKEY_CLASSES_ROOT\CLSID\{323CA680-C24D-4099-B94D-446DD2D7249E}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2696937728"  /f  >nul 2>nul   
echo.
echo 63.隐藏资源管理器导航窗口中的家庭组
reg add "HKEY_CLASSES_ROOT\CLSID\{B4FB3F98-C1EA-428d-A78A-D1F5659CBA93}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2962489612"  /f  >nul 2>nul   
echo. 
echo 64.显示资源管理器导航窗口中的网络
reg add "HKEY_CLASSES_ROOT\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2953052260"  /f  >nul 2>nul   
echo.
echo 65.隐藏资源管理器导航窗口中的可移动设备
reg add "HKEY_CLASSES_ROOT\CLSID\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2953838592"  /f  >nul 2>nul   
echo.
echo 66.隐藏资源管理器导航窗口中的OneDrive
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /v "Attributes" /t REG_DWORD /d "4035969101"  /f  >nul 2>nul   
echo.
echo 67.显示资源管理器导航窗口中的快速访问
reg add "HKEY_CLASSES_ROOT\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}\ShellFolder" /v "Attributes" /t REG_DWORD /d "2685403136"  /f  >nul 2>nul
pause