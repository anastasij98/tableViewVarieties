//
//  firstCustomCell.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 16.01.23.
//

import Foundation
import UIKit

struct FirstCustomCellModel {
    
    let image: UIImage?
    let name: String?
}

class FirstCustomCell: UITableViewCell {
    
    var customImageView = UIImageView()
    var nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.backgroundColor = .clear
        contentView.addSubviews(customImageView, nameLabel)
        
        cofigureImage()
        configureNameLabel()
        setNameLabelConstraints()
        setImageConstraints()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(model: FirstCustomCellModel) {
        customImageView.image = model.image
        nameLabel.text = model.name
    }
    
    func cofigureImage() {
        customImageView.layer.cornerRadius = 10
        customImageView.clipsToBounds = true
    }

    func configureNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.textAlignment = .center
        nameLabel.font = .italicSystemFont(ofSize: 15)
    }

    func setImageConstraints() {
        customImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(12)
            make.height.equalTo(30)
            make.width.equalTo(customImageView.snp.height).multipliedBy(16/9)
        }
    }

    func setNameLabelConstraints() {
        nameLabel.backgroundColor = .green
        nameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(customImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
}
