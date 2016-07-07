//
//  PureText.swift
//  Joke
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//


import UIKit
import SwiftyJSON
import SDWebImage
import SVProgressHUD
import MJRefresh

class PureText: UIViewController
{
    var tableView: UITableView!
    var dataArr = [Data]()
    
    var currentPage = 1
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "纯文"
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - 49))
        tableView.registerClass(PureTextCell.classForCoder(), forCellReuseIdentifier: "PureTextCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: .headerRefresh)
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: .footerRefresh)
        
        SVProgressHUD.show()
        getJokeByType(.newJoke, params: [
            "page": 1,      // 当前页数,默认1
            "pagesize": 10,	// 每次返回条数,默认1,最大20
            "key": AppKey	// 您申请的key
        ]) { (result) in
            SVProgressHUD.showSuccessWithStatus("更新成功")
            
            self.dataArr = result
            self.tableView.reloadData()
        }
        
    }
    
    // 下拉刷新
    func headerRefresh()
    {
        getJokeByType(.newJoke, params: [
            "page": 1,      // 当前页数,默认1
            "pagesize": 10,	// 每次返回条数,默认1,最大20
            "key": AppKey	// 您申请的key
        ]) { (result) in
            self.tableView.mj_header.endRefreshing()
            self.dataArr = result
            self.tableView.reloadData()
        }
    }
    
    // 上拉加载
    func footerRefresh()
    {
        getJokeByType(.newJoke, params: [
            "page": currentPage + 1,      // 当前页数,默认1
            "pagesize": 10,	// 每次返回条数,默认1,最大20
            "key": AppKey	// 您申请的key
        ]) { (result) in
            self.currentPage += 1
            self.tableView.mj_footer.endRefreshing()
            self.dataArr.appendContentsOf(result)
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

private extension Selector
{
    static let headerRefresh = #selector(PureText.headerRefresh)
    static let footerRefresh = #selector(PureText.footerRefresh)
}

extension PureText: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("PureTextCell", forIndexPath: indexPath) as! PureTextCell
        cell.initFrame()
        let data = dataArr[indexPath.row]
        cell.updatetime?.text = data.updatetime
        cell.content?.text = data.content
        
        return cell
    }
}

extension PureText: UITableViewDelegate
{
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let data = dataArr[indexPath.row]
        let content = data.content as NSString
        
        let contentSize = content.boundingRectWithSize(CGSize(width: screenWidth, height: 0), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(15, weight: UIFontWeightRegular)], context: nil).size
        return contentSize.height + 30 + 8
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}