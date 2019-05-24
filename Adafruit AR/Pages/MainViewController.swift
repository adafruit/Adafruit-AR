//
//  MainViewController.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 9/4/18.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//

import Foundation
import UIKit


class MainViewController: UIViewController {
  
 let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] 
    
  @IBOutlet weak var qrModeIcon: UIButton!
  
  @IBOutlet weak var qrLabel: UILabel!
  
  @IBOutlet weak var arModeAdabot: UIButton!
  
  @IBOutlet weak var ARLabel: UILabel!
  
    @IBOutlet weak var versionNumberLabel: UILabel!
    
    func versionString() {
        self.versionNumberLabel.text = "v.\(appVersion! as! String)"
    }
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    versionString()
  }
  

}
