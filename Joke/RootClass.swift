//
//	RootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class RootClass : NSObject, NSCoding{

	var errorCode : Int!
	var reason : String!
	var result : Result!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		errorCode = dictionary["error_code"] as? Int
		reason = dictionary["reason"] as? String
		if let resultData = dictionary["result"] as? NSDictionary{
			result = Result(fromDictionary: resultData)
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if errorCode != nil{
			dictionary["error_code"] = errorCode
		}
		if reason != nil{
			dictionary["reason"] = reason
		}
		if result != nil{
			dictionary["result"] = result.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         errorCode = aDecoder.decodeObjectForKey("error_code") as? Int
         reason = aDecoder.decodeObjectForKey("reason") as? String
         result = aDecoder.decodeObjectForKey("result") as? Result

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if errorCode != nil{
			aCoder.encodeObject(errorCode, forKey: "error_code")
		}
		if reason != nil{
			aCoder.encodeObject(reason, forKey: "reason")
		}
		if result != nil{
			aCoder.encodeObject(result, forKey: "result")
		}

	}

}