//
//  AASerializable.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/19.
//  Copyright ยฉ 2017ๅนด An An . All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 *  ๐ ๐ ๐ ๐  โโโ   WARM TIPS!!!   โโโ ๐ ๐ ๐ ๐
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : https://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */


import Foundation

public protocol AAJSONRepresentable {
    var JSONRepresentation: AnyObject { get }
}

public protocol AASerializable: AAJSONRepresentable {
}

public class AAObject: AASerializable  {
}

public extension AAObject {
    var classNameString: String {
        let nameClass: AnyClass! = object_getClass(self)
        return NSStringFromClass(nameClass)
    }
}

public extension AASerializable {
    var JSONRepresentation: AnyObject {
        var representation = [String: AnyObject]()
        
        let mirrorChildren = Mirror(reflecting: self).children
        
        for case let (label?, value) in mirrorChildren {
            switch value {
            case let value as AAObject: do {
//                print("๐ฆpropery name๏ผ\(label)     property value๏ผ\(value)")
//                print("To be saved value๏ผ\(value.JSONRepresentation)")
                representation[label] = value.JSONRepresentation
                }
                
            case let value as [AAObject]: do {
//                print("l๐ฏpropery name๏ผ\(label)     property value๏ผ\(value)")
                var aaObjectArr = [AnyObject]()
                
                let valueCount = value.count
                for i in 0 ..< valueCount {
                    let aaObject = value[i]
                    let aaObjectDic = aaObject.toDic()
                    aaObjectArr.append(aaObjectDic as AnyObject)
                }
                
                representation[label] = aaObjectArr as AnyObject
                }
                
            case let value as NSObject: do {
//                  print("๐ฑpropery name๏ผ\(label)     property value๏ผ\(value)")
                representation[label] = value
                }
                
            default:
                // Ignore any unserializable properties
                break
            }
        }
        
        return representation as AnyObject
    }
}

public extension AASerializable {
    func toDic() -> [String: AnyObject]? {
        let dic = JSONRepresentation as? [String: AnyObject]
        return dic
    }
    
    func toJSON() -> String? {
        do {
            let data = try JSONSerialization.data(withJSONObject: JSONRepresentation, options: [])
            let jsonStr = String(data: data, encoding: String.Encoding.utf8)
            return jsonStr
        } catch {
            return nil
        }
    }
    
}

