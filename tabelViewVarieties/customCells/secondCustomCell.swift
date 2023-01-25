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
        
        self.contentView.addSubview(customLabel)
        self.contentView.addSubview(firstCustomImage)
        self.contentView.addSubview(secondCustomImage)
        self.backgroundColor = .systemPink
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
        secondCustomImage.layer.cornerCurve = .circular
    }
    
    func createLabel() {
        customLabel.adjustsFontSizeToFitWidth = true
        customLabel.numberOfLines = 1
        customLabel.backgroundColor = .yellow.withAlphaComponent(0.5)
    }
    
    
    func setLabelConstraints() {
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            customLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setFirstImageConstraints() {
        firstCustomImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            firstCustomImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            firstCustomImage.leadingAnchor.constraint(equalTo: customLabel.trailingAnchor, constant: 12),
            firstCustomImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            firstCustomImage.heightAnchor.constraint(equalToConstant: 20),
            firstCustomImage.widthAnchor.constraint(equalTo: firstCustomImage.heightAnchor, multiplier: 16/9)

        ])
    }
    
    func setSecondImageConstraints() {
        secondCustomImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondCustomImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            secondCustomImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            secondCustomImage.heightAnchor.constraint(equalToConstant: 20),
            secondCustomImage.leadingAnchor.constraint(equalTo: firstCustomImage.trailingAnchor, constant: 10),
            secondCustomImage.widthAnchor.constraint(equalToConstant: 30)
        ])
        
    }
}
