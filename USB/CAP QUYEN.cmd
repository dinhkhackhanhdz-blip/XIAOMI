@ECHO off
chcp 1251

set /p UserInput=Nhap dia chi IP cua TV IPV4 :
adb kill-server
adb start-server

adb connect %UserInput%:5555
adb wait-for-device

adb shell pm disable-user --user 0 com.xiaomi.voicecontrol
adb shell pm disable-user --user 0 com.xiaomi.tweather
adb shell pm disable-user --user 0 com.xiaomi.setupwizard
adb shell pm disable-user --user 0 com.xiaomi.mitv.shop
adb shell pm disable-user --user 0 com.xiaomi.mitv.handbook
adb shell pm disable-user --user 0 com.xiaomi.mitv.calendar
adb shell pm disable-user --user 0 com.xiaomi.mitv.appstore
adb shell pm disable-user --user 0 com.miui.tv.analytics
adb shell pm disable-user --user 0 com.mitv.cloudcontrol
adb shell pm disable-user --user 0 com.duokan.videodaily
adb shell pm disable-user --user 0 com.xiaomi.mitv.karaoke.service
adb shell pm grant jp.co.c_lis.ccl.morelocale android.permission.CHANGE_CONFIGURATION
adb shell service call alarm 3 s16 Asia/Bangkok

:: Bật dịch vụ trợ năng
adb shell settings put secure accessibility_enabled 1
adb shell settings put secure accessibility_services_state 1

:: Thêm Launcher vào dịch vụ trợ năng
adb shell settings put secure enabled_accessibility_services com.spocky.projengmenu/com.spocky.projengmenu.services.ProjectivyAccessibilityService:com.spocky.projengmenu/.services.WindowChangeDetectingService
adb shell appwidget grantbind --package ca.dstudio.atvlauncher.pro --user 0

::Đang đặt Launcher làm mặc định
adb shell pm reset-preferred-activities
adb shell cmd package set-home-activity ca.dstudio.atvlauncher.pro/ca.dstudio.atvlauncher.screens.launcher.LauncherActivity
adb shell cmd package set-home-activity com.oversea.aslauncher/com.oversea.aslauncher.ui.main.Main.Activity
adb shell cmd package set-home-activity com.spocky.projengmenu
adb shell am start -a android.intent.action.MAIN -c android.intent.category.HOME
adb shell am start -a android.settings.HOME_SETTINGS