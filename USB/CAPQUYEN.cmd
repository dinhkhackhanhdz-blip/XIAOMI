@ECHO off
chcp 1251

set /p UserInput=Nhap dia chi IP cua TV IPV4 :
adb kill-server
adb start-server

adb connect %UserInput%:5555
adb wait-for-device

adb shell pm uninstall --user 0 com.xiaomi.mitv.upgrade
adb shell pm uninstall --user 0 com.miui.systemAdSolution
adb shell pm uninstall --user 0 com.xiaomi.mitv.advertise
adb shell pm uninstall --user 0 com.xiaomi.mibox.gamecenter
adb shell pm uninstall --user 0 com.mitv.gallery
adb shell pm uninstall --user 0 com.xiaomi.tv.appupgrade
adb shell pm uninstall --user 0 com.ktcp.tvvideo
adb shell pm uninstall --user 0 com.pptv.tvsports.preinstall
adb shell pm uninstall --user 0 com.duokan.videodaily
adb shell pm uninstall --user 0 com.pplive.atv
adb shell pm uninstall --user 0 com.mitv.screensaver
adb shell pm uninstall --user 0 com.xiaomi.tweather
adb shell pm uninstall --user 0 com.xiaomi.mitv.handbook
adb shell pm uninstall --user 0 com.xiaomi.mitv.calendar
adb shell pm uninstall --user 0 com.xiaomi.mitv.payment
adb shell pm uninstall --user 0 com.xiaomi.mitv.pay
adb shell pm uninstall --user 0 com.mipay.wallet.tv
adb shell pm uninstall --user 0 com.xiaomi.mitv.appstore
adb shell pm uninstall --user 0 com.xiaomi.mitv.shop
adb shell pm uninstall --user 0 com.mitv.alarmcenter
adb shell pm uninstall --user 0 com.miui.tv.analytics
adb shell pm uninstall --user 0 com.xiaomi.tv.gallery
adb shell pm uninstall --user 0 com.xiaomi.mitv.karaoke.service
adb shell pm uninstall --user 0 com.xiaomi.voicecontrol
adb shell pm uninstall --user 0 com.xiaomi.gamecenter.sdk.service.mibox
adb shell pm uninstall --user 0 com.xiaomi.account
adb shell pm uninstall --user 0 com.xiaomi.account.auth
adb shell pm uninstall --user 0 com.droidlogic
adb shell pm uninstall --user 0 com.xiaomi.statistic
adb shell pm uninstall --user 0 com.xiaomi.smarthome.tv
timeout /t 2 >nul
adb shell pm grant jp.co.c_lis.ccl.morelocale android.permission.CHANGE_CONFIGURATION
adb shell settings put system system_locales vi-VN
adb shell setprop persist.sys.locale vi-VN
adb shell setprop persist.sys.language vi 
adb shell setprop persist.sys.country VN
adb shell am broadcast -a android.intent.action.LOCALE_CHANGED
adb shell pm grant com.spocky.projengmenu android.permission.WRITE_SECURE_SETTINGS 
adb shell pm grant com.spocky.projengmenu android.permission.RECEIVE_BOOT_COMPLETED
adb shell pm grant com.spocky.projengmenu android.permission.QUERY_ALL_PACKAGES 
adb shell appops set com.spocky.projengmenu SYSTEM_ALERT_WINDOW allow
timeout /t 2 >nul
adb shell cmd package set-home-activity com.spocky.projengmenu/.ui.home.MainActivity
timeout /t 2 >nul





























