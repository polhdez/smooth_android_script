# Smooth Android

Bash script using ADB to enhance smoothness and performance on android devices.

It applies these tweaks based on [@tytydraco](https://github.com/tytydraco/)'s work: https://github.com/tytydraco/monolith/


I apply the profile optimizations he found on all the apks using adb and also set the animations to 0.75x for a buttery smooth experience.


For applying the tweaks run:

`./smooth_android.sh install`

And you can revert them with:

`./smooth_android.sh uninstall`


Here there is some documentation on baseline profiles:
https://developer.android.com/topic/performance/baselineprofiles/overview/


And here is the documentation for dexopt, basically it forces a full recompile to odex instead of the system doing it on demand:
https://android.googlesource.com/platform/dalvik-snapshot/+/gingerbread/docs/dexopt.html
