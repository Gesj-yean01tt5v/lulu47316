//
//  OnlyRefreshChartDataVC.swift
//  AAInfographicsDemo
//
//  Created by An An  on 17/4/18.
//  Copyright ยฉ 2017ๅนด An An . All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 *********************************************************************************
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
 *********************************************************************************
 
 */

import UIKit

class OnlyRefreshChartDataVC: UIViewController {
    public var chartType: AAChartType?
    public var step: Bool?
    private var aaChartModel: AAChartModel?
    private var aaChartView: AAChartView?
    private var timer: Timer?
    
    private var myBasicValue:Int?
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "ONLY REFRESH CHART DATA"
        
        setUpTheAAChartView()
        setUpRefreshingChartTimer()
    }

   private func setUpTheAAChartView() {
        let chartViewWidth  = view.frame.size.width
        let chartViewHeight = view.frame.size.height - 60
        
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: chartViewHeight)
        aaChartView?.scrollEnabled = false
        ///AAChartViewd็ๅๅฎน้ซๅบฆ(ๅๅฎน้ซๅบฆ้ป่ฎคๅ AAChartView ็ญ้ซ)
        aaChartView?.contentHeight = chartViewHeight - 20
        view.addSubview(aaChartView!)
        
        aaChartModel = AAChartModel()
            .chartType(chartType!)//ๅพๅฝข็ฑปๅ
            .title("CYBERPUNK")//ๅพๅฝขๆ?้ข
            .subtitle("2077/08/08")//ๅพๅฝขๅฏๆ?้ข
            .dataLabelsEnabled(false)//ๆฏๅฆๆพ็คบๆฐๅญ
            .markerRadius(5)//ๆ็บฟ่ฟๆฅ็นๅๅพ้ฟๅบฆ,ไธบ0ๆถ็ธๅฝไบๆฒกๆๆ็บฟ่ฟๆฅ็น
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .stacking(.normal)
        
        if chartType == .area
            || chartType == .areaspline {
            let gradientColorDic = AAGradientColor.linearGradient(
                direction: .toBottom,
                startColor: "#00BFFF",
                endColor: "#00FA9A"//้ข่ฒๅญ็ฌฆไธฒ่ฎพ็ฝฎๆฏๆๅๅญ่ฟๅถ็ฑปๅๅ rgba ็ฑปๅ
            )
            
            aaChartModel?
                .markerRadius(0)
                .series([
                    AASeriesElement()
                        .name("Tokyo")
                        .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                        .color(gradientColorDic)
                        .step(step!)
                        ,
                    AASeriesElement()
                        .name("New York")
                        .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                        .step(step!)
                        ,
                    ])
            aaChartModel?.markerSymbolStyle(.innerBlank)
        } else {
            let gradientColorDic = AAGradientColor.linearGradient(
                direction: .toBottom,
                startColor: "rgba(138,43,226,1)",
                endColor: "rgba(30,144,255,1)"//้ข่ฒๅญ็ฌฆไธฒ่ฎพ็ฝฎๆฏๆๅๅญ่ฟๅถ็ฑปๅๅ rgba ็ฑปๅ
            )
            
            aaChartModel?
                .series([
                    AASeriesElement()
                        .name("Tokyo")
                        .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                        .color(gradientColorDic)
                        .step(step!)
                        ,
                    AASeriesElement()
                        .name("Berlin")
                        .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                        .step(step!)
                        ,
                    ])
            if step! != true {
                aaChartModel?.markerSymbolStyle(.borderBlank)
                .markerRadius(7)
            }
        }
        
        aaChartView?.aa_drawChartWithChartModel(aaChartModel!)
    }
    
   private func setUpRefreshingChartTimer() {
        //ๅปถๆถ3็งๆง่ก
        let time: TimeInterval = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            print("1 ็งๅ่พๅบ")
            self.timer = Timer.scheduledTimer(timeInterval: 1,
                                              target: self,
                                              selector: #selector(self.onlyRefreshTheChartData),
                                              userInfo: nil,
                                              repeats: true)
            self.timer?.fire()
        }
    }
    
    @objc func onlyRefreshTheChartData() {
        let randomNumArrA = NSMutableArray()
        let randomNumArrB = NSMutableArray()
        for  _ in 0..<12 {
            let randomA = arc4random()%20
            randomNumArrA.add(randomA)
            let randomB = arc4random()%15
            randomNumArrB.add(randomB)
        }
        
        let chartSeriesArr = [
            AASeriesElement()
                .name("2017")
                .data(randomNumArrA as! [Any])
                .toDic()!,
            AASeriesElement()
                .name("2018")
                .data(randomNumArrB as! [Any])
                .toDic()!
        ]
        
        aaChartView?.aa_onlyRefreshTheChartDataWithChartModelSeries(chartSeriesArr)
    }
    
}
    

 
 

