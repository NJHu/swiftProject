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
        getSystemGestureOfBack()
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.isHidden = true
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationBar.isHidden = true
    }
}

// MARK:- gesture
extension NJNavigationController: UIGestureRecognizerDelegate {
    private func getSystemGestureOfBack() {
        let panGes = UIPanGestureRecognizer(target: self.interactivePopGestureRecognizer?.delegate, action: Selector(("handleNavigationTransition:")))
        view.addGestureRecognizer(panGes)
        panGes.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = false
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let vc = self.childViewControllers.last as? NJNavBarViewController {
            return (self.childViewControllers.count > 1 && !vc.nj_interactivePopDisabled)
        }else {
            return false
        }
    }
}
