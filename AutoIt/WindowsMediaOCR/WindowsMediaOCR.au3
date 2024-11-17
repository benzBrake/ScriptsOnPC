#Region ;**** 参数创建于 AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=WindowsMediaOCR.ico
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=调用 Windows UWP API 进行文本识别
#AutoIt3Wrapper_Res_Fileversion=0.0.4.1
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductVersion=1.0.0
#EndRegion ;**** 参数创建于 AutoIt3Wrapper_GUI ****
#include <clipboard.au3>
#include <MsgBoxConstants.au3>
#include <gdiplus.au3>
#include <Array.au3>
#include "UWPOCR.au3"
Global $bUseClipboard = False
Global $bUseOCR = True
Global $bShowLanguage = False
If $CmdLine[0] > 0 Then
    If $CmdLine[1] = "-p" Then
        $bUseClipboard = True
    EndIf
	If $CmdLine[1] = "-s" Then
        $bShowLanguage = True
		$bUseOCR = False;
    EndIf
EndIf
If $bUseOCR Then
	If $bUseClipboard Then
		If _ClipBoard_Open(0) <> 1 Then
			ClipbardFailed()
			Exit
		EndIf
		$hMemory = _ClipBoard_GetDataEx($CF_BITMAP)
		If $hMemory  = 0 Then
			ClipbardFailed()
			Exit
		EndIf
		_GDIPlus_Startup()
		$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hMemory)
		If $hBitmap = 0 Then
			ClipbardFailed()
			Exit
		EndIf
		Local $sOCRTextResult = _UWPOCR_GetText($hBitmap, Default, True)
		ClipPut ($sOCRTextResult)
	Else
		Local $sOCRTextResult = _UWPOCR_GetText(FileOpenDialog("Select Image", @ScriptDir & "\", "Images (*.jpg;*.bmp;*.png;*.tif;*.gif)"), Default, True)
		ClipPut ($sOCRTextResult)
	EndIf
Else
	If $bShowLanguage Then
		Local $aSupportedLanguages = _UWPOCR_GetSupportedLanguages()
		_ArrayDisplay($aSupportedLanguages, "Supported Languages", "", 0, Default, "LanguageTag|DisplayName")
	EndIf
EndIf
Func ClipbardFailed() 
	MsgBox($MB_OK, "Error", "Failed to read image from clipboard!")
EndFunc