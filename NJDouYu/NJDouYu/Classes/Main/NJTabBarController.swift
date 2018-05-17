//
//  NJTabBarController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVcs()
    }
}

extension NJTabBarController {
    private func addChildVcs() -> Void {
        addChildVC(childController: NJViewController(), tabBartitle: "首页", image: "btn_home_normal", selImage: "btn_home_selected")
        addChildVC(childController: NJViewController(), tabBartitle: "分类", image: "btn_home_normal", selImage: "btn_home_selected")
        addChildVC(childController: NJViewController(), tabBartitle: "关注", image: "btn_live_normal", selImage: "btn_live_selected")
        addChildVC(childController: NJViewController(), tabBartitle: "鱼吧", image: "btn_live_normal", selImage: "btn_live_selected")
        addChildVC(childController: NJTableViewController(tableViewStyle: UITableViewStyle.grouped), tabBartitle: "我的", image: "btn_user_normal", selImage: "btn_user_selected")
    }
    private func addChildVC(childController: UIViewController, tabBartitle: String, image: String, selImage: String) {
        childController.tabBarItem.image = UIImage(named: image)
        childController.tabBarItem.selectedImage = UIImage(named: selImage)
        childController.tabBarItem.title = tabBartitle
        childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3);
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.tintColor = UIColor.orange
        addChildViewController(NJNavigationController(rootViewController: childController))
    }
}

