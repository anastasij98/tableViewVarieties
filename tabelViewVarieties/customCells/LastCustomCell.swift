//
//  LastCustomCell.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 20.01.23.
//

import Foundation
import UIKit
import SnapKit

struct LastCustomCellModel {
    var productImage: UIImage?
    var productName: String?
}

class LastCustomCell: UITableViewCell {
    
    var productImage = UIImageView()
    var nameLabel = UILabel()
    var minusButton = UIButton()
    var quantityLabel = UILabel()
    var plusButton = UIButton()
    var customStepper = UIStepper()
    var numberOfProduct = 0
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(productImage, nameLabel, quantityLabel, customStepper)
        
        createProductImage()
        createNameLabel()
        createMinusButton()
        createQuantityLabel()
        createPlusButton()
        createStepper()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: LastCustomCellModel) {
        productImage.image = model.productImage
        nameLabel.text = model.productName
    }
    
    func createProductImage() {
        productImage.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(80)
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(5)
        }
        productImage.contentMode = .redraw
    }
   
    func createNameLabel() {
        nameLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(productImage.snp.trailing).offset(15)
            make.width.equalTo(80)
        }
    }
    
    func createMinusButton() {
        contentView.addSubview(minusButton)
        
        minusButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(nameLabel.snp.trailing).offset(10)
            make.width.equalTo(20)
        }
        
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.layer.cornerRadius = 10
        minusButton.addTarget(self, action: #selector(deleteSomeProduct(_:)), for: .touchUpInside)
        
    }
    
    func createQuantityLabel() {
        quantityLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(minusButton.snp.trailing).offset(10)
            make.width.equalTo(25)
        }
        
        quantityLabel.text = "\(numberOfProduct)"
        quantityLabel.textAlignment = .center
        quantityLabel.layer.borderColor = UIColor.black.cgColor
        quantityLabel.layer.borderWidth = 2
    }
    
    func createPlusButton() {
        contentView.addSubview(plusButton)

        plusButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.leading.equalTo(quantityLabel.snp.trailing).offset(10)
            make.width.equalTo(20)
        }
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.layer.cornerRadius = 10
        plusButton.addTarget(self, action: #selector(addSomeProduct(_:)), for: .touchUpInside)
    }
    
    
    @objc func addSomeProduct(_ sender: UIButton) {
        numberOfProduct += 1
        quantityLabel.text = "\(numberOfProduct)"
    }
    
    @objc func deleteSomeProduct(_ sender: UIButton) {
        if numberOfProduct > 0 {
            numberOfProduct -= 1
        } else {
            numberOfProduct = 0
        }
        quantityLabel.text = "\(numberOfProduct)"
    }
    
    func createStepper() {
        customStepper.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(plusButton.snp.trailing).offset(2)
            make.width.equalTo(100)
        }
        customStepper.minimumValue = 0.0
        customStepper.maximumValue = 10.0
        customStepper.autorepeat = true
        customStepper.addTarget(self, action: #selector(tappedStepper), for: .valueChanged)
    }

   @objc func tappedStepper() {
        quantityLabel.text = Int(customStepper.value).description
    }
   
}
