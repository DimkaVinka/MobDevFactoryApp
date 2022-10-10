//
//  ProfileViewController.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 04.10.2022.
//

import UIKit
import SnapKit
import Combine
import RealmSwift
import Charts

class ProfileViewController: UIViewController {

    // MARK: - Properties

    var viewModel = ProfileViewModel()
    let realm = try! Realm()
    var persons: [PersonModel]?
    var pieChart = PieChartView()

    // MARK: - Private properties

    private var observer: AnyCancellable?

    private lazy var editProfileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.addTarget(self, action: #selector(tapButtonSettingsController), for: .touchUpInside)
        return button
    }()

    // MARK: - Actions

    @objc func tapButtonSettingsController() {
        let vc = ModuleBuilder.builderCreateNewUser()
//        let navController = UINavigationController(rootViewController: DetailProfileViewController())
        self.navigationController!.pushViewController(vc, animated: true)
    }

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

        saveStudents()
        createStudents()
        setupHierarchy()
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

    func saveStudents() {
        let student = PersonModel()
        student.profileImage = UIImage(named: "noImage")!
        student.firstName = "Fedor Donskov"
        student.groupLabel = "Group 6"
        student.cityLabel = "Россия, Москва"
        student.emailLabel = "fedya_donskov@mail.ru"

        realm.beginWrite()

        realm.add(student)

        try! realm.commitWrite()
    }

    func createStudents() {
        let people = realm.objects(PersonModel.self)
        for person in people {
            let profileImage = person.profileImage
            let firstName = person.firstName
            let groupLabel = person.groupLabel
            let cityLabel = person.cityLabel
            let emailLabel = person.emailLabel

            personView?.profilePhotoImage.image = profileImage
            personView?.nameStudentsLabel.text = firstName
            personView?.numberGroupLabel.text = groupLabel
            personView?.cityLabel.text = cityLabel
            personView?.emailLabel.text = emailLabel
        }
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

    private func setupHierarchy() {
        view.addSubview(editProfileButton)

        createLayout()
    }

    private func createLayout() {
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
//            make.leading.equalTo(view.snp.leading).offset(30)
            make.trailing.equalTo(view.snp.trailing).offset(-30)
        }
    }
}

// MARK: - ChartViewDelegate

extension ProfileViewController: ChartViewDelegate {

}
