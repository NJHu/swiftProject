# swift项目(待完善) 

#### 组件仓库: https://github.com/NJHu/NJSpecs.git

## 基类(待完善)

### 控制器(待完善)

<div>
<img src="https://raw.githubusercontent.com/NJHu/swiftProject/master/images/jcguanxi.png" width="70%">
</div>

#### NJNavigationController 

- 0, 仅适用导航控制器的逻辑功能, 不适用系统导航条. 
- 1, 隐藏导航条
- 2, 全局滑动返回和控制全局滑动返回的功能

```swift
// MARK:- gesture
extension NJNavigationController: UIGestureRecognizerDelegate {
    private func getSystemGestureOfBack() {
        let panGes = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer?.delegate, action: Selector(("handleNavigationTransition:")))
        view.addGestureRecognizer(panGes)
        panGes.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = false
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let vc = self.childViewControllers.last as? NJNavBarViewController {
            return (self.childViewControllers.count > 1 && !vc.nj_interactivePopDisabled)
        }else {
            return false
        }
    }
}
```

##### NJNavigationBar

```swift
    public let bottomSepLineView = UIView()
    public let titleLabel = UILabel()
```

#### NJNavBarViewController 

- 0, 继承自 UIViewController, 添加了一个自定义的导航条 View

```swift
nj_navigationBar.isHidden = !(parent != nil && parent!.isKind(of: NJNavigationController.classForCoder()))
```

- 1, 处理 StatusBar

```swift
// MARK:- StatusBar
//        setNeedsStatusBarAppearanceUpdate()
extension NJNavBarViewController {
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
}
```

- 2, 控制标题

```swift
nj_navigationBar.titleLabel.text = navigationItem.title != nil ? navigationItem.title : title
navigationItem.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)

override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let navigationItem = object as? UINavigationItem
        if keyPath! == "title" && (navigationItem != nil) && (navigationItem! == self.navigationItem) {
            nj_navigationBar.titleLabel.text = change?[NSKeyValueChangeKey.newKey] as? String
        }else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
```


#### NJViewController

- 0, 基本设置

```swift
        view.backgroundColor = UIColor.groupTableViewBackground
        automaticallyAdjustsScrollViewInsets = false
```

- 1, 控制器释放的打印
- 2, ...

#### NJTableViewController

- 拥有一个 UITableView, 添加在 self.view上

```swift
@IBOutlet var tableView: UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        if tableView == nil {
            addTableView()
        }
        setupTableView()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollView.scrollIndicatorInsets = scrollView.contentInset
        view.endEditing(true)
    }
```

#### NJCollectionViewController

- 拥有一个 UICollectionView, 添加在 self.view上

#### NJWebViewController

- 1, 添加一个 WKWebView 在 self.view上
- 2, 实现 wkwebView 所有的基本配置
- 3, 导航条上添加 ** 返回 ** ** 关闭 ** 按钮 实现基本的网页浏览功能
- 3, 监听进度, 监听标题改变, 监听 contentSize 改变, 

```swift
    public var isNeedProgressLine: Bool = true
    public var isAutoChangeTitle: Bool = true
    public var webView: WKWebView? = nil
    public var html: String? = nil
    private lazy var closeBtn: UIButton = UIButton(type: UIButtonType.custom)
    private lazy var backBtn: UIButton = UIButton(type: UIButtonType.custom)
    private lazy var progressView: UIProgressView = UIProgressView()
    public var gotoUrl: String? {
        didSet {
            gotoUrl = self.gotoUrl?.addingPercentEncoding(withAllowedCharacters: CharacterSet.init(charactersIn: "`#%^{}\"[]|\\<> ").inverted)
        }
    }
```

#### NJRefreshTableViewController

- 让 TableView 拥有上拉加载, 下拉刷新的功能

#### NJRefreshCollectionViewController

- 让 CollectionView 拥有上拉加载, 下拉刷新的功能

