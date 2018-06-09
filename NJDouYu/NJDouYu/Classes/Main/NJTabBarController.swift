//
//  NJTabBarController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import NJKit

public let kNJTabBarControllerDidSelectViewControllerNotification = "kNJTabBarControllerDidSelectViewControllerNotification"

class NJTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        addChildVcs()
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: kNJTabBarControllerDidSelectViewControllerNotification), object: self, userInfo: ["viewController": viewController])
    }
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

extension NJTabBarController {
    private func addChildVcs() -> Void {
        addChildVC(childController: NJTrendsViewController(), tabBartitle: "关注", image: "btn_live_normal", selImage: "btn_live_selected")
        addChildVC(childController: NJHomeViewController(), tabBartitle: "首页", image: "btn_home_normal", selImage: "btn_home_selected")
        addChildVC(childController: NJCategoryViewController(), tabBartitle: "分类", image: "btn_home_normal", selImage: "btn_home_selected")
        addChildVC(childController: NJFishBarViewController(), tabBartitle: "鱼吧", image: "btn_live_normal", selImage: "btn_live_selected")
        addChildVC(childController: NJMeViewController(tableViewStyle: UITableViewStyle.grouped), tabBartitle: "我的", image: "btn_user_normal", selImage: "btn_user_selected")
    }
    private func addChildVC(childController: UIViewController, tabBartitle: String, image: String, selImage: String) {
        childController.tabBarItem.image = UIImage(named: image)
        childController.tabBarItem.selectedImage = UIImage(named: selImage)
        childController.tabBarItem.title = tabBartitle
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3);
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.tintColor = UIColor.orange
        // 背景色
//        tabBar.barTintColor = UIColor.white
        addChildViewController(NJNavigationController(rootViewController: childController))
    }
}

