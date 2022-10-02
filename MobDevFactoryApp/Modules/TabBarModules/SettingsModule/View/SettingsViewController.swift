//
//  SettingsViewController.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 02.10.2022.
//

import UIKit
import SnapKit
import Combine

class SettingsViewController: UIViewController {

    var viewModel = SettingsViewModel()
    var sections: [Section]?
    private var observer: AnyCancellable?

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableCell.self,
                       forCellReuseIdentifier: SettingTableCell.identifire)
        table.register(SettingSwitchTableCell.self,
                       forCellReuseIdentifier: SettingSwitchTableCell.switchIdentifire)
        return table
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Настройки"

        viewModel.createModel()

        observer = viewModel.$sections.sink { value in
            self.sections = value
        }

//        configureView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Private methods

    private func setupHierarchy() {
        view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupLayout() {

        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = sections?[indexPath.section].options[indexPath.row]

        //        tableView.deselectRow(at: indexPath, animated: true)
        //        let infoViewController = InfoViewController()
        //        infoViewController = models[indexPath.section].options[indexPath.row]
        //        navigationController?.pushViewController(infoViewController, animated: true)

        switch type.self {
        case .staticCell(let model):
            print("Нажата ячейка \(model.title)")
            model.handler()
        case .switchCell(let model):
            print("Нажата ячейка \(model.title)")
            model.handler()
        case .none:
            print("Error")
        }
    }
}

// MARK: - UITableViewDataSource

extension SettingsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = sections?[section]
        return section?.title
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        sections?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections?[section].options.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections?[indexPath.section].options[indexPath.row]

        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableCell.identifire,
                for: indexPath
            ) as? SettingTableCell else {
                return UITableViewCell()
            }

            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true

            cell.configure(with: model)
            return cell

        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingSwitchTableCell.switchIdentifire,
                for: indexPath
            ) as? SettingSwitchTableCell else {
                return UITableViewCell()
            }

            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true

            cell.configure(with: model)
            return cell
        case .none:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "cell",
                for: indexPath
            ) as? UITableViewCell else {
                return UITableViewCell()
            }
            return cell
            print("cellForRowAt Error")
        }
    }

    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        tableView.deselectRow(at: indexPath, animated: true)
    //        let infoViewController = InfoViewController()
    //        navigationController?.pushViewController(infoViewController, animated: true)
    //    }
}

