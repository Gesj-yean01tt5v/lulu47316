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

class AnimationTypeVC: UIViewController {
    public var chartType: AAChartType?
    public var step: Bool?
    private var chartAnimationTypeArr = [AAChartAnimationType]()
    private var aaChartModel: AAChartModel?
    private var aaChartView: AAChartView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        chartAnimationTypeArr = [
            .easeInQuad,
            .easeOutQuad,
            .easeInOutQuad,
            .easeInCubic,
            .easeOutCubic,
            .easeInOutCubic,
            .easeInQuart,
            .easeOutQuart,
            .easeInOutQuart,
            .easeInQuint,
            .easeOutQuint,
            .easeInOutQuint,
            .easeInSine,
            .easeOutSine,
            .easeInOutSine,
            .easeInExpo,
            .easeOutExpo,
            .easeInOutExpo,
            .easeInCirc,
            .easeOutCirc,
            .easeInOutCirc,
            .easeOutBounce,
            .easeInBack,
            .easeOutBack,
            .easeInOutBack,
            .elastic,
            .swingFromTo,
            .swingFrom,
            .swingTo,
            .bounce,
            .bouncePast,
            .easeFromTo,
            .easeFrom,
            .easeTo,
        ]
        setUpTheAnimationTypeTableView()
        setUpTheAAChartView()
    }
    
    func setUpTheAnimationTypeTableView() {
        let animationTypeTableView = UITableView()
        animationTypeTableView.frame = CGRect(x: view.frame.size.width - 115,
                                              y: 0,
                                              width: 115,
                                              height: view.frame.size.height - 60)
        animationTypeTableView.delegate = self
        animationTypeTableView.dataSource = self
        animationTypeTableView.backgroundColor = UIColor.white
        view.addSubview(animationTypeTableView)
    }
    
    func setUpTheAAChartView() {
        let chartViewWidth  = view.frame.size.width - 115
        let chartViewHeight = view.frame.size.height - 60
        
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: chartViewHeight)
        aaChartView?.scrollEnabled = false
        ///AAChartViewd的内容高度(内容高度默认和 AAChartView 等高)
        aaChartView?.contentHeight = chartViewHeight - 20
        view.addSubview(aaChartView!)

        aaChartModel = AAChartModel()
            .chartType(chartType!)//图形类型
            .title("都市天气")//图形标题
            .subtitle("2020年08月08日")//图形副标题
            .dataLabelEnabled(false)//是否显示数字
            .markerRadius(5)//折线连接点半径长度,为0时相当于没有折线连接点
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
        
        if chartType == .area || chartType == .areaSpline {
          aaChartModel?
            .gradientColorEnable(true)
            .markerRadius(0)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .step(step!)
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
            
            aaChartModel?
                .series([
                    AASeriesElement()
                        .name("Tokyo")
                        .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                        .color(gradientColorDic)
                        .step(step!)
                        .toDic()!,
                    ])
        }
        
        aaChartView?.aa_drawChartWithChartModel(aaChartModel!)
    }
}

extension AnimationTypeVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chartAnimationTypeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell =  UITableViewCell.init(style: .default, reuseIdentifier: identifier)
        }
        let cellTitle = chartAnimationTypeArr[indexPath.row].rawValue
        cell.textLabel?.text = cellTitle
        cell.textLabel?.font = .systemFont(ofSize: 11)
        cell.textLabel?.textColor = .darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        aaChartModel?.animationType(chartAnimationTypeArr[indexPath.row])
        aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel!)
    }
}


