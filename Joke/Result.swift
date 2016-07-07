//
//	Result.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Result : NSObject, NSCoding{

	var data : [Data]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		data = [Data]()
		if let dataArray = dictionary["data"] as? [NSDictionary]{
			for dic in dataArray{
				let value = Data(fromDictionary: dic)
				data.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if data != nil{
			var dictionaryElements = [NSDictionary]()
			for dataElement in data {
				dictionaryElements.append(dataElement.toDictionary())
			}
			dictionary["data"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         data = aDecoder.decodeObjectForKey("data") as? [Data]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encodeWithCoder(aCoder: NSCoder)
	{
		if data != nil{
			aCoder.encodeObject(data, forKey: "data")
		}

	}

}