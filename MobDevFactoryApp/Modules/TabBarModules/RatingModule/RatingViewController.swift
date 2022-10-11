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
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.showsVerticalScrollIndicator = false
        view.allowsMultipleSelection = true
        view.alwaysBounceVertical = true
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViewLayout()
        
        viewModel.loadTeams()
        observer = viewModel.$teams.sink { team in
            self.teams = team
        }
        
    }
    
    func configureCollectionViewLayout() {
       title = "Main"
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
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
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(44))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 5
            section.boundarySupplementaryItems = [header]
            return section
        }
        return layout
    }
}

// MARK: - ViewController extension

extension RatingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return teams?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let info = model[indexPath.section][indexPath.item]

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstTypeCell.identifier, for: indexPath) as! FirstTypeCell
            //cell.setupCell(data: info)
        cell.lableTitle.text = "Huikdid"
            return cell
        }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
        
//        let infoSection = Album.Sections.allCases[indexPath.section]
        
//        switch infoSection {
//        case .myAlbums:
        sectionHeader.lableTitle.text = "Мои альбомы"
//        case .peopleAndPlaces:
//            sectionHeader.label.text = "Люди и места"
//        case .mediaFiles:
//            sectionHeader.label.text = "Типы медиафайлов"
//            sectionHeader.lableAll?.text = nil
//        case .other:
//            sectionHeader.label.text = "Другое"
//            sectionHeader.lableAll?.text = nil
//        }
        return sectionHeader
    }
}

