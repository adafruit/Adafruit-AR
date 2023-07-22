//
//  ARImageCollectionViewController.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 4/10/23.
//  Copyright © 2023 Vanguard Logic LLC. All rights reserved.
//

import UIKit

class ARImageCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // Replace with your image names in the "Photos" folder.
    let images: [String] = ["Circuit Playground Express","Circuit Playground Bluefruit", "Clue", "RaspPi Pico", "RaspPi Pico W", "ESP32-S2 TFT", "ESP32-S2 Rev TFT", "Teensy 4.1", "Metro M7 1011 with AirLift"]

    weak var delegate: PhotosViewControllerDelegate?
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SELECT A BOARD"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 32)
        label.textColor = .white
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
            
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.frame.size.width/3 - 20, height: view.frame.size.width/3)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
            
        return collectionView
    }()
    
    func addSubViews() {
        view.addSubview(appTitleLabel)
        view.addSubview(collectionView)
        view.backgroundColor = .backgroundColor
        collectionView.backgroundColor = .backgroundColor
       
        NSLayoutConstraint.activate([
            appTitleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            appTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            appTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: appTitleLabel.topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
            let selectedImageName = images[indexPath.row]
            delegate?.didSelectImage(imageName: selectedImageName)
            print("Did tap - \(#function)")
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    func getImageFromCollectionViewImagesFolder(named imageName: String) -> UIImage? {
        return UIImage(named: "CollectionView Images/\(imageName)")
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        let image = UIImage(named: images[indexPath.row])
        cell.configure(with: image!, name: images[indexPath.row])
        return cell
    }
}


