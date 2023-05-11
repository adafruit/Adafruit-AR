//
//  MainViewController.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 9/4/18.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        versionString()
    }
    
    // MARK: - UI Properties
    
    @IBOutlet weak var arModeAdabot: UIButton!
    @IBOutlet weak var versionNumberLabel: UILabel!
    @IBOutlet weak var boardScanButton: UIButton!
    
    @IBAction func boardScanButtonPress(_ sender: UIButton) {
        navigateToNextViewController()
    }
    
    @objc func navigateToNextViewController() {
        let nextViewController = BoardScanViewController()
        nextViewController.modalPresentationStyle = .fullScreen // or any other presentation style you prefer
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    func versionString() {
        self.versionNumberLabel.text = "v.\(appVersion! as! String)"
    }
    
}
