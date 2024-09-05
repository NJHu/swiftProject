<div>
<p>在武汉打算换工作啦, 有坑位推荐的朋友请加我微信~谢谢~</p>
<img src="https://raw.githubusercontent.com/NJHu/iOSProject/master/images/wx_code.jpg" width="28%">
</div>


|**SwiftProject 简介**|模块交互|
|:---|:---:|
|`最彻底的组件化`<br>`正在进行中`<br>**`经常pod update`**<br>[组件仓库-查看](https://github.com/NJHu/NJSpecs.git)|**实线表示依赖和调用, 虚线表示动态调用**<br>![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/mediator.png)|

GitHub: [NJHu](https://github.com/njhu) | 简书: [NJHu](https://www.jianshu.com/u/dbc8e7afeb3d) | Blog: [NJHu](https://www.weibo.com/njhu) | Email: [64hp@163.com](mailto:64hp@163.com)

## 部分截图

|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/homeList.png)|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/category.png)|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/categoryList.png)|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/videoList.jpeg)|
|---|---|---|---|
|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/homenowshow.png)|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/videoPlayprotrait.jpeg)|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/douyuliveroom.png)|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/nowshowliveroom.png)|

## 如何运行成功?Xcode10
|步骤|截图|
|:---|:---:|
|1, 到**百度网盘**下载[**NJIJKPlayer**](https://pan.baidu.com/s/1rqpRY5hizieBdNeIum2npA)<br>2, 执行命令<br>`sudo gem install cocoapods`<br>保证pod版本>=1.5.3<br>3, 然后**pod update** 或者 **pod install**<br>|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/NJIJKPlayer_baidu.png)|

## 项目结构
> 一切皆组件, 组件皆一切

- 1, 主工程只需要拥有 NJAppDelegate 和 NJTabBarController. 
- 2, 其他所有的功能都在相应的组件里边

|目录结构|TabBarController|
|:---:|:---:|
|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/Swiftmulu.png)|![](https://raw.githubusercontent.com/NJHu/swiftProject/master/images/njtabbarcontroller.png)|


### Podfile

```bash
def release_remote_pods
    
    source 'https://github.com/NJHu/NJSpecs.git' # NJ 私有源
    # 基础组件
    pod 'NJKit'
    # 中间件
    pod 'NJMediator', :source => 'https://github.com/NJHu/NJSpecs.git'
    # IJK
    pod 'NJIJKPlayer', :path => '../../NJIJKPlayer/'
    pod 'NJDYPlayer'
    
    # 个人偏好模块
    pod 'DYTrends'
    pod 'NJMediator_DYTrends'
    
    # 直播列表
    pod 'DYLiveShow'
    pod 'NJMediator_DYLiveShow'
    # 直播间
    pod 'DYLiveRoom'
    
    # NowShow组件
    pod 'NJNowShow'
    pod 'NJMediator_NJNowShow'
    # NowShow直播间
    pod 'NJNowShowPlay'
    
    # 视频列表
    pod 'NJSisVideoList'
    pod 'NJMediator_NJSisVideoList'
    # 视频播放页面
    pod 'NJSisPlayPage'

end
```

## 现有组件列表和依赖关系
> 仓库: https://github.com/NJHu/NJSpecs.git

|编号|组件|简介|依赖|
|:---|:---|:---|:---|
|0|[NJKit](https://github.com/NJHu/NJKit.git)|基类和工具|SnapKit, MJRefresh, Alamofire, SwiftyJSON, AlamofireImage|
|1|[NJMediator](https://github.com/NJHu/NJMediator.git)|中间件: Target-Action||
|2|[NJIJKPlayer](https://github.com/NJHu/NJIJKPlayer.git)|编译后的IJKFramework, 支持真机和模拟器||
|3|[NJDYPlayer](https://github.com/NJHu/NJDYPlayer.git)|播放器, 直播和视频均支持|[NJIJKPlayer](https://github.com/NJHu/NJIJKPlayer.git)<br>[NJKit](https://github.com/NJHu/NJKit.git)|
|4|[NJDYSearchBarView](https://github.com/NJHu/NJDYSearchBarView.git)|搜索组件|[NJKit](https://github.com/NJHu/NJKit.git)|
|5|[DYLiveShow](https://github.com/NJHu/DYLiveShow.git)|直播列表|[NJKit](https://github.com/NJHu/NJKit.git)<br>[NJMediator_DYLiveRoom-直播间中间件](https://github.com/NJHu/NJMediator_DYLiveRoom.git)<br>[NJDYSearchBarView-搜索组件](https://github.com/NJHu/NJDYSearchBarView.git)|
|6|[NJMediator_DYLiveShow](https://github.com/NJHu/NJMediator_DYLiveShow.git)|直播列表中间件|[NJMediator-中间件](https://github.com/NJHu/NJMediator.git)|
|7|[DYLiveRoom](https://github.com/NJHu/DYLiveRoom.git)|直播间|[NJKit](https://github.com/NJHu/NJKit.git)<br>[NJDYPlayer](https://github.com/NJHu/NJDYPlayer.git)|
|8|[NJMediator_DYLiveRoom](https://github.com/NJHu/NJMediator_DYLiveRoom.git)|直播间中间件|[NJMediator-中间件](https://github.com/NJHu/NJMediator.git)|
|9|[NJNowShow](https://github.com/NJHu/NJNowShow.git)|NowShow列表, 模仿腾讯NowShow|[NJKit](https://github.com/NJHu/NJKit.git)<br>[NJMediator_NJNowShowPlay-播放中间件](https://github.com/NJHu/NJMediator_NJNowShowPlay.git)|
|10|[NJMediator_NJNowShow](https://github.com/NJHu/NJMediator_NJNowShow.git)|NowShow播放列表中间件|[NJMediator-中间件](https://github.com/NJHu/NJMediator.git)|
|11|[NJNowShowPlay](https://github.com/NJHu/NJNowShowPlay.git)|NowShow播放界面组件|[NJKit](https://github.com/NJHu/NJKit.git)<br>[NJDYPlayer](https://github.com/NJHu/NJDYPlayer.git)|
|12|[NJMediator_NJNowShowPlay](https://github.com/NJHu/NJMediator_NJNowShowPlay.git)|Now播放界面中间件|[NJMediator-中间件](https://github.com/NJHu/NJMediator.git)|
|13|[NJSisVideoList](https://github.com/NJHu/NJSisVideoList.git)|视频列表|[NJKit](https://github.com/NJHu/NJKit.git)<br>[NJMediator_NJSisPlayPage-视频播放界面中间件](https://github.com/NJHu/NJMediator_NJSisPlayPage.git)|
|14|[NJMediator_NJSisVideoList](https://github.com/NJHu/NJMediator_NJSisVideoList.git)|视频列表中间件|[NJMediator](https://github.com/NJHu/NJMediator.git)|
|15|[NJSisPlayPage](https://github.com/NJHu/NJSisPlayPage.git)|视频播放界面|[NJKit](https://github.com/NJHu/NJKit.git)<br>[NJDYPlayer](https://github.com/NJHu/NJDYPlayer.git)|
|16|[NJMediator_NJSisPlayPage](https://github.com/NJHu/NJMediator_NJSisPlayPage.git)|视频播放界面中间件|[NJMediator](https://github.com/NJHu/NJMediator.git)|
|17|[DYTrends](https://github.com/NJHu/DYTrends.git)|个人偏好组件|[NJKit](https://github.com/NJHu/NJKit.git)|
|18|[NJMediator_DYTrends](https://github.com/NJHu/NJMediator_DYTrends.git)|个人偏好界面中间件|[NJMediator](https://github.com/NJHu/NJMediator.git)|
|19|[NJFAQ](https://github.com/NJHu/NJFAQ.git)|常见问题解答|[NJKit](https://github.com/NJHu/NJKit.git)|
|20|[NJMediator_NJFAQ](https://github.com/NJHu/NJMediator_NJFAQ.git)|常见问题解答中间件|[NJMediator](https://github.com/NJHu/NJMediator.git)|

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
