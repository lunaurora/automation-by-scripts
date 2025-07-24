# 🚀 窗口置顶小工具 (win_pin.ahk)

这个 AutoHotkey v2.0 脚本提供了一个便捷的方式，让你可以通过鼠标快速切换任意窗口的“总是置顶”状态。

## ✨ 功能简介

* **一键切换置顶：** 当鼠标悬停在某个窗口上时，按下设定的快捷键即可将其设置为置顶或取消置顶。
* **直观提示：** 操作成功后，会通过系统托盘通知提示当前窗口的置顶状态。

## ⚙️ 系统要求

* **Windows 操作系统**
* **AutoHotkey v2.0 或更高版本**：本脚本是为 AutoHotkey v2 语法编写的，不兼容旧版本（v1.1）。

    * [下载 AutoHotkey v2.0](https://www.autohotkey.com/download/ahk-v2.exe)

## 📦 如何使用

1.  **安装 AutoHotkey v2.0：** 如果你尚未安装，请从上方链接下载并安装最新版本的 AutoHotkey v2。
2.  **下载脚本：** 将 `win_pin.ahk` 文件下载到你的电脑上。
3.  **运行脚本：** 双击 `win_pin.ahk` 文件即可运行。脚本会在后台运行，并在系统托盘中显示 AutoHotkey 图标。
4.  **使用快捷键：**
    * 将鼠标悬停在你想要置顶或取消置顶的窗口上。
    * 按下 `Win + T` (`#t`) 快捷键。
    * 系统托盘会弹出提示，显示窗口置顶状态的切换结果。

## 💡 脚本代码解析

```autohotkey
#Requires AutoHotkey v2.0

#t:: { ; 定义热键为 Win + T (Windows 键 + T)
    MouseGetPos(&x, &y, &win_id) ; 获取鼠标指针当前所在的屏幕坐标 (x, y) 和对应的窗口句柄 (win_id)

    if (!win_id) { ; 如果没有获取到有效的窗口句柄（例如，鼠标在桌面或空白区域）
        TrayTip "窗口置顶", "未在鼠标位置找到可操作的窗口", 1 ; 在系统托盘显示提示信息，持续 1 秒
        return ; 退出函数
    }

    ExStyle := WinGetExStyle("ahk_id " win_id) ; 获取指定窗口的扩展样式

    ; 检查窗口的扩展样式是否包含 0x8 (WS_EX_TOPMOST)，这是“总是置顶”的标志位
    if (ExStyle & 0x8) {
        WinSetAlwaysOnTop false, "ahk_id " win_id ; 如果已置顶，则取消置顶
        TrayTip "窗口置顶", "已取消窗口置顶", 1 ; 提示取消置顶
    } else {
        WinSetAlwaysOnTop true, "ahk_id " win_id ; 如果未置顶，则设置置顶
        TrayTip "窗口置顶", "已设置窗口置顶", 1 ; 提示设置置顶
    }
}

