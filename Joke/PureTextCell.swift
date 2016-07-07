//
//  PureTextCell.swift
//  Joke
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit

class PureTextCell: UITableViewCell
{
    // 笑话的内容
    var content: UILabel?
    // 笑话的图片
    //    var imgView: UIImageView?
    // 更新时间
    var updatetime: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func initFrame()
    {
        for view in self.contentView.subviews
        {
            view.removeFromSuperview()
        }
        
        // 笑话的更新时间
        updatetime = UILabel(frame: CGRect(x: 8, y: self.frame.size.height - 30, width: screenWidth - 16, height: 30))
        updatetime?.font = font10
        updatetime?.textColor = UIColor.blackColor()
        self.contentView.addSubview(updatetime!)
        
        // 笑话的内容
        content = UILabel(frame: CGRect(x: 8, y: 8, width: screenWidth - 16, height: self.frame.size.height - 30 - 8))
        content?.font = font15
        content?.textColor = UIColor.blackColor()
        content?.numberOfLines = 0
        self.contentView.addSubview(content!)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}