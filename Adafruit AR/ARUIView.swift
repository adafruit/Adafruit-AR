//
//  ARUIView.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 11/10/20.
//  Copyright © 2020 Adafruit. All rights reserved.
//

import UIKit

class ARUIView: UIView {

    override init(frame: CGRect) {

        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        view.layer.borderWidth = 3.0
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.borderColor = UIColor.cyan.cgColor
        //view.alpha = 0.2
        view.isOpaque = false
        view.backgroundColor = UIColor(white: 0, alpha: 0)
        return view
    }()
    
   func setupViews() {
        
    self.addSubview(contentView)
    
    }
    
    
}
