//
//  ViewController.swift
//  AAInfographicsDemo
//
//  Created by An An  on 17/4/18.
//  Copyright © 2017年 An An . All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 *********************************************************************************
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
 *********************************************************************************
 
 */

import UIKit

class AnimationTypeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    open var chartType: AAChartType?
    open var step:Bool?
    private var chartAnimationTypeArr = Array<AAChartAnimationType>()
    private var aaChartModel:AAChartModel?
    private var aaChartView:AAChartView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        chartAnimationTypeArr = [
            AAChartAnimationType.EaseInQuad,
            AAChartAnimationType.EaseOutQuad,
            AAChartAnimationType.EaseInOutQuad,
            AAChartAnimationType.EaseInCubic,
            AAChartAnimationType.EaseOutCubic,
            AAChartAnimationType.EaseInOutCubic,
            AAChartAnimationType.EaseInQuart,
            AAChartAnimationType.EaseOutQuart,
            AAChartAnimationType.EaseInOutQuart,
            AAChartAnimationType.EaseInQuint,
            AAChartAnimationType.EaseOutQuint,
            AAChartAnimationType.EaseInOutQuint,
            AAChartAnimationType.EaseInSine,
            AAChartAnimationType.EaseOutSine,
            AAChartAnimationType.EaseInOutSine,
            AAChartAnimationType.EaseInExpo,
            AAChartAnimationType.EaseOutExpo,
            AAChartAnimationType.EaseInOutExpo,
            AAChartAnimationType.EaseInCirc,
            AAChartAnimationType.EaseOutCirc,
            AAChartAnimationType.EaseInOutCirc,
            AAChartAnimationType.EaseOutBounce,
            AAChartAnimationType.EaseInBack,
            AAChartAnimationType.EaseOutBack,
            AAChartAnimationType.EaseInOutBack,
            AAChartAnimationType.Elastic,
            AAChartAnimationType.SwingFromTo,
            AAChartAnimationType.SwingFrom,
            AAChartAnimationType.SwingTo,
            AAChartAnimationType.Bounce,
            AAChartAnimationType.BouncePast,
            AAChartAnimationType.EaseFromTo,
            AAChartAnimationType.EaseFrom,
            AAChartAnimationType.EaseTo,
        ]
        
        self.setUpTheAnimationTypeTableView()
        self.setUpTheAAChartView()
    }
    
    func setUpTheAnimationTypeTableView() {
        let animationTypeTableView = UITableView()
        animationTypeTableView.frame = CGRect(x: self.view.frame.size.width-115, y: 0, width: 115, height: self.view.frame.size.height-60)
        animationTypeTableView.delegate = self
        animationTypeTableView.dataSource = self
        animationTypeTableView.backgroundColor = UIColor.white
        self.view.addSubview(animationTypeTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartAnimationTypeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellTitle = chartAnimationTypeArr[indexPath.row].rawValue
        cell.textLabel?.text = cellTitle
        cell.textLabel?.font = UIFont.systemFont(ofSize: 11)
        cell.textLabel?.textColor = UIColor.darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        aaChartModel = aaChartModel?.animationType(chartAnimationTypeArr[indexPath.row])
        aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel!)
    }
    
    func setUpTheAAChartView() {
        let chartViewWidth  = self.view.frame.size.width-115
        let screenHeight = self.view.frame.size.height-60
        
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x:0,y:60,width:chartViewWidth,height:screenHeight)
        aaChartView?.scrollEnabled = false
        self.view.addSubview(aaChartView!)

        aaChartModel = AAChartModel()
            .chartType(self.chartType!)//图形类型
            .title("都市天气")//图形标题
            .subtitle("2020年08月08日")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .markerRadius(5)//折线连接点半径长度,为0时相当于没有折线连接点
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
        
        if self.chartType == AAChartType.Area || self.chartType == AAChartType.AreaSpline {
          aaChartModel = aaChartModel?
            .gradientColorEnable(true)
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .step(self.step!)
                    .toDic()!,
                ])
        } else {
            let gradientColorDic = [
                "linearGradient": [
                    "x1": 0,
                    "y1": 0,
                    "x2": 0,
                    "y2": 1
                ],
                "stops": [[0,"rgba(138,43,226,1)"],
                          [1,"rgba(30,144,255,1)"]]//颜色字符串设置支持十六进制类型和 rgba 类型
                ] as [String : Any]
            
            aaChartModel = aaChartModel?
                .series([
                    AASeriesElement()
                        .name("Tokyo")
                        .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                        .color(gradientColorDic)
                        .step(self.step!)
                        .toDic()!,
                    ])
        }
        
        aaChartView?.aa_drawChartWithChartModel(aaChartModel!)
    }

}

