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
        
        self.addSubview(customImageView)
        self.addSubview(nameLabel)
        self.backgroundColor = .clear
        
        cofigureImage()
        configureNameLabel()
        setNameLabelConstraints()
        setImageConstraints()
        nameLabel.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(model: FirstCustomCellModel) {
        customImageView.image = model.image
        nameLabel.text = model.name
    }
    
    func cofigureImage(){
        customImageView.layer.cornerRadius = 10
        customImageView.clipsToBounds = true
    }

    func configureNameLabel() {
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
    }

    func setImageConstraints() {
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            customImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            customImageView.heightAnchor.constraint(equalToConstant: 50),
            customImageView.widthAnchor.constraint(equalTo: customImageView.heightAnchor, multiplier: 16/9)
        ])
    }

    func setNameLabelConstraints() {
        nameLabel.backgroundColor = .green
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
