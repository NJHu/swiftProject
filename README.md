# SwiftProject
> 最彻底的组件化<br>
正在进行中, 逐渐完善文档和项目<br>**可能本仓库长期不更新, 但是组件在更新, 经常pod update下**关注<br>
[组件仓库](https://github.com/NJHu/NJSpecs.git):https://github.com/NJHu/NJSpecs.git

GitHub: [NJHu](https://github.com/njhu) | 简书: [NJHu](https://www.jianshu.com/u/dbc8e7afeb3d) | Blog: [NJHu](https://www.weibo.com/njhu) | Email: <a href="64hp@163.com">64hp@163.com</a>

## 模块交互
> **实线表示依赖和调用, 虚线表示动态调用**

![](./images/mediator.png)

## 项目结构
> 一切皆组件, 组件皆一切

- 1, 主工程只需要拥有 NJAppDelegate 和 NJTabBarController. 
- 2, 其他所有的功能都在相应的组件里边

- ![](./images/Swiftmulu.png)

### NJTabBarController

``` swift
// MARK: - 添加模块
extension NJTabBarController {
    private func addChildVcs() -> Void {
        let nav0 = NJMediator.sharedMediator.Mediator_DYLiveShow_MainController()
        if nav0 != nil {
            self.addChildViewController(nav0!)
        }
        let nav1 = NJMediator.sharedMediator.Mediator_DYTrends_MainController()
        if nav1 != nil {
            self.addChildViewController(nav1!)
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
    
    pod 'DYTrends'
    pod 'NJMediator_DYTrends'
    
    pod 'DYLiveShow'
    pod 'NJMediator_DYLiveShow'
    
end
```

## 参考文章
- [如何快速的开发一个完整的iOS直播app](https://www.jianshu.com/p/bd42bacbe4cc)
- [iOS应用架构谈 组件化方案](https://casatwy.com/iOS-Modulization.html)
- [组件化架构漫谈](https://www.jianshu.com/p/67a6004f6930)
- [在现有工程中实施基于CTMediator的组件化方案](https://casatwy.com/modulization_in_action.html)
