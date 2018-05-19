//
//  NJRefreshAutoNormalFooter.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/19.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import MJRefresh

class NJRefreshAutoNormalFooter: MJRefreshAutoNormalFooter {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    private func setupUI() {
        isAutomaticallyChangeAlpha = true
    }
    // MJBug fix
    override func endRefreshing() {
        super.endRefreshing()
        state = MJRefreshState.idle
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
