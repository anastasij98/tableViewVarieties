//
//  secondCustomClass.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 17.01.23.
//

import Foundation
import UIKit

struct SecondCustomCellModel{
    var firatsImage: UIImage?
    var secondImage: UIImage?
    var label: String?
}

class SecondCustomCell: UITableViewCell{
    
    var firstCustomImage = UIImageView()
    var secondCustomImage = UIImageView()
    var customLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubviews(customLabel, firstCustomImage, secondCustomImage)
        contentView.backgroundColor = .systemPink
        
        createLabel()
        createImage()
        setLabelConstraints()
        setFirstImageConstraints()
        setSecondImageConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: SecondCustomCellModel) {
        firstCustomImage.image = model.firatsImage
        secondCustomImage.image = model.secondImage
        customLabel.text = model.label
    }
    
    func createImage() {
        firstCustomImage.layer.cornerRadius = 10
        firstCustomImage.clipsToBounds = true
        
        secondCustomImage.clipsToBounds = true
    
        secondCustomImage.layer.cornerCurve = .continuous
    }
    
    func createLabel() {
        customLabel.adjustsFontSizeToFitWidth = true
        customLabel.numberOfLines = 1
        customLabel.backgroundColor = .yellow.withAlphaComponent(0.5)
    }
    
    
    func setLabelConstraints() {
        customLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(contentView.snp.leading)
            make.width.equalTo(60)
        }
    }
    
    func setFirstImageConstraints() {
        firstCustomImage.snp.makeConstraints { make in
            make.leading.equalTo(customLabel.snp.trailing).offset(12)
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(firstCustomImage.snp.height).multipliedBy(16/9)
        }
    }
    
    func setSecondImageConstraints() {
        secondCustomImage.snp.makeConstraints { make in
            make.leading.equalTo(firstCustomImage.snp.trailing).offset(10)
            make.top.bottom.equalTo(contentView).inset(5)
            make.height.equalTo(50)
            make.width.equalTo(30)
        }
    }
}
