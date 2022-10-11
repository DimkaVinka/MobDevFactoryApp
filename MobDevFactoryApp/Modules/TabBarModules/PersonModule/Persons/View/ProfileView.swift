//
//  ProfileView.swift
//  MobDevFactoryApp
//
//  Created by Федор Донсков on 04.10.2022.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    
    // MARK: - Private properties

    private lazy var indicatorOnOffImage: UIImageView = {
        let imageView = UIImageView()

        let configuration = UIImage.SymbolConfiguration(pointSize: 10)
        let image = UIImage(systemName: "circle.fill", withConfiguration: configuration)

        imageView.image = image
        imageView.contentMode = .center
        return imageView
    }()

    var nameStudentsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()

    var profilePhotoImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .systemOrange
        image.image = UIImage(named: "noImage")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()

    private lazy var numberGroupImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "group")
        return image
    }()

    var numberGroupLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    private lazy var cityImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "location")
        return image
    }()

    var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private lazy var mailImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "mail")
        return image
    }()

    var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private lazy var calendarImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "calendar")
        return image
    }()

    private lazy var dateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.text = Date().longDate
        return label
    }()

    private lazy var firstLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    lazy var statisticsTableView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: - Private properties StackView

    private lazy var indicatorAndNameStudentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()

    private lazy var groupImageLableStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()

    private lazy var cityImageLableStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()

    private lazy var mailImageLableStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()

    private lazy var cityAndMailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        return stackView
    }()

    private lazy var dateImageLableStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()

    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        setupHierarchy()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupHierarchy() {
        addSubview(indicatorAndNameStudentsStackView)
        addSubview(profilePhotoImage)
        addSubview(cityAndMailStackView)
        addSubview(firstLineView)
        addSubview(statisticsTableView)

        indicatorAndNameStudentsStackView.addArrangedSubview(indicatorOnOffImage)
        indicatorAndNameStudentsStackView.addArrangedSubview(nameStudentsLabel)

        cityImageLableStackView.addArrangedSubview(cityImage)
        cityImageLableStackView.addArrangedSubview(cityLabel)

        mailImageLableStackView.addArrangedSubview(mailImage)
        mailImageLableStackView.addArrangedSubview(emailLabel)

        groupImageLableStackView.addArrangedSubview(numberGroupImage)
        groupImageLableStackView.addArrangedSubview(numberGroupLabel)

        dateImageLableStackView.addArrangedSubview(calendarImage)
        dateImageLableStackView.addArrangedSubview(dateDescriptionLabel)

        cityAndMailStackView.addArrangedSubview(dateImageLableStackView)
        cityAndMailStackView.addArrangedSubview(groupImageLableStackView)
        cityAndMailStackView.addArrangedSubview(cityImageLableStackView)
        cityAndMailStackView.addArrangedSubview(mailImageLableStackView)

        setupView()
        setupLayout()
    }

    private func setupView() {
        backgroundColor = Metric.colorBackround
    }

    private func setupLayout() {
        indicatorAndNameStudentsStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(self.snp.leading).offset(30)
            make.trailing.equalTo(self.snp.trailing).offset(-30)
        }

        profilePhotoImage.snp.makeConstraints { make in
            make.top.equalTo(indicatorAndNameStudentsStackView.snp.bottom).offset(20)
            make.leading.equalTo(indicatorAndNameStudentsStackView.snp.leading)
            make.height.equalTo(160)
            make.width.equalTo(130)
        }

        cityAndMailStackView.snp.makeConstraints { make in
            make.top.equalTo(profilePhotoImage.snp.top)
            make.leading.equalTo(profilePhotoImage.snp.trailing).offset(20)
            make.trailing.equalTo(indicatorAndNameStudentsStackView.snp.trailing)
        }

        firstLineView.snp.makeConstraints { make in
            make.top.equalTo(profilePhotoImage.snp.bottom).offset(20)
            make.leading.equalTo(profilePhotoImage.snp.leading)
            make.trailing.equalTo(cityAndMailStackView.snp.trailing)
            make.height.equalTo(1)
        }

        statisticsTableView.snp.makeConstraints { make in
            make.top.equalTo(firstLineView.snp.bottom).offset(20)
            make.leading.equalTo(firstLineView.snp.leading)
            make.trailing.equalTo(firstLineView.snp.trailing)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
    }
}
