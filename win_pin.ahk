#Requires AutoHotkey v2.0

#t:: {
    MouseGetPos(&x, &y, &win_id) ; 获取鼠标位置和窗口 ID

    if (!win_id) {
        TrayTip "窗口置顶", "未在鼠标位置找到可操作的窗口", 1
        return
    }

    ExStyle := WinGetExStyle("ahk_id " win_id)

    if (ExStyle & 0x8) {
        WinSetAlwaysOnTop false, "ahk_id " win_id
        TrayTip "窗口置顶", "已取消窗口置顶", 1
    } else {
        WinSetAlwaysOnTop true, "ahk_id " win_id
        TrayTip "窗口置顶", "已设置窗口置顶", 1
    }
}