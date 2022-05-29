# SwiftUI Reader


[![CodeFactor](https://www.codefactor.io/repository/github/huanxsd/swiftui-shuqi-reader/badge)](https://www.codefactor.io/repository/github/huanxsd/swiftui-shuqi-reader)
![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg?longCache=true&style=flat-square)
[![GitHub stars](https://img.shields.io/github/stars/huanxsd/swiftui-shuqi-reader?logo=github&style=flat-square)](https://github.com/huanxsd/swiftui-shuqi-reader/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/huanxsd/swiftui-shuqi-reader?logo=github&style=flat-square)](https://github.com/huanxsd/swiftui-shuqi-reader/network)

Language: English | [中文](README-ZH.md)

## Features ✨

Reimplemented part of the functionality of this project using swiftUI: [flutter_shuqi](https://github.com/huanxsd/flutter_shuqi)
* Native feature
    * Device Type: iPhone / iPad
    * Deployment Target: iOS 14.0
    * Swift Version: Swift 5
    * Device Orientation: Portrait / Upside Down / Landscape Left / Landscape Right
    * Dark Mode: Enabled
* Main tab page:
    * Handle UINavigationControllerDelegate
* Bookstore page: 
    * Tab view with page style
    * Custom card
    * Widget for blurred backgrounds
* Bookshelf page
    * Customize NavigationBar (show/hide according to ScrollView's offset)
* Profile page
* Book detail page
    * Regular animation
    * Show full screen cover
* Reading page
    * Transition animation for menu

## Screenshots 📸

### Vetical
| ![1](https://i.postimg.cc/1RN8qYjR/light-1.png)   | ![2](https://i.postimg.cc/QxGHkk2Q/light-2.png)   | ![3](https://i.postimg.cc/nc4Md9x6/light-3.png)   |
|----------------------------------------------------------|----------------------------------------------------------|----------------------------------------------------------|
| ![4](https://i.postimg.cc/wj9MnxT3/light-4.png)   | ![5](https://i.postimg.cc/wjFMzK72/light-5.png)   | ![6](https://i.postimg.cc/W433b9Zv/light-6.png)   |
| ![7](https://i.postimg.cc/638yzH60/dark-1.png)   | ![8](https://i.postimg.cc/wBf1XKzM/dark-2.png)   | ![9](https://i.postimg.cc/DwcJzJYq/dark-3.png)   |
| ![10](https://i.postimg.cc/0N26KkLh/dark-4.png)   | ![11](https://i.postimg.cc/1X641fqV/dark-5.png)   | ![12](https://i.postimg.cc/k4LDHxBd/dark-6.png)   |

### Horizontal
| ![13](https://i.postimg.cc/QNnphCp6/horizontal-1.png)   | ![14](https://i.postimg.cc/ZKGpvQsp/horizontal-2.png)   |
|----------------------------------------------------------|----------------------------------------------------------|
| ![15](https://i.postimg.cc/9Qnc83TN/horizontal-3.png)   | ![16](https://i.postimg.cc/pXhKTvCP/horizontal-4.png)   |


## Setup 🍭

```
$ git clone https://github.com/huanxsd/swiftui-shuqi-reader.git
$ cd swiftui-shuqi-reader
$ pod install
```

## LICENSE


```
MIT License

Copyright (c) 2018 Jpeng

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
 ```