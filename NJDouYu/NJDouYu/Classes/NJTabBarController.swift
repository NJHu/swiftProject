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

public let kNJTabBarControllerDidSelectViewControllerNotification = "kNJTabBarControllerDidSelectViewControllerNotification"

class NJTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.tintColor = UIColor.orange
        addChildVcs()
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNJTabBarControllerDidSelectViewControllerNotification), object: self, userInfo: ["viewController": viewController])
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return (viewController as? NJNavigationController)?.nj_tabBarShouldSelect() ?? true
    }
}


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

