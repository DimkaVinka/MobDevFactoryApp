//
//  OnboardingContentViewCell.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 20.08.2022.
//

import UIKit

class OnboardingContentViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingContentViewCell"
    
    // MARK: - Views
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.textColor = .secondaryLabel
        return label
    }()
    
    // MARK: - Initial
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Settings
    private func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupLayout() {
        
        stackView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(self.snp.leading).offset(40)
            make.trailing.equalTo(self.snp.trailing).offset(-40)
        }
        
        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(self.snp.height).multipliedBy(0.35)
        }
    }
    
    // MARK: - Configuration
    func configureView(with model: Onboarding) {
        titleLabel.text = model.title
        imageView.image = UIImage(named: model.imageName)
        descriptionLabel.text = model.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



