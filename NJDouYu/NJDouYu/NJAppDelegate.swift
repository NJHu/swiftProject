//
//  AppDelegate.swift
//  test
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit

@UIApplicationMain
class NJAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var appServices: [NJAppService] = [NJAppUIService(), NJPushService()]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // MARK:- 设置入口
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = NJTabBarController()
        return true
    }
    
}


