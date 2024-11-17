# WindowsMediaOCR.au3

![https://img.shields.io/badge/AutoIt-3.3.14.5-blue.svg](https://img.shields.io/badge/AutoIt-3.3.14.5-blue.svg) ![](https://img.shields.io/badge/ChatGPT-%F0%9F%92%AA%F0%9F%8F%BB-%2377AB9E)

调用 Windows API 进行 OCR

## 使用方法

直接运行提示选择文件进行识别

带`-p`参数运行读取剪贴板，

### MouseInc 鼠标手势集成

请自行编译成`WindowsMediaOCR.exe`然后放到 MouseInc.exe 所在目录

```
[
	["Screenshot", "ToClipboard"],
	["Execute", "%appdir%\\WindowsMediaOCR.exe -p", "wait"],
	["Internal", "ShowTips", "%clipboard%"]
]
```

### 下载地址

https://xmp.lanzouj.com/b0r9kwl5a
密码:3hst

## 感谢

[DanysysTeam/UWPOCR: AutoIt UWPOCR UDF Windows Platform Optical character recognition API Implementation](https://github.com/DanysysTeam/UWPOCR)
