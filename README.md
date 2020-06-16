# RenderDebugPreferences

A preference pane for jailbroken devices that lets you toggle Render Debug Options
(like Color Blended Layers, or Color Offscreen-Rendered) from your device.
Based on [this](https://bryce.co/on-device-render-debugging/) post on [bryce.co](https://bryce.co/).

## Building

### Prerequisites

- A jailbroken device
- [Theos](https://github.com/theos/theos/).

### Build

`make package`

## Installation

If you have `THEOS_DEVICE_IP` and `THEOS_DEVICE_PORT` set (see [Theos setup](https://iphonedevwiki.net/index.php/Theos/Setup)) :

`make package install`

Otherwise, you can copy the `.deb` file created by `make package` onto your device and install manually with `dpkg`.
