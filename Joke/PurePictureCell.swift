//
//  PurePictureCell.swift
//  Joke
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit
import SnapKit

class PureImageCell: UICollectionViewCell
{
    // 笑话的内容
    var content: UILabel?
    // 笑话的图片
    var imgView: UIImageView?
    // 笑话的更新时间
    var updatetime: UILabel?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        // 笑话的内容
        content = UILabel()
        content?.numberOfLines = 0
        content?.font = font16
        content?.textColor = UIColor.blackColor()
        self.contentView.addSubview(content!)
        
        // 笑话的图片
        imgView = UIImageView()
        imgView?.layer.masksToBounds = true
        imgView?.contentMode = .ScaleAspectFill
        self.contentView.addSubview(imgView!)
        
        // 笑话的更新时间
        updatetime = UILabel()
        updatetime?.font = font10
        updatetime?.textColor = UIColor.blackColor()
        self.contentView.addSubview(updatetime!)
        
        // 布局
        // 笑话的更新时间
        updatetime?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(self.contentView).offset(8)
            make.right.equalTo(self.contentView).offset(-8)
            make.bottom.equalTo(self.contentView)
            make.height.equalTo(30)
        })
        
        // 笑话的图片
        imgView?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(self.contentView).offset(8)
            make.right.equalTo(self.contentView).offset(-8)
            make.bottom.equalTo(updatetime!.snp_top)
            make.height.lessThanOrEqualTo(300)
            make.height.greaterThanOrEqualTo(200)
        })
        
        // 笑话的内容
        content?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(self.contentView).offset(8)
            make.right.equalTo(self.contentView).offset(-8)
            make.top.equalTo(self.contentView).offset(8)
            make.bottom.equalTo(imgView!.snp_top)
        })
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}