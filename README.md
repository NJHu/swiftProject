# SwiftProject
> 最彻底的组件化<br>正在进行中, 逐渐完善文档和项目<br>**可能本仓库长期不更新, 但是组件在更新, 经常pod update下**关注<br>[组件仓库](https://github.com/NJHu/NJSpecs.git):https://github.com/NJHu/NJSpecs.git

GitHub: [NJHu](https://github.com/njhu) | 简书: [NJHu](https://www.jianshu.com/u/dbc8e7afeb3d) | Blog: [NJHu](https://www.weibo.com/njhu) | Email: [64hp@163.com](mailto:64hp@163.com)

## 如何pod install成功？(**IJK太大, 仓库不支持**) | 请确保pod是最新版本 |
- 1, 到**百度网盘**下载[**NJIJKPlayer**](https://pan.baidu.com/s/1ybEzk65SeWuGuzp6B4yCtA)
- 2, 然后**pod update** 或者 **pod install**

![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/NJIJKPlayer_baidu.png)

## 进度

<div><img src="https://raw.githubusercontent.com/NJHu/swiftProject/master/images/homeList.png" width="24%"><img src="https://raw.githubusercontent.com/NJHu/swiftProject/master/images/category.png" width="24%"><img src="https://raw.githubusercontent.com/NJHu/swiftProject/master/images/categoryList.png" width="24%"><img src="https://raw.githubusercontent.com/NJHu/swiftProject/master/images/homenowshow.png" width="24%"></div>

<div><img src="https://raw.githubusercontent.com/NJHu/swiftProject/master/images/douyuliveroom.png" width="24%"><img src="https://raw.githubusercontent.com/NJHu/swiftProject/master/images/nowshowliveroom.png" width="24%"></div>

## 模块交互
> **实线表示依赖和调用, 虚线表示动态调用**

![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/mediator.png)

## 项目结构
> 一切皆组件, 组件皆一切

- 1, 主工程只需要拥有 NJAppDelegate 和 NJTabBarController. 
- 2, 其他所有的功能都在相应的组件里边

![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/Swiftmulu.png)

### NJTabBarController

``` swift
// MARK: - 添加模块
extension NJTabBarController {
    private func addChildVcs() -> Void {

        if let nav0 = NJMediator.sharedMediator.Mediator_DYLiveShow_MainController() {
            self.addChildViewController(nav0)
        }
        
        if let nav1 = NJMediator.sharedMediator.Mediator_DYTrends_MainController() {
            self.addChildViewController(nav1)
        }
    }
}
```

### Podfile

```bash
def release_remote_pods
    
    source 'https://github.com/NJHu/NJSpecs.git' # NJ 私有源
    
    pod 'NJKit'
    pod 'NJMediator', :source => 'https://github.com/NJHu/NJSpecs.git'

    pod 'NJIJKPlayer', :path => '../../NJIJKPlayer'
    
    pod 'DYLiveShow'
    pod 'NJMediator_DYLiveShow'
    
end
```

## 参考文章
- [如何快速的开发一个完整的iOS直播app](https://www.jianshu.com/p/bd42bacbe4cc)
- [iOS应用架构谈 组件化方案](https://casatwy.com/iOS-Modulization.html)
- [组件化架构漫谈](https://www.jianshu.com/p/67a6004f6930)
- [在现有工程中实施基于CTMediator的组件化方案](https://casatwy.com/modulization_in_action.html)

## 声明

- 1, 本项目仅供交流学习使用
- 2, 该项目**接口和数据**来自[第三方开放平台 斗鱼开发者论坛](http://dev-bbs.douyutv.com/forum.php?mod=forumdisplay&fid=37)
- 3, 该项目中**图片资源**来自[iconfont](http://iconfont.cn/)
- 4, 如果有侵权, 请联系Email: [64hp@163.com](mailto:64hp@163.com)