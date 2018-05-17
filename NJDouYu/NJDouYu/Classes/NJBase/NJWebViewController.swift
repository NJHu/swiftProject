//
//  NJWebViewController.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/17.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import WebKit

class NJWebViewController: NJViewController {
    
    var webView: WKWebView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addWkWebView()
        setUpWkWebView()
    }
}

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
        
    }
}
