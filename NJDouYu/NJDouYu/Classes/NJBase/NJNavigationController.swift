//
//  NJNavigationController.swift
//  NJSwiftTodayNews
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.isHidden = true
        view.backgroundColor = UIColor.groupTableViewBackground
    }
    
}
