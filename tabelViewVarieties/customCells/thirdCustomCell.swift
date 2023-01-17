//
//  thirdCustomCell.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 17.01.23.
//

import Foundation
import UIKit

class ThirdCustomCell: UITableViewCell {
    
    var switcher = UISwitch()
    var customLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(switcher)
        self.addSubview(customLabel)
        self.backgroundColor = .clear
        
        createLabel()
        labelConstraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createLabel() {
        customLabel.numberOfLines = 1
    }
    
    func labelConstraints() {
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            customLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
}
