//
//  ExpandableCell.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 07.10.2022.
//

import UIKit


class SectionHeader: UICollectionViewListCell {

    static let identifier = "SectionHeader"
    
    var view: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    var imageIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .red
        image.tintColor = .white
        image.image = UIImage(systemName: "play.rectangle.fill")
        return image
    }()

    var lableTitle: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.preferredFont(forTextStyle: .headline)
        lable.adjustsFontForContentSizeCategory = true
        lable.textColor = .white
        return lable
    }()

    var lableNumber: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.preferredFont(forTextStyle: .headline)
        lable.adjustsFontForContentSizeCategory = true
        lable.textColor = .white
        return lable
    }()
    

    override init(frame: CGRect) {
      super.init(frame: frame)
        setupView()
    }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    func setupView() {
        
        backgroundColor = UIColor(red: 18 / 255, green: 14 / 255, blue: 62 / 255, alpha: 1)
        addSubview(imageIcon)
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        imageIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        addSubview(lableTitle)

        lableTitle.translatesAutoresizingMaskIntoConstraints = false
        lableTitle.leadingAnchor.constraint(equalTo: imageIcon.trailingAnchor, constant: 17).isActive = true
        lableTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true


        addSubview(lableNumber)
        lableNumber.translatesAutoresizingMaskIntoConstraints = false
        lableNumber.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        lableNumber.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}



