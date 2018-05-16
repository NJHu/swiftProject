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
        
        addChildViewController(NJNavigationController(rootViewController: NJViewController()))
        addChildViewController(NJNavigationController(rootViewController: NJViewController()))
        addChildViewController(NJNavigationController(rootViewController: NJViewController()))
        addChildViewController(NJNavigationController(rootViewController: NJViewController()))
    }
}

