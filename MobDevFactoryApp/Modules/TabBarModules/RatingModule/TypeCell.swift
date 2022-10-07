//
//  TypeCell.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 07.10.2022.
//

import UIKit

// MARK: - UICollectionViewCell

class FirstTypeCell: UICollectionViewCell {
    static var identifier = "FirstTypeCell"
    let contentContainer = UIView()
    
    var albomImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 4
        image.clipsToBounds = true
        return image
    }()
    
    var lableTitle: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.layer.masksToBounds = false
        lable.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return lable
    }()
    
    var lableNumber: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 12, weight: .light)
        lable.textColor = .placeholderText
        lable.layer.masksToBounds = false
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setupCell(data: Album) {
//        albomImage.image = data.image
//        lableTitle.text = data.lableTitle
//        lableNumber.text = data.lableNumber
//    }
    


func setupView(){

    contentView.addSubview(albomImage)

    albomImage.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
    albomImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
    albomImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
    albomImage.topAnchor.constraint(equalTo: contentView.topAnchor),
    albomImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
])
    contentView.addSubview(lableTitle)

    lableTitle.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
    lableTitle.topAnchor.constraint(equalTo: albomImage.bottomAnchor, constant: 5),
    lableTitle.leadingAnchor.constraint(equalTo: albomImage.leadingAnchor),
    lableTitle.trailingAnchor.constraint(equalTo: albomImage.trailingAnchor)
    ])

    contentView.addSubview(lableNumber)

    lableNumber.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    lableNumber.topAnchor.constraint(equalTo: lableTitle.bottomAnchor, constant: 5),
    lableNumber.leadingAnchor.constraint(equalTo: lableTitle.leadingAnchor),
    lableNumber.trailingAnchor.constraint(equalTo: albomImage.trailingAnchor)
    ])
}
}
