//
//  pageThree.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 9/26/18.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//

import Foundation
import UIKit


class pageThree: UIViewController {
  
  var nameHolder = String()
  
  @IBOutlet weak var buttonRef: UIButton!
  
  
  @IBAction func buttonAction(_ sender: UIButton) {
  
    print("Button Pressed.")
    
    UserDefaults.standard.set("\(nameHolder)", forKey: "name")
 
  performSegue(withIdentifier: "toMain", sender: self)
  
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
}
