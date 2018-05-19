//
//  NJNavBarViewController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJNavBarViewController: UIViewController {
    // 默认可以全局滑动返回
    public var nj_interactivePopDisabled = false
    // 是否需要隐藏返回按钮
    public var nj_isBackActionBtnHidden = false
    public let nj_navigationBar: NJNavigationBar = NJNavigationBar(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.size.width, height: 44.0 + UIApplication.shared.statusBarFrame.size.height)))
    private let nj_backBtn: UIButton = UIButton(type: UIButtonType.custom)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nj_navigationBar)
        nj_navigationBar.isHidden = !(parent != nil && parent!.isKind(of: NJNavigationController.classForCoder()))
        nj_navigationBar.titleLabel.text = navigationItem.title != nil ? navigationItem.title : title
        navigationItem.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
        nj_addBackBtn()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nj_backBtn.isHidden = nj_isBackActionBtnHidden
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
        let navigationItem = object as? UINavigationItem
        if keyPath! == "title" && (navigationItem != nil) && (navigationItem! == self.navigationItem) {
            nj_navigationBar.titleLabel.text = change?[NSKeyValueChangeKey.newKey] as? String
        }else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}

extension NJNavBarViewController {
    private func nj_addBackBtn() {
        nj_backBtn.setImage(UIImage(named: "navigationButtonReturn"), for: UIControlState.normal)
        nj_backBtn.setImage(UIImage(named: "navigationButtonReturnClick"), for: UIControlState.highlighted)
        nj_backBtn.frame = CGRect(x: 0, y: nj_navigationBar.frame.size.height - 44.0, width: 34.0, height: 44.0)
        nj_navigationBar.addSubview(nj_backBtn)
        nj_backBtn.addTarget(self, action: #selector(nj_backBtnClick(btn:)), for: UIControlEvents.touchUpInside)
    }
    @objc public func nj_backBtnClick(btn: UIButton) {
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


