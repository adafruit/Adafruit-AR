//
//  ClickableView.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 11/9/20.
//  Copyright © 2020 Adafruit. All rights reserved.
//
import UIKit

@IBDesignable
final class ClickableView: UIButton {

    
    let degrees = 180.0
    
    
    override init(frame: CGRect) {

    super.init(frame: frame)

    self.addTarget(self, action:  #selector(objectTapped(_:)), for: .touchUpInside)

         setupViews()
    //self.backgroundColor = .red
        setupButtonStyle()
        self.setTitle("Tap me", for: .normal)
        self.setTitle("Pressed + Hold", for: .highlighted)
        
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

    override func awakeFromNib() {
        setupButtonStyle()
    }
    
    func setupButtonStyle(){
        let radians = CGFloat(degrees * .pi / 180)
        
        // translate
        var transform = CATransform3DMakeTranslation(0, 0, 0)
        
            // rotate
            transform = CATransform3DRotate(transform, radians, 0.0, 0.0, 1.0)
        
        // apply the transforms
        self.layer.transform = transform
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.layer.borderColor = UIColor.cyan.cgColor
        self.titleLabel?.font = UIFont(name: "Avenir", size: 30)
        self.layer.borderWidth = 4.0
        self.layer.cornerRadius = self.layer.bounds.size.width / 2
      //  self.layer.transform = CATransform3DMakeTranslation(90, 50, 0)
      //  self.layer.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        //self.layer.transform = CATransform3DMakeRotation(radians, 0.0, 0.0, 1.0)
    }
    
    let contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        view.layer.borderWidth = 3.0
       // view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.borderColor = UIColor.red.cgColor
        //view.alpha = 0.2
        view.isOpaque = false
        view.backgroundColor = UIColor(white: 0, alpha: 0)
        return view
    }()
    
    let contentViewdos: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: -20, width: 25, height: 25))
        view.layer.borderWidth = 3.0
        view.transform = CGAffineTransform(translationX: 0, y: -25)
       // view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.borderColor = UIColor.red.cgColor
        //view.alpha = 0.2
        view.isOpaque = false
        view.backgroundColor = UIColor(white: 0, alpha: 0)
        return view
    }()
    
   func setupViews() {
        
    self.addSubview(contentView)
    self.addSubview(contentViewdos)
    }
    
/// Detects Which Object Was Tapped
///
/// - Parameter sender: UIButton
@objc func objectTapped(_ sender: UIButton){

    print("Object With Tag \(tag)")

   }

}
