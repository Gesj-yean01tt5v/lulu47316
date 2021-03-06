//
//  AASeries.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2019/8/31.
//  Copyright Â© 2019 An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 *  ð ð ð ð  âââ   WARM TIPS!!!   âââ ð ð ð ð
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

import UIKit

public class AASeries: AAObject {
    public var borderRadius: Float?
    public var marker: AAMarker?
    public var stacking: String?
    public var animation: AAAnimation?
    public var keys: [String]?
    public var colorByPoint: Bool? //å³å®äºå¾è¡¨æ¯å¦ç»æ¯ä¸ªæ°æ®åææ¯ä¸ªç¹åéä¸ä¸ªé¢è²ï¼é»è®¤å¼æ¯ falseï¼ å³é»è®¤æ¯ç»æ¯ä¸ªæ°æ®ç±»åéé¢è²ï¼
    public var connectNulls: Bool? //è®¾ç½®æçº¿æ¯å¦æ­ç¹éè¿
    public var events: [String: Any]?
    public var shadow: AAShadow?
    
    @discardableResult
    public func borderRadius(_ prop: Float?) -> AASeries {
        borderRadius = prop
        return self
    }
    
    @discardableResult
    public func marker(_ prop: AAMarker) -> AASeries {
        marker = prop
        return self
    }
    
    @discardableResult
    public func stacking(_ prop: AAChartStackingType?) -> AASeries {
        stacking = prop?.rawValue
        return self
    }
    
    @discardableResult
    public func animation(_ prop: AAAnimation) -> AASeries {
        animation = prop
        return self
    }
    
    @discardableResult
    public func keys(_ prop: [String]) -> AASeries {
        keys = prop
        return self
    }
    
    @discardableResult
    public func colorByPoint(_ prop: Bool?) -> AASeries {
        colorByPoint = prop
        return self
    }
    
    @discardableResult
    public func connectNulls(_ prop: Bool?) -> AASeries {
        connectNulls = prop
        return self
    }
    
    @discardableResult
    public func events(_ prop: [String: Any]?) -> AASeries {
        events = prop
        return self
    }
    
    @discardableResult
    public func shadow(_ prop: AAShadow) -> AASeries {
        shadow = prop
        return self
    }
    
    public override init() {
        
    }
}


