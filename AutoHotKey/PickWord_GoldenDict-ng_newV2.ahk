#Requires AutoHotkey v2.0
#SingleInstance Force

global EnableLookup := true

; ===== 托盘菜单 =====
A_TrayMenu.Delete()
A_TrayMenu.Add("✔ 开启取词", ToggleLookup)
A_TrayMenu.Check("✔ 开启取词")
A_TrayMenu.Add()
A_TrayMenu.Add("🛠 修改 GoldenDict 路径", SetGoldenDictPath)
A_TrayMenu.Add()
A_TrayMenu.Add("❌ 退出", (*) => ExitApp())

; ====================
; Ctrl + 双击左键触发
; ====================
^~LButton::{
    if !EnableLookup
        return

    ; 必须按住 Ctrl
    if !GetKeyState("Ctrl", "P")
        return

    while GetKeyState("LButton","P")
        Sleep 10

    waitTime := DllCall("GetDoubleClickTime") / 4000
    if !KeyWait("LButton", "D T" waitTime)
        return

    Routine()
}

Routine() {
    global EnableLookup
    if !EnableLookup
        return

    if WinActive("ahk_class CabinetWClass")
        return

    A_Clipboard := ""
    Send("^c")
    if !ClipWait(1)
        return

    clip := Trim(A_Clipboard)

    ; 只允许英文单词或词组
    if !RegExMatch(clip, "i)^[a-z]+([-''][a-z]+)*( [a-z]+([-''][a-z]+)*)*$")
        return

    gd := GetGoldenDictPath()
    if (gd = "") {
        MsgBox("未能找到 GoldenDict.exe，请确认已安装。", "Error", 48)
        return
    }

    Run('"' gd '" ' clip)
}

; =========================
; 开/关取词
; =========================
ToggleLookup(*) {
    global EnableLookup
    EnableLookup := !EnableLookup
    if EnableLookup {
        A_TrayMenu.Check("✔ 开启取词")
        TrayTip("取词功能已开启", "AHK", 1)
    } else {
        A_TrayMenu.Uncheck("✔ 开启取词")
        TrayTip("取词功能已关闭", "AHK", 1)
    }
}

; =========================
; 获取 GoldenDict 路径
; =========================
GetGoldenDictPath() {
    ini := A_ScriptDir "\config.ini"

    gd := IniRead(ini, "GoldenDict", "Path", "")
    if (gd != "" && FileExist(gd))
        return gd

    gd := GetGoldenDictFromReg()
    if (gd != "" && FileExist(gd)) {
        IniWrite(gd, ini, "GoldenDict", "Path")
        return gd
    }

    return SetGoldenDictPath()
}

; =========================
; 手动设置路径
; =========================
SetGoldenDictPath(*) {
    ini := A_ScriptDir "\config.ini"
    gd := FileSelect(3, , "请选择 GoldenDict.exe", "Executable (*.exe)")
    if (gd != "") {
        IniWrite(gd, ini, "GoldenDict", "Path")
        TrayTip("GoldenDict 路径已设置：`n" gd, "AHK", 1)
        return gd
    }
    return ""
}

; =========================
; 注册表查找
; =========================
GetGoldenDictFromReg() {
    keys := [
        "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\GoldenDict",
        "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GoldenDict"
    ]

    for key in keys {
        icon := ""
        try icon := RegRead(key, "DisplayIcon")
        if (icon != "")
            return StrSplit(icon, ",")[1]

        loc := ""
        try loc := RegRead(key, "InstallLocation")
        if (loc != "" && FileExist(loc "\GoldenDict.exe"))
            return loc "\GoldenDict.exe"
    }
    return ""
}
