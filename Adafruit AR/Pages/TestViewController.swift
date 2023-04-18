//
//  TestViewController.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 4/10/23.
//  Copyright © 2023 Vanguard Logic LLC. All rights reserved.
//

import UIKit
import ARKit

protocol PhotosViewControllerDelegate: AnyObject {
    func didSelectImage(imageName: String)
}

class ARViewController: UIViewController, ARSCNViewDelegate {
    
    private var sceneView: ARSCNView!
    let configuration = ARImageTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = ARSCNView(frame: view.bounds)
        arViewSetup()
        config()
        addSubViews()
        //presentModal(isPresented: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presentModal(isPresented: true)
    }
    
    func arViewSetup() {
        let scene = SCNScene()
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.session.delegate = self as? ARSessionDelegate
        sceneView.scene = scene
    }
    
    func config() {
        let backgroundQueue = DispatchQueue(label: "com.Using_Sequence.configQueue", qos: .default, attributes: .concurrent)

        DispatchQueue.main.async {
            guard let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "Photos", bundle: Bundle.main) else {
                print("No images available")
                return
            }

         //   self.configuration.trackingImages = trackedImages
            self.configuration.maximumNumberOfTrackedImages = 1
            self.configuration.isAutoFocusEnabled = true

            
                self.sceneView.session.run(self.configuration, options: [.resetTracking, .removeExistingAnchors])
            
        }
    }
    
    func updateConfiguration(withImageName imageName: String) {
        
        print("Searching for... a \(imageName)")
        let backgroundQueue = DispatchQueue(label: "com.AdafruitAR.updateConfiguration", qos: .background, attributes: .concurrent)
        backgroundQueue.async {
            
            guard let imageAsset = UIImage(named: imageName, in: Bundle.main, compatibleWith: nil),
                  let imageCG = imageAsset.cgImage else {
                print("Image not available")
                return
            }
            
            
            let referenceImage = ARReferenceImage(imageCG, orientation: CGImagePropertyOrientation.up, physicalWidth: 0.1) // Replace 0.1 with your image's physical width in meters
            referenceImage.name = imageName
            
            self.configuration.trackingImages = [referenceImage]
            self.configuration.maximumNumberOfTrackedImages = 1
            self.configuration.isAutoFocusEnabled = true
            
            DispatchQueue.main.async {
                self.sceneView.session.run(self.configuration, options: [.resetTracking, .removeExistingAnchors])
            }
        }
    }
    
    func resetARView() {
        sceneView.session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
    }

    
    func addSubViews() {
        view.addSubview(sceneView)
      //  view.addSubview(appTitleLabel)
        view.addSubview(homeButton)
        view.addSubview(modalPresentButton)
        
        NSLayoutConstraint.activate([
            
            homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            homeButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            modalPresentButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            modalPresentButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            
            
        ])
    }
    
    let appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AR - Test View"
        label.font = UIFont(name: "Arial", size: 24)
        return label
    }()
    
    let homeButton: UIButton = {
        let image = UIImage(systemName: "house")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame.size.height = 100.0
        button.frame.size.width = 200.0
        button.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let modalPresentButton: UIButton = {
        let image = UIImage(systemName: "arrow.up.circle")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame.size.height = 200.0
        button.frame.size.width = 200.0
        button.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(presentCollectionViewModal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    @objc func presentCollectionViewModal() {
        presentModal(isPresented: true)
    }
    
    @objc func buttonTapped() {
        navigateBack()
        // Perform any actions you want when the button is tapped
    }
    
    @objc func navigateBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func presentModal(isPresented: Bool) {
        print("\(isPresented)")
        let detailViewController = ARImageCollectionViewController()
        
        let smallId = UISheetPresentationController.Detent.Identifier("small")
        let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) { context in
            return 150
        }
        
        // 1
        detailViewController.modalPresentationStyle = .pageSheet
        
        if let sheet = detailViewController.sheetPresentationController {
            // 3
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 30.0
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.detents = [smallDetent,.medium(), .large()]
            
            
        }
        // 4
        detailViewController.delegate = self
        present(detailViewController, animated: true, completion: nil)
    }
    
    func ARObjectToScene(ARObject: SCNNode, ARScene: SCNScene, planeNode: SCNNode, size: SCNVector3) {
        print("Function: \(#function),File: \(#file),Line: \( #line)")
        for child in ARScene.rootNode.childNodes {
            ARObject.addChildNode(child)
        }
        
        ARObject.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
        ARObject.scale = SCNVector3(x: size.x, y: size.y, z: size.z)
        
        planeNode.addChildNode(ARObject)
    }
    
    func ARPlaneAnchor(imageReferenceAnchor: ARImageAnchor, mainNode: SCNNode) {
        print("Function: \(#function),File: \(#file),Line: \( #line)")
        
        let plane = SCNPlane(width: imageReferenceAnchor.referenceImage.physicalSize.width, height: imageReferenceAnchor.referenceImage.physicalSize.height)
        
        plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -.pi / 2
        
        mainNode.addChildNode(planeNode)
    }
 
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()

        if let imageAnchor = anchor as? ARImageAnchor {
            let backgroundQueue = DispatchQueue(label: "com.Using_Sequence.backgroundQueue", qos: .background, attributes: .concurrent)

            backgroundQueue.async {
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0, alpha: 0)

                let planeNode = SCNNode(geometry: plane)
                planeNode.eulerAngles.x = -.pi / 2
                node.addChildNode(planeNode)

                // Get the reference image's name
                guard let imageName = imageAnchor.referenceImage.name else { return }

                // Load the AR object's scene based on the image's name
                let arObjectScene: SCNScene

                switch imageName {
                case "fist":
                    arObjectScene = SCNScene(named: "art.scnassets/fistObject.scn")! // Replace with your AR object's scene
                case "Circuit Playground Bluefruit":
                    arObjectScene = SCNScene(named: "art.scnassets/CircuitPlaygroundBluefruit.scn")! // Replace with your AR object's scene
                // Add more cases for other images
                case "RaspPi PicoW":
                    arObjectScene = SCNScene(named: "art.scnassets/PiCow.scn")! // Replace with your AR object's scene
                    
                default:
                    return
                }

                // Create an AR object from the loaded scene
                let arObject = SCNNode()
                let arObjectNodes = arObjectScene.rootNode.childNodes

                for childNode in arObjectNodes {
                    arObject.addChildNode(childNode)
                }

                // Set the AR object's position and scale
                arObject.position = SCNVector3Zero
                arObject.scale = SCNVector3(0.005, 0.005, 0.005) // Set the scale according to your object's size

                // Add the AR object to the image's node
                DispatchQueue.main.async {
                    node.addChildNode(arObject)
                }
            }
        }

        return node
    }
   
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        print("Function: \(#function),File: \(#file),Line: \( #line)")
        
        guard let imageAnchor = anchor as? ARImageAnchor else { return }
        
        // You can handle the detected images here
        let imageName = imageAnchor.referenceImage.name ?? "Unknown image"
        print("Image detected: \(imageName)")
        
        // Call the ARPlaneAnchor function to create an AR plane
        ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)

    }
     
}

extension ARViewController: PhotosViewControllerDelegate {
    
    func didSelectImage(imageName: String) {
        presentModal(isPresented: false)
        updateConfiguration(withImageName: imageName)
        print("Selected image: \(imageName)")
        
    }
    
}




