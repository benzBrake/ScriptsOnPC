#Requires AutoHotkey v2.0
#SingleInstance Force

; ── 托盘菜单回调函数（必须在调用前定义） ─────────────────
ReloadScript(*) {
    Reload
}

ExitScript(*) {
    ExitApp
}
; ───────────────────────────────────────────────────────────

; ── 设置托盘图标 ───────────────────────────────────────
; 1. 设置鼠标悬停在图标上时显示的提示文本
A_IconTip := "智能粘贴助手"

; 2. 设置托盘图标
TraySetIcon("C:\Windows\System32\shell32.dll", 166)
; ───────────────────────────────────────────────────────────

; ── 自定义托盘右键菜单 ───────────────────────────────────
; 1. 删除所有默认菜单项（如：暂停脚本、打开、帮助等）
A_TrayMenu.Delete()

; 2. 添加“重载”菜单项，点击后执行 ReloadScript 函数
A_TrayMenu.Add("重载", ReloadScript)

; 3. 添加一条分隔线
A_TrayMenu.Add()

; 4. 添加“退出”菜单项，点击后执行 ExitScript 函数
A_TrayMenu.Add("退出", ExitScript)
; ───────────────────────────────────────────────────────────

global PasteMenu := Menu()
PasteMenu.Add("原格式粘贴", PasteOriginal)
PasteMenu.Add("纯文本粘贴", PastePlain)
PasteMenu.Add("\n → 空格粘贴", PasteNoNewline)
PasteMenu.Add("文件名安全粘贴", PasteFilenameSafe)

; ── Ctrl+Shift+V = 纯文本粘贴 ─────────────────────────────
^+v:: {
    PastePlain() ; 直接调用纯文本粘贴函数
}

; ── 双击 Alt 弹出菜单（非 vncviewer 时） ─────────────────
~Alt::
{
    static lastTime := 0
    if (A_PriorHotkey = "~Alt" && (A_TickCount - lastTime < 400)) {
        ; 双击检测：400ms 内
        if !WinActive("ahk_class vncviewer") {
            ShowPasteMenu()
        }
    }
    lastTime := A_TickCount
}

; ── 菜单定义 ─────────────────────────────────────────────
ShowPasteMenu() {
    PasteMenu.Show()
}

; ── 粘贴函数 ─────────────────────────────────────────────
PasteOriginal(*) {
    ; 原格式粘贴不需要修改剪贴板，直接发送即可
    Send("^v")
}

PastePlain(*) {
    ; 保存原始剪贴板
    ClipSaved := A_Clipboard
    try {
        ; 通过重新赋值，将剪贴板内容转为纯文本格式，去除所有富文本格式
        A_Clipboard := ClipSaved 
        
        ; 发送粘贴命令
        Send("^v")
        
        ; 等待粘贴完成
        Sleep(150)
    } finally {
        ; 恢复剪贴板
        A_Clipboard := ClipSaved
    }
}

PasteNoNewline(*) {
    ; 保存原始剪贴板
    ClipSaved := A_Clipboard
    try {
        ; 在内存中进行替换
        text := StrReplace(ClipSaved, "`r`n", " ")
        text := StrReplace(text, "`r", " ")
        text := StrReplace(text, "`n", " ")
        
        ; 将处理后的文本写入剪贴板
        A_Clipboard := text
        
        ; 发送粘贴命令
        Send("^v")
        
        ; 等待粘贴完成
        Sleep(150)
    } finally {
        ; 恢复剪贴板
        A_Clipboard := ClipSaved
    }
}

PasteFilenameSafe(*) {
    ; 保存原始剪贴板
    ClipSaved := A_Clipboard
    try {
        ; 替换非法文件名字符为下划线
        text := ClipSaved
        invalidChars := ['\', '/', ':', '*', '?', '"', '<', '>', '|']
        for char in invalidChars {
            text := StrReplace(text, char, "_")
        }
        ; 去除首尾空格并替换换行符
        text := Trim(text)
        text := StrReplace(text, "`r`n", "_")
        text := StrReplace(text, "`r", "_")
        text := StrReplace(text, "`n", "_")
        
        ; 将处理后的文本写入剪贴板
        A_Clipboard := text
        
        ; 发送粘贴命令
        Send("^v")
        
        ; 等待粘贴完成
        Sleep(150)
    } finally {
        ; 恢复剪贴板
        A_Clipboard := ClipSaved
    }
}