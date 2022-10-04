//
//  ProfileViewController.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 04.10.2022.
//

import UIKit
import SnapKit
import Combine
import Charts

class ProfileViewController: UIViewController {

    // MARK: - Properties

    var viewModel = ProfileViewModel()
    var persons: [Persons]?
    var pieChart = PieChartView()

    // MARK: - Private properties

    private var observer: AnyCancellable?

    // MARK: - Lifecycle

    private var personView: ProfileView? {
        guard isViewLoaded else { return nil }
        return view as? ProfileView
    }

    override func loadView() {
        view = ProfileView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pieChart.delegate = self

        observer = viewModel.$persons.sink { value in
            self.persons = value
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let defaultCGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        let defaultCGPoint = CGPoint(x: 0, y: 0)
        pieChart.frame = personView?.statisticsTableView.frame ?? defaultCGRect
        pieChart.center = personView?.statisticsTableView.center ?? defaultCGPoint
        pieChart.holeColor = Metric.colorBackround
        personView?.addSubview(pieChart)

        createChart()
    }

    private func createChart() {

        var entries = [ChartDataEntry]()

        for x in 0...4 {
            entries.append(ChartDataEntry(x: Double(x), y: Double(x)))
        }

        let set = PieChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.material()
        set.label = "Statistics"

        let data = PieChartData(dataSet: set)

        pieChart.data = data
    }
}

// MARK: - ChartViewDelegate

extension ProfileViewController: ChartViewDelegate {

}

//// MARK: - ProfileViewControllerDelegate
//
//extension ProfileViewController: ProfileViewControllerDelegate {
//    func customViewDidTapButton() {
//
//        let viewController = ModuleBuilder.builderCreateNewUser()
//        self.present(viewController, animated: true)
//
//    }
//}
