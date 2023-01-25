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
    var customButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(customLabel)
        self.backgroundColor = .clear
        
        
        createLabel()
        createSwtcher()
        createButton()
        buttonsAction()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func createLabel() {
        customLabel.numberOfLines = 1
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            customLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            customLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
        
       customLabel.backgroundColor = .blue
    }
    
    func createSwtcher() {
        contentView.addSubview(switcher)
        switcher.isOn = false
//        switcher.setOn(false, animated: true)
        switcher.addTarget(self, action: #selector(changeValue), for: .touchUpInside)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switcher.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            switcher.leadingAnchor.constraint(equalTo: customLabel.leadingAnchor, constant: 120)
        ])
    }
 
    func createButton() {
        contentView.addSubview(customButton)
        customButton.setTitleColor(.blue, for: .normal)
        
        customButton.backgroundColor = .yellow
        customButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            customButton.leadingAnchor.constraint(equalTo: switcher.leadingAnchor, constant: 120),
            customButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
    }
    
    func buttonsAction(){
        customButton.addTarget(self, action: #selector(setColor), for: .touchUpInside)
    }
    
    @objc
    func setColor(_ sender: UIButton) {
        if customLabel.backgroundColor == .blue {
            customLabel.backgroundColor = .green
        } else {
            customLabel.backgroundColor = .blue
        }
        print("hi")
        
        
        let parent = RandomCellsViewController()
        let nextVC = ExampleVC ()
//        parent.navigationController?.pushViewController(nextVC, animated: true)
        parent.present(nextVC, animated: true)
    }
    
    @objc func changeValue(_ sender: UISwitch){
        if self.backgroundColor == .white {
            self.backgroundColor = .clear
        } else {
            self.backgroundColor = .white
        }
    }
    
}
