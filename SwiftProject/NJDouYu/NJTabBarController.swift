//
//  NJTabBarController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import NJKit
import NJMediator
import NJMediator_DYTrends
import NJMediator_DYLiveShow
import NJMediator_NJNowShow
import NJMediator_NJSisVideoList

class NJTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.tintColor = UIColor.orange
        addChildVcs()
    }
}

// MARK:- UITabBarControllerDelegate
extension NJTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNJTabBarControllerDidSelectViewControllerNotification), object: self, userInfo: ["viewController": viewController])
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

// MARK:- UITabBarDelegate
extension NJTabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //        super.tabBar(tabBar, didSelect: item)
    }
}


// MARK: - 添加模块
extension NJTabBarController {
    private func addChildVcs() -> Void {
        // 直播列表
        if let nav0 = NJMediator.sharedMediator.Mediator_DYLiveShow_MainController() {
            self.addChildViewController(nav0)
        }
        // 个人偏好
        //  if let nav1 = NJMediator.sharedMediator.Mediator_DYTrends_MainController() {
        //  self.addChildViewController(nav1)
        // }
        // NowShow列表
        if let nav2 = NJMediator.sharedMediator.Mediator_NJNowShow_MainController() {
            self.addChildViewController(nav2)
        }
        // 视频列表
        if let nav3 = NJMediator.sharedMediator.Mediator_NJSisVideoList_MainController() {
            self.addChildViewController(nav3)
        }
    }
}

// MARK:- statusBar
extension NJTabBarController {
    open override var prefersStatusBarHidden: Bool {
        return self.selectedViewController?.prefersStatusBarHidden ?? false
    }
    open  override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.selectedViewController?.preferredStatusBarStyle ?? UIStatusBarStyle.default
    }
    open  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return self.selectedViewController?.preferredStatusBarUpdateAnimation ?? UIStatusBarAnimation.slide
    }
    open override var shouldAutorotate: Bool {
        return self.selectedViewController?.shouldAutorotate ?? false
    }
    // MARK: - about keyboard orientation
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return self.selectedViewController?.supportedInterfaceOrientations ?? UIInterfaceOrientationMask.allButUpsideDown;
    }
    //返回最优先显示的屏幕方向
    open override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return self.selectedViewController?.preferredInterfaceOrientationForPresentation ?? UIInterfaceOrientation.portrait
    }
}

