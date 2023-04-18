//
//  MainViewController.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 9/4/18.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//

import ARKit
import UIKit



class MainViewController: UIViewController, ARSCNViewDelegate {
  
 let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] 


  @IBOutlet weak var testButtonRef: UIButton!
    
    @IBAction func testButtonAction(_ sender: UIButton) {
        print("Button Pressed")
        navigateToNextViewController()
    }
    
    @objc func navigateToNextViewController() {
        let nextViewController = ARViewController()
                nextViewController.modalPresentationStyle = .fullScreen // or any other presentation style you prefer
                self.present(nextViewController, animated: true, completion: nil)
    }
    

    
  @IBOutlet weak var boardView: ARSCNView!
  
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

    let scene = SCNScene()
    // Set the view's delegate
    boardView.delegate = self

    boardView.session.delegate = self as? ARSessionDelegate

    boardView.scene = scene

  }


}
