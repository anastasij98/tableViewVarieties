//
//  ImageCustomCell.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 19.01.23.
//

import Foundation
import UIKit

class ImageCustomCell: UITableViewCell{
    
    var backgroundImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(backgroundImage)
        createBackground()
        self.backgroundColor = .clear
        self.layer.borderColor = CGColor.init(red: 0, green: 80, blue: 50, alpha: 1)
        self.layer.borderWidth = 2
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBackground() {
        backgroundImage.layer.cornerRadius = 10
        backgroundImage.clipsToBounds = true
       
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
