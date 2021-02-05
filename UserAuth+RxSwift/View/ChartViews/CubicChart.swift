//
//  CubicChart.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/02/04.
//

import Foundation
import Charts

class CubicChart: UIView {
    private let lineChartView = LineChartView()
    private var lineChartDataEntry: [ChartDataEntry] = []
    
    private var yAxisData = [String]()
    private var xAxisData = [String]()
    var delegate: GetChartData! {
        didSet {
            self.loadChartData()
            self.configureChart()
        }
    }
    private func loadChartData() {
        self.xAxisData = delegate.xAxisData
        self.yAxisData = delegate.yAxisData
    }
    private func configureChart() {
        self.addSubview(lineChartView)
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        lineChartView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lineChartView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lineChartView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lineChartView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInElastic)
        setLineChart(dataPoints: self.xAxisData, values: self.yAxisData)
    }
    private func setLineChart(dataPoints: [String], values: [String]) {
        lineChartView.backgroundColor = .blue
        lineChartView.noDataText = "No data"
        lineChartView.noDataTextAlignment = .center
        
        for i in 0..<dataPoints.count {
            let dataPoint = ChartDataEntry(x: Double(i), y: Double(values[i])!)
            lineChartDataEntry.append(dataPoint)
        }
        let chartDataSet = LineChartDataSet(entries: lineChartDataEntry, label: "")
        let chartData = LineChartData()
        chartData.addDataSet(chartDataSet)
        lineChartView.data = chartData
        chartDataSet.mode = .cubicBezier
        chartData.setDrawValues(false)
    }
}
