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
    
    var viewModel = RatingViewModel()
    private var observer: AnyCancellable?
    var teams: [Team]?
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewLayout()
        setupView()
        
        viewModel.loadTeams()
        observer = viewModel.$teams.sink { team in
            self.teams = team
        }
    }
    
    func setupView() {
        title = "Рейтинг"
        view.addSubview(collectionView)
        view.backgroundColor = Metric.colorBackround
        
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
    
    func configureCollectionViewLayout() {
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 170, width: view.frame.width, height: view.frame.height), collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor(red: 18 / 255, green: 14 / 255, blue: 62 / 255, alpha: 1)
        //collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        collectionView.register(FirstTypeCell.self, forCellWithReuseIdentifier: FirstTypeCell.identifier)
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnv: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .absolute(50))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = itemSize
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
            
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.9),
                heightDimension: .absolute(50))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 1
            section.boundarySupplementaryItems = [header]
            return section
        }
        return layout
    }
}

// MARK: - ViewController extension

extension RatingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return teams?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let info = teams?[indexPath.section]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstTypeCell.identifier, for: indexPath) as! FirstTypeCell
        //cell.setupCell(data: info)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let info = teams?[indexPath.section]
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
        sectionHeader.lableTitle.text = info?.teamName
        sectionHeader.lableNumber.text = String(describing: info?.teamScore ?? 0)
        sectionHeader.backgroundColor = UIColor(red: 53 / 255, green: 47 / 255, blue: 114 / 255, alpha: 1)
        sectionHeader.layer.cornerRadius = 15
        return sectionHeader
    }
}

