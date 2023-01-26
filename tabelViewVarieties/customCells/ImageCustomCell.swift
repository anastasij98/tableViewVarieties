//
//  ImageCustomCell.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 19.01.23.
//

import Foundation
import UIKit

struct ImageCustomCellModel {
    var backgroundImageModel: UIImage?
}
 
class ImageCustomCell: UITableViewCell {
    
    var backgroundImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createLayers()
        createBackground()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: ImageCustomCellModel) {
        backgroundImage.image = model.backgroundImageModel
    }
    
    func createLayers() {
        contentView.layer.borderColor = UIColor.green.cgColor
        contentView.layer.borderWidth = 2
        contentView.backgroundColor = .clear
    }
    
    func createBackground() {
        contentView.addSubview(backgroundImage)
        
        backgroundImage.layer.cornerRadius = 10
        backgroundImage.clipsToBounds = true
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
