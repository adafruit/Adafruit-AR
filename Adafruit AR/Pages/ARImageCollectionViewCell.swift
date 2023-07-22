//
//  ARImageCollectionViewCell.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 4/10/23.
//  Copyright © 2023 Vanguard Logic LLC. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
   
    static let identifier = "CustomCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height - 20)
        nameLabel.frame = CGRect(x: 0, y: contentView.frame.size.height - 20, width: contentView.frame.size.width, height: 20)
    }
    
    func configure(with image: UIImage, name: String) {
          imageView.image = image
          nameLabel.text = name
      }
}
