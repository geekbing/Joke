//
//  Common.swift
//  Fun
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit
import ChameleonFramework

// 应用主色调
let mainColor = UIColor(red: 97.0 / 255.0, green: 197.0 / 255.0, blue: 170.0 / 255.0, alpha: 1.0)
// 底部标签栏的颜色
let tabbarColor = UIColor(red: 146.0 / 255.0, green: 146.0 / 255.0, blue: 146.0 / 255.0, alpha: 1.0)


// 屏幕长和宽
let screenWidth = UIScreen.mainScreen().bounds.size.width
let screenHeight = UIScreen.mainScreen().bounds.size.height

// 字体
let font18 = UIFont.systemFontOfSize(18, weight: UIFontWeightRegular)
let font16 = UIFont.systemFontOfSize(16, weight: UIFontWeightRegular)

let font15 = UIFont.systemFontOfSize(15, weight: UIFontWeightRegular)
let font13 = UIFont.systemFontOfSize(13, weight: UIFontWeightRegular)

let font10 = UIFont.systemFontOfSize(10, weight: UIFontWeightRegular)


// 判断是否是新版本
func isNewVersion() -> Bool
{
    // 获取当前的版本号
    let versionString = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
    let currentVersion = Double(versionString)!
    print("versionString: \(versionString)")
    
    // 获取到之前的版本号
    let sandboxVersion = NSUserDefaults.standardUserDefaults().doubleForKey("sandboxVersionKey")
    print("sandboxVersion: \(sandboxVersion)")
    
    // 保存当前版本号
    NSUserDefaults.standardUserDefaults().setDouble(currentVersion, forKey: "sandboxVersionKey")
    NSUserDefaults.standardUserDefaults().synchronize()
    
    // 对比
    return currentVersion > sandboxVersion
}
