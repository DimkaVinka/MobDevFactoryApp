////
////  PersonViewController.swift
////  MobDevFactoryApp
////
////  Created by Daniil Litvinov on 10.08.2022.
////
//
//import UIKit
//import Charts
//
//protocol ProfileViewControllerDelegate: AnyObject {
//    func customViewDidTapButton()
//}
//
//final class PersonViewController: UIViewController {
//
//    let profileView = PersonView()
//    var pieChart = PieChartView()
//    
//    // MARK: - Lifecycle
//    
//    override func loadView() {
//        super.loadView()
//        profileView.delegate = self
//        self.view = profileView
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        pieChart.delegate = self
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        pieChart.frame = profileView.statisticsTableView.frame
//        pieChart.center = profileView.statisticsTableView.center
//        pieChart.holeColor = Metric.colorBackround
//        profileView.addSubview(pieChart)
//        
//        createChart()
//    }
//    
//    private func createChart() {
//        
//        var entries = [ChartDataEntry]()
//
//        for x in 0...4 {
//            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
//        }
//
//        let set = PieChartDataSet(entries: entries)
//        set.colors = ChartColorTemplates.material()
//        set.label = "Statistics"
//
//        let data = PieChartData(dataSet: set)
//
//        pieChart.data = data
//    }
//}
//
//// MARK: - ChartViewDelegate
//
//extension PersonViewController: ChartViewDelegate {
//    
//}
//
//// MARK: - ProfileViewControllerDelegate
//
//extension PersonViewController: ProfileViewControllerDelegate {
//    func customViewDidTapButton() {
//        
//        let viewController = ModuleBuilder.builderCreateNewUser()
//        self.present(viewController, animated: true)
//        
//    }
//}
//
