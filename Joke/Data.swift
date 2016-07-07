//
//	Data.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Data : NSObject, NSCoding{

	var content : String!
	var hashId : String!
	var unixtime : Int!
	var updatetime : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		content = dictionary["content"] as? String
		hashId = dictionary["hashId"] as? String
		unixtime = dictionary["unixtime"] as? Int
		updatetime = dictionary["updatetime"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if content != nil{
			dictionary["content"] = content
		}
		if hashId != nil{
			dictionary["hashId"] = hashId
		}
		if unixtime != nil{
			dictionary["unixtime"] = unixtime
		}
		if updatetime != nil{
			dictionary["updatetime"] = updatetime
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         content = aDecoder.decodeObjectForKey("content") as? String
         hashId = aDecoder.decodeObjectForKey("hashId") as? String
         unixtime = aDecoder.decodeObjectForKey("unixtime") as? Int
         updatetime = aDecoder.decodeObjectForKey("updatetime") as? String
         url = aDecoder.decodeObjectForKey("url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if content != nil{
			aCoder.encodeObject(content, forKey: "content")
		}
		if hashId != nil{
			aCoder.encodeObject(hashId, forKey: "hashId")
		}
		if unixtime != nil{
			aCoder.encodeObject(unixtime, forKey: "unixtime")
		}
		if updatetime != nil{
			aCoder.encodeObject(updatetime, forKey: "updatetime")
		}
		if url != nil{
			aCoder.encodeObject(url, forKey: "url")
		}

	}

}