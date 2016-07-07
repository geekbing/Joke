//
//  MineInfoCell.swift
//  Yooing
//
//  Created by Bing on 6/19/16.
//  Copyright © 2016 GeekBing. All rights reserved.
//

import UIKit

class MineInfoCell: UITableViewCell
{
    // 头像
    var avatar: UIImageView?
    // 用户名
    var username: UILabel?
    // 签名
    var signature: UILabel?
    
    override init(style:UITableViewCellStyle, reuseIdentifier:String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 头像
        avatar = UIImageView(frame: CGRect(x: 15, y: 10, width: 40, height: 40))
        self.addSubview(avatar!)
        
        // 用户名
        username = UILabel(frame: CGRect(x: 70, y: 0, width: screenWidth - 100, height: 40))
        username?.font = font16
        self.addSubview(username!)
        
        // 签名
        signature = UILabel(frame: CGRect(x: 70, y: 25, width: screenWidth - 100, height: 25))
        signature?.font = font10
        signature?.textColor = UIColor.flatBlackColor()
        self.addSubview(signature!)
        
        // 右边的箭头
        let rightArrow = UIImageView(frame: CGRectMake(screenWidth - 30, 30 - 8 , 16, 16))
        rightArrow.image = UIImage(named: "RightArrow")?.imageWithRenderingMode(.AlwaysTemplate)
        rightArrow.tintColor = UIColor.flatWhiteColorDark()
        self.addSubview(rightArrow)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
