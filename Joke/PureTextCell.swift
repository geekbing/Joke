//
//  PureTextCell.swift
//  Joke
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit
import SnapKit

class PureTextCell: UITableViewCell
{
    // 笑话的内容
    var content: UILabel?
    // 更新时间
    var updatetime: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 笑话的更新时间
        updatetime = UILabel()
        updatetime?.font = font10
        updatetime?.textColor = UIColor.blackColor()
        self.contentView.addSubview(updatetime!)
        
        // 笑话的内容
        content = UILabel()
        content?.font = font15
        content?.textColor = UIColor.blackColor()
        content?.numberOfLines = 0
        self.contentView.addSubview(content!)
        
        // 布局
        // 笑话的更新时间
        updatetime?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(self.contentView).offset(8)
            make.right.equalTo(self.contentView).offset(-8)
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(30)
        })
        // 笑话的内容
        content?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(self.contentView).offset(8)
            make.right.equalTo(self.contentView).offset(-8)
            make.top.equalTo(self.contentView).offset(8)
            make.bottom.equalTo(self.updatetime!.snp_top)
        })
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