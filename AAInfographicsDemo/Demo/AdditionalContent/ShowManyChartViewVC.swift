//
//  ShowManyChartViewVC.swift
//  AAInfographicsDemo
//
//  Created by An An on 2017/11/6.
//  Copyright Β© 2017εΉ΄ An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 *********************************************************************************
 *
 *  π π π π  βββ   WARM TIPS!!!   βββ π π π π
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

class ShowManyChartViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "εζΆζΎη€Ίε€δΈͺεΎθ‘¨"
        view.backgroundColor = .white
        
        setUpTheAAChartViewOne()
        setUpTheAAChartViewTwo()
        
    }
    
   private func setUpTheAAChartViewOne() {
        let chartViewWidth  = view.frame.size.width
        let screenHeight = view.frame.size.height - 60
        
        let aaChartView = AAChartView()
        aaChartView.frame = CGRect(x: 0,
                                   y: 60,
                                   width: chartViewWidth,
                                   height: screenHeight / 2)
        aaChartView.scrollEnabled = false
        aaChartView.contentHeight = (screenHeight / 2) - 20
        view.addSubview(aaChartView)
        
        let  aaChartModel = AAChartModel()
            .chartType(.bar)//εΎε½’η±»ε
            .animationType(.bounce)//εΎε½’ζΈ²ζε¨η»η±»εδΈΊ"bounce"
            .title("ι½εΈε€©ζ°")//εΎε½’ζ ι’
            .subtitle("2020εΉ΄08ζ08ζ₯")//εΎε½’ε―ζ ι’
            .dataLabelsEnabled(false)//ζ―ε¦ζΎη€Ίζ°ε­
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .stacking(.percent)
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    ,
                AASeriesElement()
                    .name("New York")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    ,
                AASeriesElement()
                    .name("Berlin")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                    ,
                AASeriesElement()
                    .name("London")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                    ,])
        
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
        
    }
    
   private func setUpTheAAChartViewTwo() {
        let chartViewWidth  = view.frame.size.width
        let screenHeight = view.frame.size.height - 60
        
        let aaChartView2 = AAChartView()
        aaChartView2.frame = CGRect(x:0,
                                    y:screenHeight / 2 + 60,
                                    width:chartViewWidth,
                                    height:screenHeight / 2)
        aaChartView2.scrollEnabled = false
        view.addSubview(aaChartView2)
        
        let  aaChartModel2 = AAChartModel()
            .chartType(.area)//εΎε½’η±»ε
            .animationType(.bounce)//εΎε½’ζΈ²ζε¨η»η±»εδΈΊ"bounce"
            .title("ι½εΈε€©ζ°")//εΎε½’ζ ι’
            .subtitle("2020εΉ΄08ζ08ζ₯")//εΎε½’ε―ζ ι’
            .dataLabelsEnabled(false)//ζ―ε¦ζΎη€Ίζ°ε­
            .markerRadius(4)//ζηΊΏθΏζ₯ηΉεεΎιΏεΊ¦,δΈΊ0ζΆηΈε½δΊζ²‘ζζηΊΏθΏζ₯ηΉ
            .markerSymbolStyle(.innerBlank)
            .legendEnabled(true)
            .tooltipEnabled(false)
            .categories([
                "ε­€<br>ε²<br>ε±<br>ζΊ",
                "δ½Ώ<br>ε½<br>ε¬<br>ε€",
                "θ£<br>θͺ<br>ε<br>η« ",
                "η<br>ε»<br>η²Ύ<br>θ±",
                "η₯<br>η§<br>ζ΅·<br>ε",
                "ζ<br>ε<br>η<br>θΏ<br>θ",
                "ε·«<br>εΈ<br>3<br>η<br>η",
                "ε―Ή<br>ι©¬<br>δΉ<br>ι­",
                "θ<br>θ <br>δΎ <br>ιΏ<br>η<br>ιͺ<br>ε£«<br> .",
                "ε°<br>η±<br>θΎΉ<br>ε’",
                "ιͺ<br>ε?’",
                "εΏ<br>θ<br>δΉ<br>ε°"
                ])
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    ,
                AASeriesElement()
                    .name("New York")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    ,
                AASeriesElement()
                    .name("Berlin")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                    ,
                AASeriesElement()
                    .name("London")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                    ,])
        
        aaChartView2.aa_drawChartWithChartModel(aaChartModel2)

    }
 
 }
