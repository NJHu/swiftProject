//
//  NJCategoryViewController.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/17.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJCategoryViewController: NJViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(NJCategoryViewController(), animated: true)
    }
}
