//
//  Main.swift
//  Fun
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//
//
//  MainTabController.swift
//  Yooing
//
//  Created by Bing on 6/9/16.
//  Copyright © 2016 GeekBing. All rights reserved.
//

import UIKit

class Main: UITabBarController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 配置tabBar图标颜色
        tabBar.tintColor = mainColor
        // 配置delegate
        delegate = self
        // 添加所有子控制器
        addAllChildViewController()
    }
    
    // 添加所有子控制器
    private func addAllChildViewController()
    {
        // 纯文字笑话
        let pureTextVc = UINavigationController(rootViewController: PureText())
        addChildViewController(pureTextVc, title: "纯文", imageName: "PureText")
        
        // 最新图文笑话
        let purePictureVc = UINavigationController(rootViewController: PurePicture())
        addChildViewController(purePictureVc, title: "纯图", imageName: "PurePicture")
        
        // 我的
        let mineVc = UINavigationController(rootViewController: Mine())
        addChildViewController(mineVc, title: "我的", imageName: "Mine")
    }
    
    /**
     配置添加子控制器
     - parameter childController: 控制器
     - parameter title:           标题
     - parameter imageName:       图片
     */
    private func addChildViewController(childController: UIViewController, title: String, imageName: String)
    {
        childController.title = title
        childController.tabBarItem.title = title
        // childController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        childController.tabBarItem.setTitleTextAttributes([NSFontAttributeName: font10, NSForegroundColorAttributeName: tabbarColor], forState: .Normal)
        childController.tabBarItem.setTitleTextAttributes([NSFontAttributeName: font10, NSForegroundColorAttributeName: mainColor], forState: .Selected)
        childController.tabBarItem.image = UIImage(named: imageName)?.imageWithRenderingMode(.AlwaysTemplate)
        childController.tabBarItem.selectedImage = UIImage(named: imageName)?.imageWithRenderingMode(.AlwaysTemplate)
        addChildViewController(childController)
    }
}

extension Main: UITabBarControllerDelegate
{
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool
    {
        //        if viewController == tabBarController.viewControllers![3]
        //        {
        //            let isLogin = NSUserDefaults.standardUserDefaults().valueForKey("isLogin") as? Bool
        //            if isLogin == nil || isLogin == false
        //            {
        //                let vc = UINavigationController(rootViewController: Login())
        //                tabBarController.presentViewController(vc, animated: true, completion: nil)
        //                return false
        //            }
        //        }
        return true
    }
}

