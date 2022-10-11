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

    // MARK: - Properties

    var viewModel = SettingsViewModel()
    var sections: [Section]?

    // MARK: - Private properties

    private var observer: AnyCancellable?

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки"
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()

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
        viewModel.createModel()

        observer = viewModel.$sections.sink { value in
            self.sections = value
        }

        setupHierarchy()
        setupLayout()
    }

    // MARK: - Private methods

    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupLayout() {

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.leading.equalTo(view.snp.leading).offset(20)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = sections?[indexPath.section].options[indexPath.row]

        switch type.self {
        case .staticCell(let model):
            print("Нажата ячейка \(model.title)")

            if model.title == "Аккаунт" {
                let profileUserController = ProfileViewController()
                navigationController?.pushViewController(profileUserController, animated: true)
            }

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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableCell.identifire, for: indexPath) as? SettingTableCell
            else { return UITableViewCell() }

            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true

            cell.configure(with: model)
            return cell

        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingSwitchTableCell.switchIdentifire, for: indexPath) as? SettingSwitchTableCell
            else { return UITableViewCell() }

            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true

            cell.configure(with: model)
            return cell
        case .none:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell
            else { return UITableViewCell() }
            return cell
        }
    }
}
