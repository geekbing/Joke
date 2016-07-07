
//
//  API.swift
//  Fun
//
//  Created by Bing on 7/7/16.
//  Copyright © 2016 Bing. All rights reserved.
//


import UIKit
import Alamofire

// 聚合数据AppKey
let AppKey = "6bf8cf3ff79ce13de5da38c932c52ba5"

enum URLType
{
    // 按更新时间查询笑话
    case timeUpdateJoke
    
    // 最新笑话
    case newJoke
    
    // 按更新时间查询趣图
    case timeUpdatJokeImg
    
    // 最新趣图
    case newJokeImg
    
    // 随机获取趣图/笑话
    case randJoke
}

// 根据笑话的请求类型获取笑话请求地址
func getURLByType(type: URLType) -> String
{
    var url: String
    switch type
    {
        case .timeUpdateJoke:
            url = "http://japi.juhe.cn/joke/content/list.from"
            break
        case .newJoke:
            url = "http://japi.juhe.cn/joke/content/text.from"
            break
        case .timeUpdatJokeImg:
            url = "http://japi.juhe.cn/joke/img/list.from"
            break
        case .newJokeImg:
            url = "http://japi.juhe.cn/joke/img/text.from"
            break
        case .randJoke:
            url = "http://v.juhe.cn/joke/randJoke.php"
            break
    }
    return url
}

// 根据笑话请求类型获取笑话
func getJokeByType(type: URLType, params: [String: AnyObject], callBack: (result: [Data]) -> ())
{
    Alamofire.request(.GET, getURLByType(type), parameters: params).responseJSON { (response) in
        switch response.result
        {
            case .Success:
                if let dict = response.result.value as? NSDictionary
                {
                    let root = RootClass(fromDictionary: dict)
                    callBack(result: root.result.data)
                }
            case .Failure(let error):
                print(error)
        }
    }
}

//// 根据更新时间获取笑话
//func getJokeByTime(sort: String, page: Int, pagesize: Int, time: String, key: String, callBack: () -> ())
//{
//    let url = "http://japi.juhe.cn/joke/content/list.from"
//
//    //请求的参数
//    let params: [String: AnyObject] = [
//        "sort": sort,
//        "page": page,
//        "pagesize": pagesize,
//        "time": time,
//        "key": key
//    ]
//    Alamofire.request(.GET, url, parameters: params, encoding: .URL).responseJSON { (response) in
//        switch response.result
//        {
//            case .Success:
//                print(response.result.value!)
//            case .Failure(let error):
//                print(error)
//        }
//    }
//}