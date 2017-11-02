//
//  ChartController.swift
//  swift-benchmark-app
//
//  Created by Daniel Sogl on 20.10.17.
//  Copyright © 2017 Daniel Sogl. All rights reserved.
//

import UIKit
import Charts

class ChartController: UIViewController {
    
    //MARK: Properties

    @IBOutlet weak var lineChart: LineChartView!
    
    var valsComp1: [ChartDataEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0...1000 {
            valsComp1.append(ChartDataEntry(x: Double(i), y: Double(randomNumber(min: 0, max: 500))))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func render(_ sender: Any) {
        
        var setComp1 = LineChartDataSet(values: valsComp1, label: "Data")
        
        
//        val valsComp1 = (0..500).map { Entry(it.toFloat(), random(1, 100).toFloat()) }
//
//        val setComp1 = LineDataSet(valsComp1, "Data")
//        setComp1.axisDependency = AxisDependency.LEFT
//
//        val dataSets = ArrayList<ILineDataSet>()
//        dataSets.add(setComp1)
//
//        val data = LineData(dataSets)
//        chart.data = data
//        chart.invalidate() // refresh
    }
    
    private func randomNumber(min: Int, max: Int) -> Int {
        let randomNum = Int(arc4random_uniform(UInt32(max) - UInt32(min)) + UInt32(min))
        return randomNum
    }
    
}
