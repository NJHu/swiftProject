//
//  NJNavBarViewController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJNavBarViewController: UIViewController {
    
    public let nj_navigationBar: NJNavigationBar = NJNavigationBar(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.size.width, height: 44.0 + UIApplication.shared.statusBarFrame.size.height)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nj_navigationBar)
        nj_navigationBar.isHidden = !(parent != nil && parent!.isKind(of: NJNavigationController.classForCoder()))
        nj_navigationBar.titleLabel.text = navigationItem.title != nil ? navigationItem.title : title
        navigationItem.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.bringSubview(toFront: nj_navigationBar)
    }
    
    deinit {
        navigationItem.removeObserver(self, forKeyPath: "title")
    }
}

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

// MARK:- title
extension NJNavBarViewController {
    override var title: String? {
        didSet {
            if isViewLoaded {
                nj_navigationBar.titleLabel.text = title
            }
        }
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath! == "title" {
            nj_navigationBar.titleLabel.text = change?[NSKeyValueChangeKey.newKey] as? String
        }else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}


