; TigerVNC 窗口双击 Alt 输入中文
Persistent
#HotIf WinActive("ahk_class vncviewer",)

; 初始化变量
AltPressed := false

; 按键按下事件处理
~Alt::
; 如果 Alt 键已经按下，说明是第二次按下 Alt 键
{ ; V1toV2: Added bracket
    global AltPressed
    if (AltPressed) {
        ; 切换输入法到中文，-200 指 200 ms 后运行，负数是只运行一次
        SetTimer SwitchSogouPinYin, -200

        ; 弹出输入框
        IB := InputBox("Type something:", "请输入中文")
        if IB.Result = "OK" {
            ; 获取用户输入的文本
            UserInput := IB.Value

            ; 将文本复制到剪贴板
            A_Clipboard := UserInput

            ; 切换到 TigerVNC 窗口并模拟 Ctrl+V
            WinActivate("ahk_class vncviewer")
            Send("^v")
        }
        ; 重置 AltPressed 变量
        AltPressed := false
    } else {
        ; 如果 Alt 键尚未按下，将 AltPressed 设置为 true
        AltPressed := true
    }
    return

    ; 按键释放事件处理
} ; V1toV2: Added Bracket before hotkey or Hotstring
~Alt Up::
; 释放 Alt 键时，重置 AltPressed 变量
{ ; V1toV2: Added bracket
    AltPressed := false
    return
} ; V1toV2: Added bracket in the end

SwitchSogouPinYin() {
    Send("^,")
}