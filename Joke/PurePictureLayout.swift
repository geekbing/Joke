//
//  PurePictureLayout.swift
//  Joke
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit

class PurePictureLayout: UICollectionViewLayout
{
    // 内容的总尺寸
    override func collectionViewContentSize() -> CGSize
    {
        let width = collectionView!.bounds.size.width
        let height = CGFloat(collectionView!.numberOfItemsInSection(0)) * 425.0 + 49.0
        return CGSizeMake(width, height)
    }
    
    // return an array layout attributes instances for all the views in the given rect
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]?
    {
        var attributesArray = [UICollectionViewLayoutAttributes]()
        let cellCount = self.collectionView?.numberOfItemsInSection(0)
        for i in 0..<cellCount!
        {
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            let attributes = self.layoutAttributesForItemAtIndexPath(indexPath)
            attributesArray.append(attributes!)
        }
        return attributesArray
    }
    
    // 返回每个单元格的位置和大小
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
    {
        let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        // 一共1种位置
        attribute.frame = CGRectMake(0, CGFloat(indexPath.row) * 425.0, screenWidth, 425.0)
        return attribute
    }
}