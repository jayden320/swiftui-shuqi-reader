# SwiftUI Reader


[![CodeFactor](https://www.codefactor.io/repository/github/huanxsd/swiftui-shuqi-reader/badge)](https://www.codefactor.io/repository/github/huanxsd/swiftui-shuqi-reader)
![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg?longCache=true&style=flat-square)
[![GitHub stars](https://img.shields.io/github/stars/huanxsd/swiftui-shuqi-reader?logo=github&style=flat-square)](https://github.com/huanxsd/swiftui-shuqi-reader/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/huanxsd/swiftui-shuqi-reader?logo=github&style=flat-square)](https://github.com/huanxsd/swiftui-shuqi-reader/network)

Language: [English](README.md) | 中文

## 功能 ✨

使用swiftUI重新实现了这个项目的部分功能: [flutter_shuqi](https://github.com/huanxsd/flutter_shuqi)
* 原生功能：
    * 设备类型：iPhone / iPad
    * 系统版本：iOS 14.0
    * Swift版本：Swift 5
    * 设备方向：支持横/竖屏
    * 夜间模式：支持
* 主页面
    * 处理UINavigationControllerDelegate
* 书城页
    * page样式的tab view
    * 自定义卡片
    * 自定义毛玻璃效果的控件
* 书架页
    * 自定义NavigationBar（根据ScrollView的offset控制显示/隐藏）
* 个人页
* 书籍详情页
    * 实现常规动画
    * 弹出全屏覆盖页面
* 阅读页
    * 菜单的出现/消失动画

我试着让这个Demo的结构尽量接近实际项目，同时使用比较简单方式去实现功能。这样可以让刚接触SwiftUI的人更够容易理解代码。

## 截图 📸

### 竖屏
| ![1](https://i.postimg.cc/1RN8qYjR/light-1.png)   | ![2](https://i.postimg.cc/QxGHkk2Q/light-2.png)   | ![3](https://i.postimg.cc/nc4Md9x6/light-3.png)   |
|----------------------------------------------------------|----------------------------------------------------------|----------------------------------------------------------|
| ![4](https://i.postimg.cc/wj9MnxT3/light-4.png)   | ![5](https://i.postimg.cc/wjFMzK72/light-5.png)   | ![6](https://i.postimg.cc/W433b9Zv/light-6.png)   |
| ![7](https://i.postimg.cc/638yzH60/dark-1.png)   | ![8](https://i.postimg.cc/wBf1XKzM/dark-2.png)   | ![9](https://i.postimg.cc/DwcJzJYq/dark-3.png)   |
| ![10](https://i.postimg.cc/0N26KkLh/dark-4.png)   | ![11](https://i.postimg.cc/1X641fqV/dark-5.png)   | ![12](https://i.postimg.cc/k4LDHxBd/dark-6.png)   |

### 横屏
| ![13](https://i.postimg.cc/QNnphCp6/horizontal-1.png)   | ![14](https://i.postimg.cc/ZKGpvQsp/horizontal-2.png)   |
|----------------------------------------------------------|----------------------------------------------------------|
| ![15](https://i.postimg.cc/9Qnc83TN/horizontal-3.png)   | ![16](https://i.postimg.cc/pXhKTvCP/horizontal-4.png)   |


## 运行 🍭

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