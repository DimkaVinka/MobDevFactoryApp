//
//  TypeCell.swift
//  MobDevFactoryApp
//
//  Created by Мария Вольвакова on 07.10.2022.
//

import UIKit

class CellType: UICollectionViewListCell {
    
    static var identifier = "CellType"
    
    var studentName: UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.font = UIFont.preferredFont(forTextStyle: .headline)
        return lable
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
       // backgroundColor = UIColor(red: 53 / 255, green: 47 / 255, blue: 114 / 255, alpha: 1)
        
        contentView.addSubview(studentName)
        
        studentName.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(40)
            make.bottom.equalTo(contentView.snp.bottom).offset(-10)
        }
    }
}
