//
//  PersonView.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 17.08.2022.
//

//import UIKit
//import SnapKit
//
//class PersonView: UIView {
//    
//    weak var delegate: PersonViewController?
//
//    // MARK: - UI Elements
//
//    private lazy var indicatorOnOffImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "on")
//        image.contentMode = .center
//        return image
//    }()
//    
//    private lazy var bigNameLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = .systemFont(ofSize: 24, weight: .bold)
//        label.text = "Федор Донсков"
//        return label
//    }()
//    
//    private lazy var firstTopBarStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 5
//        return stackView
//    }()
//    
//    private lazy var profileEditingButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "edit"), for: .normal)
//        button.addTarget(self, action: #selector(tapButtonSettingsController), for: .touchUpInside)
//        return button
//    }()
//    
//    @objc func tapButtonSettingsController() {
//        delegate?.customViewDidTapButton(self)
//    }
//
//    private lazy var profilePhotoImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "noImage")
//        image.contentMode = .scaleAspectFill
//        image.backgroundColor = .systemOrange
//        image.layer.masksToBounds = true
//        image.layer.cornerRadius = 20
//        return image
//    }()
//    
//    private lazy var createStatusLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = .systemFont(ofSize: 16, weight: .bold)
//        label.text = "I am studying ios development"
//        label.numberOfLines = 0
//        return label
//    }()
//    
//    private lazy var numberGroupImage: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFit
//        image.image = UIImage(named: "group")
//        return image
//    }()
//    
//    private lazy var numberGroupLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = .systemFont(ofSize: 15)
//        label.text = "Group 6"
//        return label
//    }()
//    
//    private lazy var groupImageLableStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 5
//        return stackView
//    }()
//    
//    private lazy var cityImage: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFit
//        image.image = UIImage(named: "location")
//        return image
//    }()
//    
//    private lazy var cityLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = .systemFont(ofSize: 14)
//        label.text = "Россия, Москва"
//        return label
//    }()
//    
//    private lazy var cityImageLableStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 5
//        return stackView
//    }()
//    
//    private lazy var mailImage: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFit
//        image.image = UIImage(named: "mail")
//        return image
//    }()
//    
//    private lazy var mailLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = .systemFont(ofSize: 14)
//        label.text = "fedya_donskov@mail.ru"
//        return label
//    }()
//    
//    private lazy var mailImageLableStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 5
//        return stackView
//    }()
//    
//    // Location Mail StackView
//    private lazy var cityAndMailStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .leading
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 6
//        return stackView
//    }()
//    
//    private lazy var calendarImage: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFit
//        image.image = UIImage(named: "calendar")
//        return image
//    }()
//    
//    private lazy var dateDescriptionLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.font = .systemFont(ofSize: 14)
//        label.text = Date().longDate
//        return label
//    }()
//    
//    private lazy var dateImageLableStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .fillProportionally
//        stackView.spacing = 5
//        return stackView
//    }()
//    
//    private lazy var firstLineView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .lightGray
//        return view
//    }()
//    
//    lazy var statisticsTableView: UIView = {
//        let view = UIView()
//        return view
//    }()
//    
//    // MARK: - Iniialization
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupHierarchy()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Peivate methods
//    
//    private func setupHierarchy() {
//        addSubview(firstTopBarStackView)
//        addSubview(profileEditingButton)
//        addSubview(profilePhotoImage)
//        addSubview(createStatusLabel)
//        addSubview(cityAndMailStackView)
//        addSubview(firstLineView)
//        addSubview(statisticsTableView)
//        
//        firstTopBarStackView.addArrangedSubview(indicatorOnOffImage)
//        firstTopBarStackView.addArrangedSubview(bigNameLabel)
//        
//        cityImageLableStackView.addArrangedSubview(cityImage)
//        cityImageLableStackView.addArrangedSubview(cityLabel)
//        
//        mailImageLableStackView.addArrangedSubview(mailImage)
//        mailImageLableStackView.addArrangedSubview(mailLabel)
//        
//        groupImageLableStackView.addArrangedSubview(numberGroupImage)
//        groupImageLableStackView.addArrangedSubview(numberGroupLabel)
//        
//        dateImageLableStackView.addArrangedSubview(calendarImage)
//        dateImageLableStackView.addArrangedSubview(dateDescriptionLabel)
//        
//        cityAndMailStackView.addArrangedSubview(dateImageLableStackView)
//        cityAndMailStackView.addArrangedSubview(groupImageLableStackView)
//        cityAndMailStackView.addArrangedSubview(cityImageLableStackView)
//        cityAndMailStackView.addArrangedSubview(mailImageLableStackView)
//        
//        setupView()
//        setupLayout()
//    }
//    
//    private func setupView() {
//        backgroundColor = Metric.colorBackround
//    }
//    
//    // MARK: - Constraints
//    
//    private func setupLayout() {
//        firstTopBarStackView.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(40)
//            make.trailing.equalTo(profileEditingButton.snp.leading).offset(30)
//            make.leading.equalTo(self.snp.leading).offset(30)
//        }
//        
//        profileEditingButton.snp.makeConstraints { make in
//            make.top.equalTo(firstTopBarStackView.snp.top)
//            make.trailing.equalTo(self.snp.trailing).offset(-30)
//            make.width.equalTo(60)
//        }
//        
//        profilePhotoImage.snp.makeConstraints { make in
//            make.top.equalTo(firstTopBarStackView.snp.bottom).offset(20)
//            make.leading.equalTo(firstTopBarStackView.snp.leading)
//            make.height.equalTo(160)
//            make.width.equalTo(130)
//        }
//        
//        createStatusLabel.snp.makeConstraints { make in
//            make.top.equalTo(profilePhotoImage.snp.top)
//            make.leading.equalTo(profilePhotoImage.snp.trailing).offset(20)
//            make.trailing.equalTo(profileEditingButton.snp.trailing)
//        }
//        
//        cityAndMailStackView.snp.makeConstraints { make in
//            make.top.equalTo(createStatusLabel.snp.bottom).offset(15)
//            make.leading.equalTo(createStatusLabel.snp.leading)
//            make.trailing.equalTo(createStatusLabel.snp.trailing)
//        }
//        
//        firstLineView.snp.makeConstraints { make in
//            make.top.equalTo(profilePhotoImage.snp.bottom).offset(20)
//            make.leading.equalTo(profilePhotoImage.snp.leading)
//            make.trailing.equalTo(cityAndMailStackView.snp.trailing)
//            make.height.equalTo(1)
//        }
//        
//        statisticsTableView.snp.makeConstraints { make in
//            make.top.equalTo(firstLineView.snp.bottom).offset(20)
//            make.leading.equalTo(firstLineView.snp.leading)
//            make.trailing.equalTo(firstLineView.snp.trailing)
//            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-30)
//        }
//    }
//}
//
