//
//  AppDelegate.swift
//  Joke
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        setupGlobalStyle()          // 配置全局样式
        setupGlobalData()           // 配置全局数据
        setupRootViewController()   // 配置根控制器
        setupShareSDK()             // 配置shareSDK
        
        return true
    }
    
    // 配置全局样式
    func setupGlobalStyle()
    {
        UIApplication.sharedApplication().statusBarHidden = false
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().barTintColor = mainColor
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: font18, NSForegroundColorAttributeName: UIColor.whiteColor()]
        // 设置导航条返回按钮
        let backImg = UIImage(named: "Back")?.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 30, 0, 0))
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(backImg?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal, barMetrics: .Default)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(-100.0, -100.0), forBarMetrics: UIBarMetrics.Default)
        // 配置SVProgressHUD
        // JFProgressHUD.setupHUD()
        // 配置Toast
        //        GBToastSwift.setupToast()
        
    }
    
    // 配置全局数据
    func setupGlobalData()
    {
        
    }
    
    // 配置根控制器
    func setupRootViewController()
    {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        window?.rootViewController = isNewVersion() ? Guide() : Main()
        window?.makeKeyAndVisible()
    }
    
    // 配置shareSDK
    func setupShareSDK()
    {
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

