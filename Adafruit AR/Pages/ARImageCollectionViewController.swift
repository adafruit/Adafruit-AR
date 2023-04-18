//
//  ARImageCollectionViewController.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 4/10/23.
//  Copyright © 2023 Vanguard Logic LLC. All rights reserved.
//

import UIKit

class ARImageCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var collectionView: UICollectionView?
    // Replace with your image names in the "Photos" folder.
    let images: [String] = ["Circuit Playground Bluefruit", "RaspPi PicoW"]

    weak var delegate: PhotosViewControllerDelegate?
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Werdd"
        label.font = UIFont(name: "Arial", size: 32)

       // label.font = UIFont(name: "GothicA1-Thin", size: 32)
        return label
    }()
    
    func addSubViews() {
        view.addSubview(appTitleLabel)
        
        
        NSLayoutConstraint.activate([

            appTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            appTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            appTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),

        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addSubViews()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.frame.size.width/3 - 20, height: view.frame.size.width/3)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        
        if let collectionView = collectionView {
            view.addSubview(collectionView)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
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

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        let image = UIImage(named: images[indexPath.row])
        cell.configure(with: image!, name: images[indexPath.row])
        return cell
    }
}

class CustomHeaderView: UICollectionReusableView {
    static let identifier = "CustomHeaderView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Header Title"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
