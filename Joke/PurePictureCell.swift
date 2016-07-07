//
//  PurePictureCell.swift
//  Joke
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit

class PurePictureCell: UICollectionViewCell
{
    // 笑话的内容
    var content: UILabel?
    // 笑话的图片
    var imgView: UIImageView?
    // 更新的时间
    var updatetime: UILabel?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        // 笑话的更新时间
        updatetime = UILabel(frame: CGRect(x: 8, y: frame.size.height - 30, width: screenWidth - 16, height: 30))
        updatetime?.textColor = UIColor.flatGrayColor()
        updatetime?.font = font10
        self.contentView.addSubview(updatetime!)
        
        // 笑话的图片
        imgView = UIImageView(frame: CGRect(x: 8, y: frame.size.height - 30 - 200, width: screenWidth - 16, height: 200))
        self.contentView.addSubview(imgView!)
        
        // 笑话的内容
        content = UILabel(frame: CGRect(x: 8, y: 8, width: screenWidth - 16, height: frame.size.height - 30 - 200 - 8))
        content?.font = font15
        content?.textColor = UIColor.blackColor()
        self.contentView.addSubview(content!)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}