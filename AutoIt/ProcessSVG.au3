#NoTrayIcon  ; 不显示托盘图标
#include <MsgBoxConstants.au3>  ; 引入消息框常量

; 处理 SVG 文件
Func ProcessSVG($filePath, $quiet = False)
    ; 读取 SVG 文件内容
    Local $svgContent = FileRead($filePath)
    If @error Then
        If Not $quiet Then MsgBox($MB_ICONERROR, "错误", "无法读取文件: " & $filePath)
        Return
    EndIf

    ; 使用正则表达式处理 SVG 内容
    $svgContent = StringRegExpReplace($svgContent, 'fill="[^"]*"', "")  ; 去除 fill 属性
    $svgContent = StringRegExpReplace($svgContent, '<svg([^>]*)>', '<svg$1 width="16" height="16">')  ; 添加宽高
    $svgContent = StringRegExpReplace($svgContent, '<svg([^>]*)>', '<svg$1 fill="context-fill" fill-opacity="context-fill-opacity">')  ; 添加 fill 和 fill-opacity

    ; 写入修改后的内容到原文件
    Local $hFile = FileOpen($filePath, 2)  ; 打开文件并清空内容
    FileWrite($hFile, $svgContent)
    FileClose($hFile)
    If @error Then
        If Not $quiet Then MsgBox($MB_ICONERROR, "错误", "无法写入文件: " & $filePath)
        Return
    EndIf

    If Not $quiet Then MsgBox($MB_ICONINFORMATION, "完成", "文件已成功处理: " & $filePath)
EndFunc

; 支持命令行参数运行
If $CmdLine[0] > 0 Then
    Local $quiet = False
    Local $filePath = ""

    ; 解析命令行参数
    For $i = 1 To $CmdLine[0]
        If $CmdLine[$i] = "-q" Then
            $quiet = True
        Else
            $filePath = $CmdLine[$i]  ; 获取文件路径
        EndIf
    Next

    If $filePath <> "" Then
        ProcessSVG($filePath, $quiet)
    Else
        If Not $quiet Then MsgBox($MB_ICONERROR, "错误", "未指定文件路径")
    EndIf
Else
    ; 支持拖拽文件到脚本图标上运行
    Local $filePath = FileOpenDialog("选择 SVG 文件", "", "SVG 文件 (*.svg)", 1 + 2)  ; 1 = 文件选择, 2 = 允许多选
    If @error Then Exit
    ProcessSVG($filePath, True)  ; 拖拽模式不显示 MsgBox
EndIf