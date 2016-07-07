//
//  Mine.swift
//  Fun
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit

class Mine: UIViewController
{
    // 表格视图
    var tableView: UITableView!
    // titles
    var dataSource = [[["username": "Rowbi", "signature": "我就是我，颜色不一样的烟火", "avatar": "DefaultAvatar"]],
                      [["title": "我的关注", "icon": "我的关注"], ["title": "我的收藏", "icon": "Collection"], ["title": "我的领域", "icon": "我的领域"]],
                      [["title": "设置", "icon": "Setting"]]]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "我的"
        self.navigationController?.hidesNavigationBarHairline = true
        self.view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - 49 - 64), style: .Grouped)
        tableView.sectionHeaderHeight = 15
        tableView.sectionFooterHeight = 0
        tableView.backgroundColor = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1.00)
        tableView.registerClass(MineInfoCell.classForCoder(), forCellReuseIdentifier: "MineInfoCell")
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "UITableViewCell")
        tableView.separatorColor = UIColor(red:0.94, green:0.94, blue:0.96, alpha:1.00)
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

extension Mine: UITableViewDataSource
{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let section = indexPath.section
        if section == 0
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("MineInfoCell", forIndexPath: indexPath) as! MineInfoCell
            cell.avatar?.image = UIImage(named: dataSource[section][indexPath.row]["avatar"]!)
            cell.username?.text = dataSource[section][indexPath.row]["username"]
            cell.signature?.text = dataSource[section][indexPath.row]["signature"]
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as UITableViewCell
            
            cell.imageView?.image = UIImage(named: dataSource[section][indexPath.row]["icon"]!)?.imageWithRenderingMode(.AlwaysTemplate)
            cell.tintColor = mainColor
            cell.textLabel?.text = dataSource[section][indexPath.row]["title"]
            cell.textLabel?.font = font13
            cell.textLabel?.textColor = UIColor.flatBlackColor()
            cell.accessoryType = .DisclosureIndicator
            
            let rightArrow = UIImageView(frame: CGRect(x: 0, y: 0, width: 16, height: 16))
            rightArrow.image = UIImage(named: "RightArrow")?.imageWithRenderingMode(.AlwaysTemplate)
            rightArrow.tintColor = UIColor.flatWhiteColorDark()
            cell.accessoryView = rightArrow
            
            return cell
        }
    }
}

extension Mine: UITableViewDelegate
{
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 15
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        return UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 15))
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        return UIView()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        let section = indexPath.section
        if section == 0
        {
            return 60
        }
        else
        {
            return 40
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}