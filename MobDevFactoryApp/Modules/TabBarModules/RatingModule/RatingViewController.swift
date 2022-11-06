//
//  File.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 07.10.2022.
//

import UIKit
import SnapKit
import Combine


class RatingViewController: UIViewController {
    
    // MARK: - Properties
    var teams: [Team]?
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<SectionCollection, ListItem>!
    var snapshot: NSDiffableDataSourceSnapshot<SectionCollection, Student>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        loadTeams()
        
        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        layoutConfig.backgroundColor = UIColor(red: 15 / 255, green: 20 / 255, blue: 59 / 255, alpha: 1)
        
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        //listLayout.collectionView?.collectionViewLayout = UICollectionViewCompositionalLayout(section: section)
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
        
        let headerCellRegistration = UICollectionView.CellRegistration<SectionHeader, Team> {
            (cell, indexPath, headerItem) in
            cell.lableNumber.text = "\(headerItem.teamScore)"
            cell.lableTitle.text = headerItem.teamName
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = UIColor(red: 53 / 255, green: 47 / 255, blue: 114 / 255, alpha: 1)
            backgroundConfig.cornerRadius = 10
            backgroundConfig.backgroundInsets = .init(top: 3, leading: 0, bottom: 3, trailing: 0)
            cell.backgroundConfiguration = backgroundConfig
            
            var headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions()
            headerDisclosureOption.style = .header
            headerDisclosureOption.tintColor = .white
            cell.accessories = [.outlineDisclosure(options: headerDisclosureOption)]
        }
        
        let bodyCellRegistration = UICollectionView.CellRegistration<CellType, Student> {
            (cell, indexPath, bodyItem) in
        
            cell.studentName.text = "\(bodyItem.name) \(bodyItem.lastname)"
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = UIColor(red: 43 / 255, green: 37 / 255, blue: 99 / 255, alpha: 1)
            cell.backgroundConfiguration = backgroundConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource<SectionCollection, ListItem>(collectionView: collectionView) {
            (collectionView, indexPath, listItem) -> UICollectionViewCell? in
            
            switch listItem {
            case .header(let headerItem):
                let cell = collectionView.dequeueConfiguredReusableCell(using: headerCellRegistration,
                                                                        for: indexPath,
                                                                        item: headerItem)
                return cell
            case .body(let bodyItem):
                let cell = collectionView.dequeueConfiguredReusableCell(using: bodyCellRegistration,
                                                                        for: indexPath,
                                                                        item: bodyItem)
                return cell
            }
        }
        
        var dataSourceSnapshot = NSDiffableDataSourceSnapshot<SectionCollection, ListItem>()
        
        dataSourceSnapshot.appendSections([.main])
        dataSource.apply(dataSourceSnapshot)
        
        var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<ListItem>()
        
        guard let unrwappedTeams = teams else { return }
        for headerItem in unrwappedTeams {
            let headerList = ListItem.header(headerItem)
            sectionSnapshot.append([headerList])
            
            let studentsArray = headerItem.team.map { ListItem.body($0) }
            sectionSnapshot.append(studentsArray, to: headerList)
        }
        dataSource.apply(sectionSnapshot, to: .main, animatingDifferences: false)
    }
    
    func loadTeams() {
        if let fileLocation = Bundle.main.url(forResource: "students", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                let dataFromeJson = try decoder.decode(Teams.self, from: data)
                self.teams = dataFromeJson.teams
            } catch {
                print(error)
            }
        }
    }
    
    
    func setupView() {
        title = "Рейтинг"
        
        view.backgroundColor = UIColor(red: 15 / 255, green: 20 / 255, blue: 59 / 255, alpha: 1)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 15 / 255, green: 20 / 255, blue: 59 / 255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
    }
    
    func setupLayout() {
        
    }
}


