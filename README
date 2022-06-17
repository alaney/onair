# Purpose

This project is designed to detect whether or not you are in a Google or Zoom meeting and turn on (or off) a smart switch via an HTTP request. By connecting a lamp/sign/light to the smart switch, you can proactively alert your family (or coworkers) that you are in a meeting and avoid unwanted interruptions.

# Compatibility

The project is specifically designed for MacOS as it utilizes Apple Script to determine if Google Meet is open.

Additionally, the HTTP request is specific to the [Sonoff RFR3 Smart Switch](https://sonoff.tech/product/diy-smart-switch/rfr3/) but could be easliy updated to support another device.

# Running the App

The script can be started like any other sh script by executing `./onair.sh` in the terminal. However, if you are like me and you want this script to execute when you boot up your machine then there are a few options. Those are best described in [this](https://superuser.com/questions/229773/run-command-on-startup-login-mac-os-x) Stack Exchange post. My preferred method is using [Automator](https://superuser.com/a/465506). This will put an icon in the toolbar when the script is running which make it easy to stop the script if necessary. Remember to pass the `-a` option when using Automator so that the script will properly exit if the Automator process exits. See [this](https://discussions.apple.com/thread/8038454) issue.

# How it Works

Admittedly, I'm not using the most sophisticated methods of meeting detection. Originally, I wanted to detect whether or not the microphone was in use but I couldn't find an easy way to do this. In the end I decided on something simpler. For Zoom, I am simply counting the running processes. It seems that when I'm in a meeting they jump from 3 to 4. For Google Meet, an Apple Script is used to look at all of the open Chrome tabs and see if any have a title that contains `Meet -`. At the moment, these appear to be very reliable.

# The Build
