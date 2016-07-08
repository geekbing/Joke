//
//  PurePicture.swift
//  Joke
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit
import SVProgressHUD
import ChameleonFramework
import MJRefresh

class PurePicture: UIViewController
{
    var collectionView: UICollectionView!
    var dataArr = [Data]()
    
    // 当前显示的页数
    var currentPage = 1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 15
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.flatWhiteColor()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(PureImageCell.classForCoder(), forCellWithReuseIdentifier: "PureImageCell")
        view.addSubview(collectionView!)
        
        // 下拉刷新和上拉加载
        collectionView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: Selector.headerRefresh)
        collectionView.mj_footer = MJRefreshAutoFooter(refreshingTarget: self, refreshingAction: Selector.footerRefresh)
        
        SVProgressHUD.show()
        getJokeByType(.newJokeImg, params: ["page": 1, "pagesize": 10, "key": AppKey]) { (result) in
            SVProgressHUD.showSuccessWithStatus("更新成功")
            self.dataArr = result
            self.collectionView.reloadData()
        }
    }
    
    
    // 下拉刷新回调
    func headerRefresh()
    {
        getJokeByType(URLType.newJokeImg, params: ["page": 1, "pagesize": 10, "key": AppKey]) { (result) in
            self.collectionView.mj_header.endRefreshing()
            self.dataArr = result
            self.collectionView.reloadData()
        }
    }
    
    // 上拉加载回调
    func footerRefresh()
    {
        getJokeByType(URLType.newJokeImg, params: ["page": currentPage + 1, "pagesize": 10, "key": AppKey]) { (result) in
            self.currentPage += 1
            self.collectionView.mj_footer.endRefreshing()
            self.dataArr.appendContentsOf(result)
            self.collectionView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

private extension Selector
{
    static let headerRefresh = #selector(PurePicture.headerRefresh)
    static let footerRefresh = #selector(PurePicture.footerRefresh)
}

extension PurePicture: UICollectionViewDataSource
{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return dataArr.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PureImageCell", forIndexPath: indexPath) as! PureImageCell
        
        let data = self.dataArr[indexPath.item]
        cell.content?.text = data.content
        cell.imgView?.sd_setImageWithURL(NSURL(string: data.url))
        cell.updatetime?.text = data.updatetime
        
        return cell
    }
}

extension PurePicture: UICollectionViewDelegate
{
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }
}

extension PurePicture: UICollectionViewDelegateFlowLayout
{
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: screenWidth, height: 400)
    }
}