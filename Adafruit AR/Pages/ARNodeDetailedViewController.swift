//
//  ARNodeDetailedViewController.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 7/20/23.
//  Copyright © 2023 Vanguard Logic LLC. All rights reserved.
//

import UIKit

class ARNodeDetailedViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    let componentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 32)
        label.textColor = .white
        return label
    }()
    
    // Create the UITextView
    let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false // Use AutoLayout
        textView.backgroundColor = .clear
        textView.textColor = .white
        return textView
    }()

    // Provide a method to set the text
    func setText(textHeader: String,textBody: String) {
        self.componentLabel.text = textHeader
        self.textView.text = textBody
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the UITextView
        view.backgroundColor = .darkGray
        addSubviews()
    }

    func addSubviews() {
        view.addSubview(componentLabel)
        view.addSubview(textView)

        NSLayoutConstraint.activate([
            componentLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            componentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            componentLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            textView.topAnchor.constraint(equalTo: componentLabel.bottomAnchor, constant: 10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }

}
