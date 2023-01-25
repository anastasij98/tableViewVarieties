//
//  ImageCell.swift
//  tabelViewVarieties
//
//  Created by LUNNOPARK on 22.01.23.
//

import UIKit
import Kingfisher
import SnapKit

class ImageCell: UITableViewCell {
    
    var imageURL = URL(string: "https://res.cloudinary.com/dk-find-out/image/upload/q_80,w_1920,f_auto/dreamstime_xxl_21352253_l9g6xw.jpg")
    var customImageView = UIImageView()
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(customImageView)
        contentView.addSubview(activityIndicator)
        
        customImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo(200)
        }
        
        activityIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(30)
        }
        
        activityIndicator.startAnimating()
        
        customImageView.kf.setImage(with: imageURL, options: [.transition(.fade(5))]) { [ weak self ] _ in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
