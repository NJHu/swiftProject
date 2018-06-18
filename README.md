|<h1>SwiftProject</h1>**组件化**<br>正在进行中, 逐渐完善文档和项目<br>组件仓库: https://github.com/NJHu/NJSpecs.git| <img src="https://raw.githubusercontent.com/NJHu/iOSProject/master/images/nj.jpg" width="140px" height="160px" onclick="javascript:void(0);"/> | GitHub: [NJHu](https://github.com/njhu)<br>简书: [NJHu](https://www.jianshu.com/u/dbc8e7afeb3d)<br><br>Blog: [NJHu](https://www.weibo.com/njhu)<br>Email: <a href="64hp@163.com">64hp@163.com</a> |
|:---|---|:---|



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
    pod 'NJMediator'
    
    pod 'DYTrends'
    pod 'NJMediator_DYTrends'
    
    pod 'DYLiveShow'
    pod 'NJMediator_DYLiveShow'
end
```
