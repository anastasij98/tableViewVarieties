//
//  LastCustomCell.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 20.01.23.
//

import Foundation
import UIKit
import SnapKit

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
        
//        self.addSubview(productImage)
//        self.addSubview(nameLabel)
//        self.addSubview(quantityLabel)
//        self.contentView.addSubview(customStepper)
        
        contentView.addSubviews(productImage, nameLabel, quantityLabel, customStepper)
        
        createProductImage()
        createNameLabel()
        createMinusButton()
        createQuantityLabel()
//        createPlusButton()
        
        createStepper()
        
    }
        
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createProductImage(){
        productImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            productImage.heightAnchor.constraint(equalToConstant: 20),
            productImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            productImage.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        productImage.contentMode = .redraw
    }
   
    func createNameLabel(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            nameLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 15),
            nameLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func createMinusButton(){
        contentView.addSubview(minusButton)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minusButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            minusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            minusButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            minusButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.layer.cornerRadius = 10
        minusButton.addTarget(self, action: #selector(deleteSomeProduct(_:)), for: .touchUpInside)
        
    }
    
    func createQuantityLabel(){
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            quantityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            quantityLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 10),
            quantityLabel.widthAnchor.constraint(equalToConstant: 25)
        ])
        quantityLabel.text = "\(numberOfProduct)"
        quantityLabel.textAlignment = .center
        quantityLabel.layer.borderColor = UIColor.black.cgColor
        quantityLabel.layer.borderWidth = 2
    }
    
    func createPlusButton(){
        contentView.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            plusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            plusButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 10),
            plusButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.layer.cornerRadius = 10
        plusButton.addTarget(self, action: #selector(addSomeProduct(_:)), for: .touchUpInside)
    }
    
    
    @objc func addSomeProduct(_ sender: UIButton){
        numberOfProduct += 1
        quantityLabel.text = "\(numberOfProduct)"
    }
    
    @objc func deleteSomeProduct(_ sender: UIButton){
        if numberOfProduct > 0 {
            numberOfProduct -= 1
            
        } else{
            numberOfProduct = 0
        }
        
        quantityLabel.text = "\(numberOfProduct)"
    }
    
    func createStepper() {
        print("fxkc")
//        customStepper.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            customStepper.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            customStepper.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 2),
//            customStepper.widthAnchor.constraint(equalToConstant: 50)
//        ])
        customStepper.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(quantityLabel.snp.trailing).offset(2)
            make.width.equalTo(100)
        }
        
        
        customStepper.minimumValue = 0.0
        customStepper.maximumValue = 10.0
        
        
        customStepper.addTarget(self, action: #selector(tappedStepper), for: .valueChanged)
    }

   @objc func tappedStepper() {
        quantityLabel.text = Int(customStepper.value).description
    }
   
}
