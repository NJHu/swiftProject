
//
//  NJWebViewController.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/17.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import WebKit

protocol NJWebViewControllerDelegate {
    func webViewBackBtnClick(_ webView: WKWebView, _ controller: NJWebViewController, _ btn: UIButton?) -> Void
    func webViewCloseBtnClick(_ webView: WKWebView, _ controller: NJWebViewController, _ btn: UIButton?) -> Void
    func webViewScrollViewContentSize(_ webView: WKWebView, _ controller: NJWebViewController, _ scrollView: UIScrollView, _ contentSize: CGSize) -> Void
}


class NJWebViewController: NJViewController {
    
    public var isNeedProgressLine: Bool = true
    public var isAutoChangeTitle: Bool = true
    public var webView: WKWebView!
    public var html: String? = nil
    private lazy var closeBtn: UIButton = UIButton(type: UIButtonType.custom)
    private lazy var backBtn: UIButton = UIButton(type: UIButtonType.custom)
    private lazy var progressView: UIProgressView = UIProgressView()
    public var gotoUrl: String? {
        didSet {
            gotoUrl = self.gotoUrl?.addingPercentEncoding(withAllowedCharacters: CharacterSet.init(charactersIn: "`#%^{}\"[]|\\<> ").inverted)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nj_interactivePopDisabled = true
        nj_isBackActionBtnHidden = true
        addWkWebView()
        setUpWkWebView()
        addObservers()
        addActions()
        addprogressView()
        if let urlStr = gotoUrl {
            if let url = URL(string: urlStr) {
                let urlRequestM = NSMutableURLRequest(url: url)
                webView?.load(urlRequestM.copy() as! URLRequest)
            }
        }else if let htmlStr = html {
            webView?.loadHTMLString(htmlStr, baseURL: nil)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.bringSubview(toFront: progressView)
    }
    deinit {
        webView?.removeObserver(self, forKeyPath: "estimatedProgress")
        webView?.removeObserver(self, forKeyPath: "title")
        webView?.scrollView.removeObserver(self, forKeyPath: "contentSize")
    }
}

// MARK:- setting
extension NJWebViewController {
    private func addWkWebView() -> Void {
        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        view.addSubview(webView!)
    }
    private func setUpWkWebView() -> Void {
        let preferences = WKPreferences()
        
        //The minimum font size in points default is 0;
        preferences.minimumFontSize = 0;
        //是否支持JavaScript
        preferences.javaScriptEnabled = true;
        //不通过用户交互，是否可以打开窗口
        preferences.javaScriptCanOpenWindowsAutomatically = true;
        webView?.configuration.preferences = preferences
        
        // 检测各种特殊的字符串：比如电话、网站
        webView?.configuration.dataDetectorTypes = .all;
        // 播放视频
        webView?.configuration.allowsInlineMediaPlayback = true;
        
        webView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        webView?.isOpaque = false
        
        webView?.backgroundColor = UIColor.clear
        
        webView?.allowsBackForwardNavigationGestures = true
        
        webView?.uiDelegate = self;
        
        webView?.navigationDelegate = self;
        
        if #available(iOS 11, *) {
            webView?.scrollView.contentInsetAdjustmentBehavior = .never
        }
        if parent != nil && parent!.isKind(of: UINavigationController.classForCoder()) {
            var contentInset = webView!.scrollView.contentInset
            contentInset.top += nj_navigationBar.frame.size.height
            webView?.scrollView.contentInset = contentInset
            webView?.scrollView.scrollIndicatorInsets = contentInset
        }
    }
    private func addObservers() {
        webView?.addObserver(self, forKeyPath: "estimatedProgress", options: NSKeyValueObservingOptions.new, context: nil)
        webView?.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
        webView?.scrollView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
    }
}
// MARK:- Observers
extension NJWebViewController {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        let wkWebView = object as? WKWebView
        let scrollView = object as? UIView
        
        if ((wkWebView != nil) && (wkWebView! == self.webView)) && (keyPath! == "estimatedProgress" || keyPath! == "title") {
            if keyPath! == "estimatedProgress" {
                self.progressView.isHidden = !self.isNeedProgressLine
                if !self.isNeedProgressLine {
                    return
                }
                self.progressView.progress = Float(webView!.estimatedProgress);
                // 加载完成
                if self.webView!.estimatedProgress  >= 1.0  {
                    UIView.animate(withDuration: 0.25, animations: {
                        self.progressView.alpha = 0
                        self.progressView.progress = 0
                    })
                }else{
                    self.progressView.alpha = 1.0;
                }
            }else if keyPath! == "title" && self.isAutoChangeTitle {
                nj_navigationBar.titleLabel.text = change?[NSKeyValueChangeKey.newKey] as? String
            }
        } else if (scrollView != nil) && (scrollView! == self.webView?.scrollView) && keyPath! == "contentSize" {
            webViewScrollViewContentSize(self.webView!, self, self.webView!.scrollView, self.webView!.scrollView.contentSize)
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}


// MARK:- WKNavigationDelegate-导航监听
extension NJWebViewController: WKNavigationDelegate {
    // 1, 在发送请求之前，决定是否跳转
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Swift.Void) {
        decisionHandler(WKNavigationActionPolicy.allow)
    }
    // 3, 6, 加载 HTTPS 的链接，需要权限认证时调用  \  如果 HTTPS 是用的证书在信任列表中这不要此代理方法
    public func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
        if let trust = challenge.protectionSpace.serverTrust {
            let credential = URLCredential(trust: trust)
            completionHandler(.useCredential, credential)
        }else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
    // 4, 在收到响应后，决定是否跳转, 在收到响应后，决定是否跳转和发送请求之前那个允许配套使用
    public func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Swift.Void) {
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
    // 1-2, 接收到服务器跳转请求之后调用
    public func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
        
    }
    // 8, WKNavigation导航错误
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
    }
    //当 WKWebView 总体内存占用过大，页面即将白屏的时候，系统会调用回调函数
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        webView.reload()
    }
}
// MARK:- WKNavigationDelegate-网页监听
extension NJWebViewController {
    // 2, 页面开始加载时调用
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    // 5,内容开始返回时调用
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
    }
    // 7页面加载完成之后调用
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    // 9页面加载失败时调用
    public func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
    }
}

// MARK:- WKUIDelegate
extension NJWebViewController: WKUIDelegate {
    
}

// MARK:- btns
extension NJWebViewController {
    private func addActions() {
        backBtn.setImage(UIImage(named: "navigationButtonReturn"), for: UIControlState.normal)
        backBtn.setImage(UIImage(named: "navigationButtonReturnClick"), for: UIControlState.highlighted)
        closeBtn.setTitle("关闭", for: UIControlState.normal)
        closeBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        closeBtn.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        closeBtn.isHidden = true
        
        let leftView = UIView(frame: CGRect(x: 0, y: nj_navigationBar.frame.size.height - 44.0, width: 90, height: 44))
        leftView.addSubview(backBtn)
        leftView.addSubview(closeBtn)
        backBtn.frame = CGRect(x: 0, y: 0, width: 34.0, height: 44.0)
        closeBtn.frame = CGRect(x: leftView.frame.size.width - 44.0, y: 0, width: 44, height: 44.0)
        nj_navigationBar.addSubview(leftView)
        backBtn.addTarget(self, action: #selector(btn_back(_:)), for: UIControlEvents.touchUpInside)
        closeBtn.addTarget(self, action: #selector(btn_close(_:)), for: UIControlEvents.touchUpInside)
    }
    @objc private func btn_back(_ btn: UIButton) -> Void {
        webViewBackBtnClick(webView!, self, btn)
    }
    @objc private func btn_close(_ btn: UIButton) -> Void {
        webViewCloseBtnClick(webView!, self, btn)
    }
}

// MARK:- progressView
extension NJWebViewController {
    private func addprogressView() {
        view.addSubview(self.progressView)
        progressView.frame = CGRect(x: 0, y: nj_navigationBar.frame.size.height, width: UIScreen.main.bounds.size.width, height: 1)
        progressView.tintColor = UIColor.green
    }
}

// MARK:- NJWebViewControllerDelegate
extension NJWebViewController: NJWebViewControllerDelegate {
    public func webViewScrollViewContentSize(_ webView: WKWebView, _ controller: NJWebViewController, _ scrollView: UIScrollView, _ contentSize: CGSize) {
        print(webView, controller, scrollView, contentSize)
    }
    public func webViewBackBtnClick(_ webView: WKWebView, _ controller: NJWebViewController, _ btn: UIButton?) {
        if webView.canGoBack {
            webView.goBack()
            closeBtn.isHidden = false
        }else {
            webViewCloseBtnClick(webView, self, nil)
        }
    }
    // 判断两种情况: push 和 present
    public func webViewCloseBtnClick(_ webView: WKWebView, _ controller: NJWebViewController, _ btn: UIButton?) {
        if (navigationController?.presentedViewController != nil || navigationController?.presentingViewController != nil) && navigationController?.childViewControllers.count == 1 {
            dismiss(animated: true, completion: nil)
        }else if let navVc = navigationController {
            if navVc.childViewControllers.count > 1 {
                navVc.popViewController(animated: true)
            }
        }else if (presentationController != nil || presentedViewController != nil) {
            dismiss(animated: true, completion: nil)
        }
    }
}


