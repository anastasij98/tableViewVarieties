//
//  thirdCustomCell.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 17.01.23.
//

import Foundation
import UIKit

struct ThirdCustomCellModel {
    var customLabelStr: String?
}

class ThirdCustomCell: UITableViewCell {
    
    weak var delegate: CustomCellDelegate?
    
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
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: ThirdCustomCellModel){
        customLabel.text = model.customLabelStr
       
    }
    
    func createLabel() {
        customLabel.backgroundColor = .blue
        customLabel.numberOfLines = 1
        customLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview()
            make.width.equalTo(100)
        }
    }
    
    func createSwtcher() {
        contentView.addSubview(switcher)
        switcher.isOn = false
        switcher.addTarget(self, action: #selector(changeValue), for: .touchUpInside)
        switcher.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(customLabel.snp.leading).offset(120)
        }
    }
 
    func createButton() {
        contentView.addSubview(customButton)
        
        customButton.setTitleColor(.blue, for: .normal)
        customButton.setTitle("some text", for: .normal)
        customButton.backgroundColor = .yellow
        customButton.addTarget(self, action: #selector(goToVC), for: .touchUpInside)
        
        customButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalTo(switcher.snp.leading).offset(120)
            make.width.equalTo(130)
        }
        
    }
    
    @objc
    func goToVC(_ sender: UIButton) {
        delegate?.onCellButtonTouched()
    }
    
    @objc
    func changeValue(_ sender: UISwitch) {
        if self.backgroundColor == .white {
            self.backgroundColor = .clear
        } else {
            self.backgroundColor = .white
        }
    }
    
}
