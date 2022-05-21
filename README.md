 
# AAInfographics
 
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) 
[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE)
[![](https://img.shields.io/badge/language-Swift-green.svg)](https://github.com/AAChartModel/AAChartKit-Swift) 
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift)
[![](https://img.shields.io/badge/support-OC-orange.svg)](https://github.com/AAChartModel/AAChartKit)
[![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)
[![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAChartKit-Swift)

### There is the link of **Objective-C version** of  `AAChartKit` as follow
#### *https://github.com/AAChartModel/AAChartKit*

### 中文使用说明书地址
#### *https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md*
 
***
## Features:
1. Support `iOS 6`、`ARC` & `Swift`.
2. Powerful,support the  `column chart`、`bar chart`、`area chart`、`areaspline chart`、`line chart`、`spline chart`、`radar chart`、`polar chart`、`pie chart`、`bubble chart`、`pyramid chart`、`funnel chart`、`columnrange chart`and other graphics.
3. Interactive、animated, the `animation` effect is exquisite 、delicate、 smooth and beautiful.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAInfographics,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`. 
***


## Usage:

### The need of preparation
1. Drag the folder `AAInfographics` into your project.
  

### The offical start of the work 
1.Add the following content into `your view controller` file.
```swift
import AAChartView.swift
```
2.Creat the object of chart view:`AAChartView`
```swift
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
        aaChartView?.contentHeight = self.view.frame.size.height
        self.view.addSubview(aaChartView!)
  ```
3.Configure the properties of chart model:`AAChartModel`

``` swift
        chartModel = AAChartModel.init()
            .chartTypeSet(AAChartType.Column)
            .animationTypeSet(AAChartAnimationType.Swing)
            .titleSet("TITLE")
            .subtitleSet("SUBTITLE")
            .pointHollowSet(true)
            .dataLabelEnabledSet(false)
            .markerRadiusSet(15)
            .seriesSet([
                [
                    "name": "Tokyo",
                    "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                ], [
                    "name": "New York",
                    "data": [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                ], [
                    "name": "Berlin",
                    "data": [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                ], [
                    "name": "London",
                    "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                ]])
```
4.  Draw the chart(This method is called only for the first time after you create an AAChartView instance object)

```objective-c
        //The chart view object calls the instance object of AAChartModel and draws the final graphic
        [chartView aa_drawChartWithChartModel:chartModel]
```
5.  Refresh the chart(Subsequent refresh options are recommended to call this method after the first drawing of graphics is completed)

```objective-c
        //Refresh the chart after the AAChartModel content is updated
        [chartView aa_refreshChartWithChartModel:chartModel]
```

6. Special instructions(This method is recommended to be called for updating the series data dynamically)

Pie chart and bubble chart are special in AAInfographics,if you want to draw these charts,you should do some different things for AAChartModel,for example

- To draw a pie chart,you should configure the properties of `AAChartModel` like this:
``` swift
    var chartModel = AAChartModel.init()
        chartModel.chartType = AAChartType.Pie
        chartModel.title = "BROWSER MARKET SHARES JANUARY,2020 TO MAY"
        chartModel.subtitle = "VIRTUAL DATA"
        chartModel.dataLabelEnabled = true//show the data label or not
        chartModel.series =
            [
                [
                    type: "pie",
                    name: "Browser market shares",
                    data: [
                    ["Firefox",   45.0],
                    ["IE",        26.8],
                    [
                    name:     "Chrome",
                    y:        12.8,
                    sliced:   true,
                    selected: true
                    ],
                    ["Safari",    8.5],
                    ["Opera",     6.2],
                    ["Others",    0.7]
                    ]
                ]
        ]
```
- To draw a bubble chart,you should configure the properties of `AAChartModel` like this:


``` swift
    var chartModel = AAChartModel.init()
        chartModel.chartType = AAChartType.Bubble
        chartModel.title = "AACHARTKIT BUBBLES"
        chartModel.subtitle = "JUST FOR FUN"
        chartModel.yAxisTitle = "℃"
        chartModel.series = [
            [
                "name":"DATA ARRAY ONE",
                "data": [
                    [9,  81, 63],
                    [98, 5,  89],
                    [51, 50, 73],
                    [41, 22, 14],
                    [58, 24, 20],
                    [78, 37, 34],
                    [55, 56, 53],
                    [18, 45, 70],
                    [42, 44, 28],
                    [3,  52, 59],
                    [31, 18, 97],
                    [79, 91, 63],
                    [93, 23, 23],
                    [44, 83, 22]]
                ],
            
            [
                "name":"DATA ARRAY TWO",
                "data": [
                    [42, 38, 20],
                    [6,  18, 1 ],
                    [1,  93, 55],
                    [57, 2,  90],
                    [80, 76, 22],
                    [11, 74, 96],
                    [88, 56, 10],
                    [30, 47, 49],
                    [57, 62, 98],
                    [4,  16, 16],
                    [46, 10, 11],
                    [22, 87, 89],
                    [57, 91, 82],
                    [45, 15, 98]]
                ],
            
            [
                "name":"DATA ARRAY THREE",
                "data": [
                    [47, 47, 21],
                    [20, 12, 4 ],
                    [6,  76, 91],
                    [38, 30, 60],
                    [57, 98, 64],
                    [61, 17, 80],
                    [83, 60, 13],
                    [67, 78, 75],
                    [64, 12, 10],
                    [30, 77, 82],
                    [90, 63, 44],
                    [91, 33, 17],
                    [15, 67, 48],
                    [54, 25, 81]]
            ]
        ]
```

- To draw a columnrange chart,you should configure the properties of `AAChartModel` like this:

``` swift
    var chartModel = AAChartModel.init()
        chartModel.chartType = AAChartType.Columnrange
        chartModel.title = "TEMPERATURE VARIATION BY MONTH"
        chartModel.subtitle = "OBSERVED IN GOTHAM CITY"
        chartModel.yAxisTitle = "℉"
        chartModel.series = [
                   [
            name: "Temperature",
            data: [
                [-9.7,  9.4],
                [-8.7,  6.5],
                [-3.5,  9.4],
                [-1.4, 19.9],
                [0.0,  22.6],
                [2.9,  29.5],
                [9.2,  30.7],
                [7.3,  26.5],
                [4.4,  18.0],
                [-3.1, 11.4],
                [-5.2, 10.4],
                [-9.5,  9.8]]
        ]
                    ]
```

7. Supported chart type for now 

```swift
enum AAChartType{
    case Column      = "column"      //column chart
    case Bar         = "bar"         //bar chart 
    case Area        = "area"        //area chart 
    case Areaspline  = "areaspline"  //areaspline chart
    case Line        = "line"        //line chart
    case Spline      = "spline"      //spline chart
    case Scatter     = "scatter"     //scatter chart 
    case Pie         = "pie"         //pie chart
    case Bubble      = "bubble"      //bubble chart  
    case Pyramid     = "pyramid"     //pyramid chart
    case Funnel      = "funnel"      //funnel chart
    case Columnrange = "columnrange" //columnrange chart
}
```


8. Supported animation type for now

```swift
enum AAChartAnimationType:String {
    case EaseInQuad     = "easeInQuad"
    case EaseOutQuad    = "easeOutQuad"
    case EaseInOutQuad  = "easeInOutQuad"
    case EaseInCubic    = "easeInCubic"
    case EaseOutCubic   = "easeOutCubic"
    case EaseInOutCubic = "easeInOutCubic"
    case EaseInQuart    = "easeInQuart"
    case EaseOutQuart   = "easeOutQuart"
    case EaseInOutQuart = "easeInOutQuart"
    case EaseInQuint    = "easeInQuint"
    case EaseOutQuint   = "easeOutQuint"
    case EaseInOutQuint = "easeInOutQuint"
    case EaseInSine     = "easeInSine"
    case EaseOutSine    = "easeOutSine"
    case EaseInOutSine  = "easeInOutSine"
    case EaseInExpo     = "easeInExpo"
    case EaseOutExpo    = "easeOutExpo"
    case EaseInOutExpo  = "easeInOutExpo"
    case EaseInCirc     = "easeInCirc"
    case EaseOutCirc    = "easeOutCirc"
    case EaseInOutCirc  = "easeInOutCirc"
    case EaseOutBounce  = "easeOutBounce"
    case EaseInBack     = "easeInBack"
    case EaseOutBack    = "easeOutBack"
    case EaseInOutBack  = "easeInOutBack"
    case Elastic        = "elastic"
    case SwingFromTo    = "swingFromTo"
    case SwingFrom      = "swingFrom"
    case SwingTo        = "swingTo"
    case Bounce         = "bounce"
    case BouncePast     = "bouncePast"
    case EaseFromTo     = "easeFromTo"
    case EaseFrom       = "easeFrom"
    case EaseTo         = "easeTo"
}
```
## Samples
- line chart

![IMG_1867.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1867.JPG)

- column chart

![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1483.JPG)

-   bar chart

![IMG_1880.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1880.JPG
)

-  special area chart one 

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)

-  special area chart two

![IMG_1871.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1874.JPG)


-  special area chart three

![IMG_1863.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/PictureResources/屏幕快照%202017-05-06%20下午6.58.15.png)

-   radar chart

![IMG_1877.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1877.JPG
)

-   polar chart

![IMG_1879.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1879.JPG
)
-   pie chart

![IMG_1878.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1878.JPG
)

- the oval style column chart

![IMG_1866.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1866.JPG)

- bubble chart

![IMG_1875.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1875.JPG
)

- mixed chart

![IMG_1882.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1882.JPG)

### AAChartModel:chart basic properties instruction

Property name | Property type | Description | Value Range | 
------------ | ------------- | ------------- | ------------- |
title | String | The chart title | Any valid string | 
subtitle | String |The chart subtitle  | Any valid string |
chartType | AAChartType | The default series type for the chart. Can be any of the chart types listed under `AAChartType`.  | AAChartType.Column,    AAChartType.Bar, AAChartType.Area, AAChartType.AreaSpline, AAChartType.Line,    AAChartType.Spline, AAChartType.Pie,    AAChartType.Bubble, AAChartType.Scatter, AAChartType.Pyramid, AAChartType.Funnel, AAChartType.Arearange, AAChartType.Columnrange|  AAChartType.Column |
stacking| AAChartStackingType | Whether to stack the values of each series on top of each other. Possible values are null to disable, "normal" to stack by value or "percent". When stacking is enabled, data must be sorted in ascending X order | AAChartStackingType.False, AAChartStackingType.Normal, AAChartStackingType.Percent | AAChartStackingType.False |
symbol | AAChartSymbolType | A predefined shape or symbol for the marker. When null, the symbol is pulled from options.symbols. Other possible values are "circle", "square", "diamond", "triangle" and "triangle-down" | AAChartSymbolType.Circle, AAChartSymbolType.Square, AAChartSymbolType.Diamond, AAChartSymbolType.Triangle, AAChartSymbolType.Triangle_down |  


## AAChartModel:chart all properties list
```swift
     public var animationType:String?       //The type of chart animation
     public var title:String?               //The chart title
     public var subtitle:String?            //The chart subtitle
     public var chartType:String?           //The default series type for the chart. Can be any of the chart types listed under `AAChartType`. Defaults to line
     public var stacking:String?            //Whether to stack the values of each series on top of each other. Possible values are null to disable, "normal" to stack by value or "percent". When stacking is enabled, data must be sorted in ascending X order
     public var symbol:String?              //A predefined shape or symbol for the marker. When null, the symbol is pulled from options.symbols. Other possible values are "circle", "square", "diamond", "triangle" and "triangle-down"
     public var zoomType:String?            //Decides in what dimensions the user can zoom by dragging the mouse. Can be one of x, y or xy
     public var inverted:Bool?              //Whether to invert the axes so that the x axis is vertical and y axis is horizontal. When true, the x axis is reversed by default. If a bar series is present in the chart, it will be inverted automatically.Inverting the chart doesn't have an effect if there are no cartesian series in the chart, or if the chart is polar.Defaults to false
     public var xAxisReversed:Bool?         //Whether to reverse the axis so that the highest number is closest to the origin. If the chart is inverted, the x axis is reversed by default. Defaults to false
     public var yAxisReversed:Bool?         //Whether to reverse the axis so that the highest number is closest to the origin. If the chart is inverted, the x axis is reversed by default. Defaults to false
     public var crosshairs:Bool?            //Enable or disable the crosshairs
     public var gradientColorEnable:Bool?   //Enable or disable the gradient color
     public var polar:Bool?                 //When true, cartesian charts like line, spline, area and column are transformed into the polar coordinate system. Requires `AAHighchartsMore.js`. Defaults to false
     public var dataLabelEnabled:Bool?      //Enable or disable the data labels. Defaults to false
     public var xAxisLabelsEnabled:Bool?    //Enable or disable the axis labels. Defaults to true
     public var categories:Array<Any>?      //Set new categories for the axis
     public var xAxisGridLineWidth:Int?     //The width of the grid lines extending the ticks across the plot area.Defaults to 0
     public var yAxisLabelsEnabled:Bool?    //Enable or disable the axis labels. Defaults to true
     public var yAxisTitle:String?          //The actual text of the axis title
     public var yAxisGridLineWidth:Int?     //The width of the grid lines extending the ticks across the plot area. Defaults to 1
     public var colorsTheme:Array<Any>?     //An array containing the default colors for the chart's series. When all colors are used, new colors are pulled from the start again. Defaults to:["#bb250c","#f67210","#fde680","#257679","#f1c6c5"]
     public var series:Array<Any>?          //An array of all the chart's series
     public var legendEnabled:Bool?         //Enable or disable the legend. Defaults to true
     public var legendLayout:String?        //The layout of the legend items. Can be one of "horizontal" or "vertical". Defaults to horizontal
     public var legendAlign:String?         //The horizontal alignment of the legend box within the chart area. Valid values are left, center and right.Defaults to center
     public var legendVerticalAlign:String? //The vertical alignment of the legend box. Can be one of top, middle or bottom. Vertical position can be further determined by the y option.Defaults to bottom.
     public var backgroundColor:String?     //The background color or gradient for the outer chart area. Defaults to #FFFFFF
     public var options3dEnable:Bool?       //Wether to render the chart using the 3D functionality. Defaults to false
     public var options3dAlpha:Int?         //One of the two rotation angles for the chart. Defaults to 0
     public var options3dBeta:Int?          //One of the two rotation angles for the chart. Defaults to 0
     public var options3dDepth:Int?         //The total depth of the chart. Defaults to 100
     public var borderRadius:Int?           //The corner radius of the outer chart border. Defaults to 0
     public var markerRadius:Int?           //The radius of the point marker. Defaults to 4
```


##  Created By:
An An 
``` java
 "CODE IS FAR AWAY FROM BUG WITH THE ANIMAL PROTECTING"
 
 *          ##2      ##2
 *       ┏-##1　  ┏-##1
 *    ┏_┛ ┻---━┛_┻━━┓
 *    ┃　　　        ┃　　　　 
 *    ┃　　 ━　      ┃　　　 
 *    ┃ @^　  @^    ┃　　 
 *    ┃　　　　　　  ┃
 *    ┃　　 ┻　　　 ┃
 *    ┃_　　　　　 _┃
 *     ┗━┓　　　┏━┛
 *    　　┃　　　┃神兽保佑
 *    　　┃　　　┃永无BUG！
 *    　　┃　　　┗━━━┓----|
 *    　　┃　　　　　　　  ┣┓}}}
 *    　　┃　　　　　　　  ┏┛
 *    　　┗┓&&&┓-┏&&&┓┏┛-|
 *    　　　┃┫┫　 ┃┫┫
 *    　　　┗┻┛　 ┗┻┛
 *
 *
 "CODE IS FAR AWAY FROM BUG WITH THE ANIMAL PROTECTING"
 ```

 

## LICENSE

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png)
AAInfographics is available under the MIT license. See the [LICENSE](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE) file for more information.

## Contact
 -------------------------------------------------------------------------------
* ❀❀❀   WARM TIPS!!!   ❀❀❀
*
* Please contact me on GitHub,if there are any problems encountered in use.
* GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
-------------------------------------------------------------------------------
* And if you want to contribute for this project, please contact me as well
* GitHub        : https://github.com/AAChartModel
* StackOverflow : https://stackoverflow.com/users/7842508/codeforu
* JianShu       : http://www.jianshu.com/u/f1e6753d4254
* SegmentFault  : https://segmentfault.com/u/huanghunbieguan
-------------------------------------------------------------------------------

## Postscript
If you want to shrink the size of the `AAInfographics` lib ,you should do something like this:
1. Delete the `.js` file of `AAJSFiles` folder in `AAInfographics`,The names of multiple files that need to be deleted are as follows

* AAJQueryLibrary.js 
* AAHighchartsLibrary.js
* AAHighchartsMore.js
* AAHighcharts-3d.js
* AAFunnel.js

2.Change the content of `AAChartView.html` file 
``` html
<script src="AAJQueryLibrary.js">
</script>
<script src="AAHighchartsLibrary.js">
</script>
<script src="AAHighchartsMore.js">
</script>
<script src="AAHighcharts-3d.js">
</script>
<script src="AAFunnel.js">
</script>
```
to be 

``` html
<script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
```
## Todo list
> * - [x] Support for the user to add delegate events after the graphics content loading was completed
> * - [x] Support graphics to refresh global content dynamically
> * - [x] Support graphics to refresh pure data (`series`) content dynamically
> * - [x] Support graphics to refresh pure data in real time and scroll dynamically
> * - [x] Support color layer gradient effects
> * - [x] Support 3D graphics effects, valid only for partial graphics such as `column chart`、`bar chart`、`pie charts`、`scatterplot chart`、`bubble chart`, etc
> * - [ ] Support horizontal screen (full screen) effect
> * - [ ] Support setting graphics rendering animation freely
> * - [ ] Support rendered graphics to generate image files
> * - [ ] Support generating image files saved to the system album
> * - [x] Support for users to configure `AAOptions` model object properties freely
> * - [x] Support stacking the graphics 
> * - [x] Support reversing the graphics axis 
> * - [x] Support rendering the scatter chart
> * - [x] Support rendering the column range map
> * - [x] Support rendering the area range graph
> * - [ ] Support rendering the polar chart
> * - [ ] Support rendering the polyline straight line chart
> * - [ ] Support rendering the polyline straight area chart
> * - [ ] Support rendering the rectangular tree hierarchy diagrams
> * - [ ] Support rendering the circular progress bar chart 
> * - [ ] Support adding clicked event callbacks for graphics
