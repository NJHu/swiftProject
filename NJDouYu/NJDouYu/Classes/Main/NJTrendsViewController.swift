//
//  NJTrendsViewController.swift
//  NJDouYu
//
//  Created by HuXuPeng on 2018/5/17.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import NJKit
import NJMediator
import NJMediator_DYTrends

class NJTrendsViewController: NJViewController {

    private lazy var contentViewSize: CGSize = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - self.nj_navigationBar.frame.size.height - self.tabBarController!.tabBar.bounds.size.height)
    private lazy var scrollView: UIScrollView = UIScrollView(frame: CGRect(x: 0, y: self.nj_navigationBar.frame.size.height, width: contentViewSize.width, height: contentViewSize.height))
    override func viewDidLoad() {
        super.viewDidLoad()
        nj_isBackActionBtnHidden = true
//        nj_navigationBar.titleLabel.isHidden = true
        navigationItem.title = "直播"
        view.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.red
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize = CGSize(width: contentViewSize.width * CGFloat(self.childViewControllers.count), height: contentViewSize.height)
        if let trendsVc = NJMediator.sharedMediator.Mediator_DYTrends_MainController() {
            self.addChildViewController(trendsVc)
            scrollView.addSubview(self.childViewControllers.first!.view)
        }
        self.childViewControllers.first?.view.frame.size = contentViewSize
    }
}
