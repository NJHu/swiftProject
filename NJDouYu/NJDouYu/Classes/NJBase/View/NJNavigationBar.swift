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
    public let titleLabel = UILabel()
    
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
        addSubview(titleLabel)
        bottomSepLineView.backgroundColor = UIColor.darkGray
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false;
//        titleLabel.backgroundColor = UIColor.yellow
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0));
        titleLabel.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.width, multiplier: 0, constant: 44))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.width, multiplier: 0.5, constant: 0))
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.top, multiplier: 1, constant: UIApplication.shared.statusBarFrame.size.height))
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bottomSepLineView.frame = CGRect(x: 0, y: frame.size.height, width: frame.size.width, height: 1.0 / UIScreen.main.scale)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesEstimatedPropertiesUpdated(_ touches: Set<UITouch>) {
        
    }
}
