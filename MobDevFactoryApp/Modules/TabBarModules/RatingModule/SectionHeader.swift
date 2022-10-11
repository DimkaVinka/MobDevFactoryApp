//
//  ExpandableCell.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 07.10.2022.
//

import UIKit


class SectionHeader: UICollectionReusableView {
    
    static let identifier = "SectionHeader"
    
    var imageIcon = UIImageView()
    
    var lableTitle: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.preferredFont(forTextStyle: .title3)
        lable.adjustsFontForContentSizeCategory = true
        lable.textColor = .systemBlue
        return lable
    }()
    
    var forwardImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .placeholderText
        return image
    }()
    
    var lableNumber: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.preferredFont(forTextStyle: .subheadline)
        lable.adjustsFontForContentSizeCategory = true
        lable.textColor = .placeholderText
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setupCell(data: Team) {
//        imageIcon.image = data.image
//        lableTitle.text = data.lableTitle
//        lableNumber.text = data.lableNumber
//    }
    
    func setupView(){
        addSubview(imageIcon)
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        imageIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
        addSubview(lableTitle)
    
        lableTitle.translatesAutoresizingMaskIntoConstraints = false
        lableTitle.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 17).isActive = true
        lableTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
        addSubview(forwardImage)
        forwardImage.translatesAutoresizingMaskIntoConstraints = false
        forwardImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        forwardImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
        addSubview(lableNumber)
        lableNumber.translatesAutoresizingMaskIntoConstraints = false
        lableNumber.trailingAnchor.constraint(equalTo: forwardImage.trailingAnchor, constant: -30).isActive = true
        lableNumber.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}



