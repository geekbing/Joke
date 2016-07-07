//
//  PurePicture.swift
//  Joke
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//


import UIKit
import SVProgressHUD

class PurePicture: UIViewController
{
    var collectionView: UICollectionView!
    var dataArr = [Data]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        let layout = PurePictureLayout()
        
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - 47), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerClass(PurePictureCell.classForCoder(), forCellWithReuseIdentifier: "PurePictureCell")
        view.addSubview(collectionView)
        
        SVProgressHUD.show()
        getJokeByType(.newJokeImg, params: ["page": 1, "pagesize": 10, "key": AppKey]) { (result) in
            SVProgressHUD.showSuccessWithStatus("更新成功!")
            self.dataArr = result
            self.collectionView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

extension PurePicture: UICollectionViewDataSource
{

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return dataArr.count
    }
 
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PurePictureCell", forIndexPath: indexPath) as! PurePictureCell
        
        let object = dataArr[indexPath.item]
        cell.content?.text = object.content
        cell.updatetime?.text = object.updatetime
        cell.imgView?.sd_setImageWithURL(NSURL(string: object.url))
        
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
