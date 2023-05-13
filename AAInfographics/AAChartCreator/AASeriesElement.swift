//
//  AASerializable.swift
//  AAChartKit-Swift
//
//  Created by An An  on 17/4/19.
//  Copyright © 2017年 An An . All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

 /*
 
 * -------------------------------------------------------------------------------
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

 public class AASeriesElement: AASerializable {
    private var type: String?
    private var name: String?
    private var data: [Any]?
    private var color: Any?
    private var lineWidth: Float?//折线图、曲线图、直方折线图、折线填充图、曲线填充图、直方折线填充图的线条宽度
    private var borderWidth: Float?//柱形图、条形图、扇形图等图形的描边宽度
    private var borderColor: String?//柱形图、条形图、扇形图等图形的描边颜色
    private var fillColor: Any?//折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色
    private var fillOpacity: Float?//折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色透明度 Fill opacity for the area. Note that when you set an explicit fillColor, the fillOpacity is not applied. Instead, you should define the opacity in the fillColor with an rgba color definition. 默认是：0.75. https://api.hcharts.cn/highcharts#plotOptions.area.fillOpacity
    private var threshold: Float?//The threshold, also called zero level or base level. For line type series this is only used in conjunction with negativeColor. default：0.
    private var negativeColor: String?// The color for the parts of the graph or points that are below the threshold
    private var dashStyle: String?
    private var dataLabels: [String: Any]?
    private var marker: [String: Any]?
    private var step: Any?
    private var colorByPoint: Bool?
    private var allowPointSelect: Bool?
    private var zIndex: Int?
    private var innerSize: String?//内部圆环半径大小占比(内部圆环半径/扇形图半径)

    @discardableResult
    public func type(_ prop: AAChartType) -> AASeriesElement {
        type = prop.rawValue
        return self
    }
    
    @discardableResult
    public func name(_ prop: String) -> AASeriesElement {
        name = prop
        return self
    }
    
    @discardableResult
    public func data(_ prop: [Any]) -> AASeriesElement {
        data = prop
        return self
    }
    
    @discardableResult
    public func lineWidth(_ prop: Float) -> AASeriesElement {
        lineWidth = prop
        return self
    }
    
    @discardableResult
    public func borderWidth(_ prop: Float) -> AASeriesElement {
        borderWidth = prop
        return self
    }
    
    @discardableResult
    public func borderColor(_ prop: String) -> AASeriesElement {
        borderColor = prop
        return self
    }
    
    @discardableResult
    public func fillColor(_ prop: Any) -> AASeriesElement {
        fillColor = prop
        return self
    }
    
    @discardableResult
    public func color(_ prop: Any) -> AASeriesElement {
        color = prop
        return self
    }
    
    @discardableResult
    public func fillOpacity(_ prop: Float) -> AASeriesElement {
        fillOpacity = prop
        return self
    }
    
    @discardableResult
    public func threshold(_ prop: Float) -> AASeriesElement {
        threshold = prop
        return self
    }
    
    @discardableResult
    public func negativeColor(_ prop: String) -> AASeriesElement {
        negativeColor = prop
        return self
    }
    
    @discardableResult
    public func dashStyle(_ prop: AALineDashSyleType) -> AASeriesElement {
        dashStyle = prop.rawValue
        return self
    }
    
    @discardableResult
    public func dataLabels(_ prop: [String: Any]) -> AASeriesElement {
        dataLabels = prop
        return self
    }
    
    @discardableResult
    public func marker(_ prop: [String: Any]) -> AASeriesElement {
        marker = prop
        return self
    }
    
    @discardableResult
    public func step(_ prop: Any) -> AASeriesElement {
        step = prop
        return self
    }
    
    @discardableResult
    public func colorByPoint(_ prop: Bool) -> AASeriesElement {
        colorByPoint = prop
        return self
    }
    
    @discardableResult
    public func allowPointSelect(_ prop: Bool) -> AASeriesElement {
        allowPointSelect = prop
        return self
    }
    
    @discardableResult
    public func zIndex(_ prop: Int) -> AASeriesElement {
        zIndex = prop
        return self
    }
    
    @discardableResult
    public func innerSize(_ prop: String) -> AASeriesElement {
        innerSize = prop
        return self
    }

    public  init() {
    }
}
