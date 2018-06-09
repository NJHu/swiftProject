//
//  AppDelegate.swift
//  test
//
//  Created by HuXuPeng on 2018/5/15.
//  Copyright © 2018年 njhu. All rights reserved.
//

import UIKit
import NJKit
import NJMediator

@UIApplicationMain
class NJAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // MARK:- 设置入口
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = NJTabBarController()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        var shouldOpen = true
        
        _ = NJMediator.sharedMediator.perform(url: url) { (result: [String: AnyObject]?) in
            if result?["error"] != nil {
                shouldOpen = false
            }
        }
        
        return shouldOpen
    }
}


