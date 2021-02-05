//
//  CryptoHomePageController.swift
//  UserAuth+RxSwift
//
//  Created by frank on 2021/02/01.
//

import UIKit
import Charts
import CocoaLumberjack

protocol GetChartData {
    func getChartData(with dataPoints: [String], values: [String])
    var yAxisData: [String] { get set }
    var xAxisData: [String] { get set }
}
class CryptoHomePageViewController: UIViewController, Storyboarded, GetChartData {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var pickerView: UIView!
    @IBOutlet weak var diffValue: UILabel!
    @IBOutlet weak var totalBalance: UILabel!
    weak var coordinator: MainCoordinator?
    var yAxisData = [String]()
    var xAxisData = [String]()
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillChartWithData()
        self.lineChart()
    }
    func getChartData(with dataPoints: [String], values: [String]) {
        xAxisData = dataPoints
        yAxisData = values
    }
    func fillChartWithData() {
        self.xAxisData = ["1","3","5","76","64","90"]
        self.yAxisData = ["120","200","45","87","28","50","70"]
        self.getChartData(with: xAxisData, values: yAxisData)
    }
    func lineChart() {
        let lineChart = CubicChart(frame: CGRect(x: 0.0, y: 0.0, width: self.chartView.bounds.size.width, height: self.chartView.bounds.size.height))
        lineChart.delegate = self
        self.chartView.addSubview(lineChart)
    }
}
