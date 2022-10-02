//
//  SettingsView.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 02.10.2022.
//

import UIKit
import SnapKit

class SettingsTableView: UIView {

    private var models = [Section]()

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableCell.self,
                       forCellReuseIdentifier: SettingTableCell.identifire)
        table.register(SettingSwitchTableCell.self,
                       forCellReuseIdentifier: SettingSwitchTableCell.switchIdentifire)
        return table
    }()

    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
    }

    //    override func layoutSubviews() {
    //        // Set the width of the cell
    //        self.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width - 40, height: self.bounds.size.height)
    //        super.layoutSubviews()
    //    }

    // MARK: - Private methods

    private func setupHierarchy() {
        addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupLayout() {

        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }

    // MARK: - Configuration

    func configureView(with models: [Section]) {
        self.models = models
        tableView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDelegate

extension SettingsTableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]

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
        }
    }
}

// MARK: - UITableViewDataSource

extension SettingsTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]

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
        }
    }

    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        tableView.deselectRow(at: indexPath, animated: true)
    //        let infoViewController = InfoViewController()
    //        navigationController?.pushViewController(infoViewController, animated: true)
    //    }
}
