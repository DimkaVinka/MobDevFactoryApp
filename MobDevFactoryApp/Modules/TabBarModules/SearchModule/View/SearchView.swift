//
//  SearchView.swift
//  MobDevFactoryApp
//
//  Created by Elena Noack on 10.09.22.
//

import UIKit

class SearchView: UIView {
    // MARK: - Properties
    
    var constraintDescriptionView = NSLayoutConstraint()
    var heightDescriptionView: CGFloat = 90
    
    // MARK: - Views
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.barTintColor = Metric.colorBackround
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск в глоссарии"
        searchController.searchBar.searchTextField.textColor = .white
        searchController.searchBar.tintColor = .white
        searchController.searchBar.searchTextField.clearButtonMode = .never
                searchController.searchBar.keyboardAppearance = .dark
        searchController.searchBar.autocapitalizationType = .none
        return searchController
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect.zero, style: .insetGrouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView?.backgroundColor = Metric.colorBackround
        tableView.tableHeaderView = searchController.searchBar
        return tableView
    }()
    
    lazy var descriptionView: UIView = {
        let view = UIView()
        view.layer.shadowColor = Metric.blueCustom.cgColor
        view.layer.shadowOpacity = 2
        view.layer.shadowOffset = CGSize(width: 8, height: 8)
        view.layer.shadowRadius = 38
        return view
    }()
    
    lazy var gradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            Metric.blueCustom.cgColor,
            Metric.violetCustom.cgColor
        ]
        gradient.startPoint = .zero
        gradient.endPoint = CGPoint(x: 0.7, y: 1)
        gradient.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        gradient.cornerRadius = 32
        return gradient
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textColor = UIColor.white
        label.numberOfLines = .zero
        label.sizeToFit()
        return label
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = Metric.colorBackround
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        addSubview(tableView)
        addSubview(descriptionView)
        addSubview(descriptionLabel)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.right.left.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(descriptionView.snp.top)
        }
        
        descriptionView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.height.equalTo(heightDescriptionView)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.center.equalTo(descriptionView)
            make.right.left.equalToSuperview()
        }
        
        constraintDescriptionView =  descriptionView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: 0)
        constraintDescriptionView.isActive = true
    }
}


