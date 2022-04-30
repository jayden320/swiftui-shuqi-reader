# SwiftUI Reader


[![CodeFactor](https://www.codefactor.io/repository/github/huanxsd/swiftui-shuqi-reader/badge)](https://www.codefactor.io/repository/github/huanxsd/swiftui-shuqi-reader)
![GitHub](https://img.shields.io/github/license/mashape/apistatus.svg?longCache=true&style=flat-square)
[![GitHub stars](https://img.shields.io/github/stars/huanxsd/swiftui-shuqi-reader?logo=github&style=flat-square)](https://github.com/huanxsd/swiftui-shuqi-reader/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/huanxsd/swiftui-shuqi-reader?logo=github&style=flat-square)](https://github.com/huanxsd/swiftui-shuqi-reader/network)

Language: [English](README.md) | 中文

## 功能 ✨

使用swiftUI重新实现了这个项目的部分功能: [flutter_shuqi](https://github.com/huanxsd/flutter_shuqi)
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
* 其他功能：
    * 支持日间/夜间模式
    * 延迟加载的view，延迟加载的navigation link

我试着让这个Demo的结构尽量接近实际项目，同时使用比较简单方式去实现功能。这样可以让刚接触SwiftUI的人更够容易理解代码。

## 截图 📸

| ![1](https://pic.lienav.com/i/2022/04/30/626d0245e51cd.png)   | ![2](https://pic.lienav.com/i/2022/04/30/626d024800fdd.png)   | ![3](https://pic.lienav.com/i/2022/04/30/626d024988651.png)   |
|----------------------------------------------------------|----------------------------------------------------------|----------------------------------------------------------|
| ![4](https://pic.lienav.com/i/2022/04/30/626d024b18917.png)   | ![5](https://pic.lienav.com/i/2022/04/30/626d024c3f733.png)   | ![6](https://pic.lienav.com/i/2022/04/30/626d024d749d0.png)   |
| ![7](https://pic.lienav.com/i/2022/04/30/626d0255a8875.png)   | ![8](https://pic.lienav.com/i/2022/04/30/626d0256ee602.png)   | ![9](https://pic.lienav.com/i/2022/04/30/626d0258a27b3.png)   |
| ![10](https://pic.lienav.com/i/2022/04/30/626d025c26412.png)   | ![11](https://pic.lienav.com/i/2022/04/30/626d025e3d9da.png)   | ![12](https://pic.lienav.com/i/2022/04/30/626d025fbfabe.png)   |

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