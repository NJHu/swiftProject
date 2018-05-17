//
//  NJNavigationBar.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/17.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

class NJNavigationBar: UIView {
    
    public let bottomSepLineView = UIView()
    
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
        backgroundColor = UIColor.white
        addSubview(bottomSepLineView)
        bottomSepLineView.backgroundColor = UIColor.lightGray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bottomSepLineView.frame = CGRect(x: 0, y: frame.size.height, width: frame.size.width, height: 0.5)
    }
}
