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

class BoardScanViewController: UIViewController, ARSCNViewDelegate {
    
    private var sceneView: ARSCNView!
    let configuration = ARImageTrackingConfiguration()
    private var collectionViewIsPresented: Bool = false
    
    let loadingService = ARImageLoadingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView = ARSCNView(frame: view.bounds)
        arViewSetup()
        initialConfigurationSetup()
        addSubViews()
        registerTapRecognizer()
    }
    
    @objc func handlePinchGesture(sender: UIPinchGestureRecognizer) {
        guard let pointOfView = sceneView.pointOfView else { return }
        let cameraNode = pointOfView
        cameraNode.isHidden = true
        let originalFov = CGFloat(cameraNode.camera!.fieldOfView)
        let scale = max(min(sender.scale, 2.0), 0.5)
        cameraNode.camera?.fieldOfView = Double(originalFov * scale)
    }
    
    func registerTapRecognizer() {
        let tapGestureRecognizer =  UITapGestureRecognizer (target:self ,action : #selector (tapped))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tapped(sender: UITapGestureRecognizer) {
        guard let sceneView = sender.view as? ARSCNView else { return }

        // Get the location of the tap in the view.
        let tapLocation = sender.location(in: sceneView)

        // Perform a hit test on the ARSCNView.
        guard let hitResult = performHitTest(sceneView: sceneView, at: tapLocation) else {
            print("No object detected")
            return
        }

        // Identify the AR object.
        if let nodeName = identifyARObject(node: hitResult.node) {
            print("\(nodeName) touched")

            // Show the UISheetPresentationController.
            presentSheetController(named: nodeName)
        }
    }

    func performHitTest(sceneView: ARSCNView, at point: CGPoint) -> SCNHitTestResult? {
        // Perform a hit test on the ARSCNView to find any 3D objects that correspond to the 2D tap location.
        let hitTestResults = sceneView.hitTest(point, options: nil)
        return hitTestResults.first
    }

    func identifyARObject(node: SCNNode) -> String? {
        // If the node's name is "plane" or if it's nil, return nil
        if node.name == "plane" || node.name == nil {
            return nil
        } else {
            // If the node has a name and it's not "plane", return the name
            return node.name
        }
    }
   
    
    let arObjectTexts: [String: String] = [
        "Metro M7 1011 with AirLift" : ListOfTexts.MetroM7.overview,
        "Debug Interface": ListOfTexts.MetroM7.debugInterface,
        "Boot Mode Switches": ListOfTexts.MetroM7.bootModeSwitches,
        "STEMMA QT" : ListOfTexts.MetroM7.stemmaQT,
        "i.MX RT1011 Processor" : ListOfTexts.MetroM7.iMXRT1011Processor,
        "USB-C port" : ListOfTexts.MetroM7.usbcport,
        "ESP32 WiFi Co-Processor" : ListOfTexts.MetroM7.esp32,
        "DC Jack" : ListOfTexts.MetroM7.dcJack
    ]

    func presentSheetController(named name: String) {
        let sheetController = ARNodeDetailedViewController()
        sheetController.modalPresentationStyle = .pageSheet

        let customId = UISheetPresentationController.Detent.Identifier("customDetent")
        let customDetent = UISheetPresentationController.Detent.custom(identifier: customId) { context in
            return 300
        }
        
        
        sheetController.sheetPresentationController?.detents = [customDetent]
        sheetController.sheetPresentationController?.prefersGrabberVisible = true
        sheetController.sheetPresentationController?.preferredCornerRadius = 30.0
        sheetController.sheetPresentationController?.prefersScrollingExpandsWhenScrolledToEdge = false
        
        // Use the dictionary to look up the text for the AR object
        if let textBody = arObjectTexts[name] {
            sheetController.setText(textHeader: name, textBody: textBody)
        } else {
            // If the AR object is not in the dictionary, use a default text
            sheetController.setText(textHeader: name, textBody: "No information available for this object.")
        }
        
        self.present(sheetController, animated: true, completion: nil)
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
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture))
        sceneView.addGestureRecognizer(pinchGesture)
    }
   
    func initialConfigurationSetup() {
        let backgroundQueue = DispatchQueue(label: "com.Using_Sequence.configQueue", qos: .default, attributes: .concurrent)
        
        DispatchQueue.main.async {
            
            self.configuration.maximumNumberOfTrackedImages = 1
            self.configuration.isAutoFocusEnabled = true
            self.configuration.videoHDRAllowed = true
            
            if let hiResFormat = ARWorldTrackingConfiguration.recommendedVideoFormatFor4KResolution {
                print("Updated Video Quality")
                self.configuration.videoFormat = hiResFormat
            }
            
            self.sceneView.session.run(self.configuration, options: [.resetTracking, .removeExistingAnchors])
            
        }
    }
    
    func updateConfiguration(withImageName imageName: String) {
        
        print("Searching for... a \(imageName)")
        let backgroundQueue = DispatchQueue(label: "com.AdafruitAR.updateConfiguration", qos: .background, attributes: .concurrent)
        
        backgroundQueue.async {
            
            guard let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "Photos", bundle: Bundle.main) else {
                print("No images available")
                return
            }
            
            // Retrieve UIImage using the imageName
                   guard let image = UIImage(named: imageName) else {
                       print("Image not found: \(imageName)")
                       return
                   }

                   // Get the CGImage from the UIImage
                   guard let imageCG = image.cgImage else {
                       print("Failed to get CGImage from UIImage")
                       return
                   }
            
           
            
            let referenceImage = ARReferenceImage(imageCG, orientation: CGImagePropertyOrientation.up, physicalWidth: 0.05) // Replace 0.1 with your image's physical width in meters
            referenceImage.name = imageName
            
            self.configuration.trackingImages = [referenceImage]
  
            DispatchQueue.main.async {
                self.sceneView.session.run(self.configuration, options: [.resetTracking, .removeExistingAnchors])
            }
        }
    }
    
    func resetARView() {
        sceneView.session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
    }

    
    func addSubViews() {
        // Create the UIActivityIndicatorView
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .medium)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        // Create the UIStackView
        let stackView = UIStackView(arrangedSubviews: [spinner,appTitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5

        // Add subviews
        view.addSubview(sceneView)
        view.addSubview(homeButton)
        view.addSubview(modalPresentButton)
        view.addSubview(stackView)

        // Constraints
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            homeButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            modalPresentButton.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            modalPresentButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),

            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center the stack view horizontally
        ])
    }

    var spinner: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .medium)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.activityIndicatorViewStyle = .medium
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.stopAnimating()
        return activityIndicatorView
    }()
    
    var appTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SELECT A BOARD BELOW"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        label.textColor = .white
        label.textAlignment = .center

        return label
    }()
    
    let homeButton: UIButton = {
        
        let originalImage = UIImage(systemName: "chevron.backward")
        let templateImage = originalImage?.withRenderingMode(.alwaysTemplate)
        let newImageSize = CGSize(width: 15, height: 20)
        let resizedImage = templateImage?.withTintColor(.white).resizableImage(withCapInsets: .zero, resizingMode: .stretch).withRenderingMode(.alwaysOriginal)
        let finalImage = UIGraphicsImageRenderer(size: newImageSize).image { _ in
            resizedImage!.draw(in: CGRect(origin: .zero, size: newImageSize))
        }

        let button = UIButton(type: .custom)
        button.setImage(finalImage, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame.size.height = 100
        button.frame.size.width = 100
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
    }
    
    @objc func navigateBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    let detailViewController = ARImageCollectionViewController()
    
    private func presentModal(isPresented: Bool) {
        print("\(#function) - \(isPresented)")
        print("is collectionViewIsPresented?? - \(collectionViewIsPresented)")
        
        let smallId = UISheetPresentationController.Detent.Identifier("small")
        let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) { context in
            return 150
        }
        
        // 1
        if !collectionViewIsPresented {
            detailViewController.modalPresentationStyle = .pageSheet
            
            if let sheet = detailViewController.sheetPresentationController {
                // 3
                sheet.largestUndimmedDetentIdentifier
                sheet.prefersGrabberVisible = true
                sheet.preferredCornerRadius = 30.0
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
                sheet.detents = [smallDetent,.medium(), .large()]
                
            }
            // 4
            
                detailViewController.delegate = self
                present(detailViewController, animated: true, completion: nil)
            collectionViewIsPresented = true
        } else {
            collectionViewIsPresented = false
            detailViewController.dismiss(animated: true)
        }
        
        
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
                
                DispatchQueue.main.async {
                    self.appTitleLabel.isHidden = true
                    self.spinner.stopAnimating()
                    
                }
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0, alpha: 0)

                let planeNode = SCNNode(geometry: plane)
                planeNode.eulerAngles.x = -.pi / 2
                node.addChildNode(planeNode)

                // Get the reference image's name
                guard let imageName = imageAnchor.referenceImage.name else { return }

                // Load the AR object's scene based on the image's name
                let arObjectScene: SCNScene?

                switch imageName {

                    
                case "ref.Circuit Playground Bluefruit":
                    guard let scene = SCNScene(named: "art.scnassets/CircuitPlaygroundBluefruit.scn") else {
                        print("Failed to load CircuitPlaygroundBluefruit scene")
                        return
                    }
                    
                    arObjectScene = scene
                    
                case "ref.Circuit Playground Express":
                    arObjectScene = SCNScene(named: "art.scnassets/CircuitPlaygroundExpress.scn")!
                    
                case "ref.RaspPi Pico W":
                    arObjectScene = SCNScene(named: "art.scnassets/PiCow.scn")!

                case "ref.RaspPi Pico":
                    arObjectScene = SCNScene(named: "art.scnassets/Pico.scn")!
                    
                case "ref.Clue":
                    arObjectScene = SCNScene(named: "art.scnassets/Clue.scn")!

                case "ref.ESP32-S2 TFT":
                    arObjectScene = SCNScene(named: "art.scnassets/ESP32-S2TFT.scn")!
               
                case "ref.ESP32-S2 Rev TFT":
                    arObjectScene = SCNScene(named: "art.scnassets/ESP32-S2 Rev TFT.scn")!
                
                case "ref.Teensy 4.1":
                    arObjectScene = SCNScene(named: "art.scnassets/Teensy4.1.scn")!
                    //Metro M7 1011 with AirLift
                case "ref.Metro M7 1011 with AirLift":
                    arObjectScene = SCNScene(named: "art.scnassets/Metro M7 1011 with AirLift.scn")!
                default:
                    return
                }

                guard let arObjectSceneUnwrapped = arObjectScene else {
                    print("Failed to load AR object scene")
                    return
                }

                // Create an AR object from the loaded scene
                let arObject = SCNNode()
                let arObjectNodes = arObjectSceneUnwrapped.rootNode.childNodes

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

extension BoardScanViewController: PhotosViewControllerDelegate {
    
    func didSelectImage(imageName: String) {
        presentModal(isPresented: false)
        updateConfiguration(withImageName: "ref.\(imageName)")
        
        DispatchQueue.main.async {
            self.appTitleLabel.isHidden = false
            self.appTitleLabel.text = ("Scanning for the \(imageName)")
            self.spinner.startAnimating()
        }
        
        print("Selected image: \(imageName)")
        
    }
    
}





