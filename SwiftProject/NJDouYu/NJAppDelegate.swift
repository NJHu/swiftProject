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
    
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UIApplication.shared.statusBarOrientation = .portrait
        // MARK:- 设置入口
        window?.makeKeyAndVisible()
        window?.rootViewController = NJTabBarController()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        var shouldOpen = false
        
        let resultObj = NJMediator.sharedMediator.perform(url: url) { (result: [String: AnyObject]?) in
            if result?["result"] != nil {
            }
        }
        
        shouldOpen = resultObj?.boolValue ?? false;
        
        return shouldOpen
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return window?.rootViewController?.supportedInterfaceOrientations  ?? UIInterfaceOrientationMask.allButUpsideDown;
    }
}


