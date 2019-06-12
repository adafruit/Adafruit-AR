//
//  BoardViewController.swift
//  Adafruit AR
//
//  Created by Trevor B on 5/20/19.
//  Copyright © 2019 Vanguard Logic LLC. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation



class BoardViewController: UIViewController, ARSCNViewDelegate {
    

    //Funtion Array for CPX Interactive Buttons
    var PyButtons = [SCNNode]()
    var PyDisplays = [SCNNode]()
    var pyStandAloneLabel = SCNNode()
    
    //Funtion Array for Py Interactive Buttons
    
    var pyATSButton = SCNNode()
    var pyATSInfo = SCNNode()
    var pyATSSwitch = false
    
    var pyIC2Button = SCNNode()
    var pyIC2Info = SCNNode()
    var pyIC2Switch = false
    
    var pySensorButton = SCNNode()
    var pySensorInfo = SCNNode()
    var pySensorSwitch = false
    
    var pySpeakerButton = SCNNode()
    var pySpeakerInfo = SCNNode()
    var pySpeakerSwitch = false
    
    var pyDAButton = SCNNode()
    var pyDAInfo = SCNNode()
    var pyDASwitch = false
    
    var pyWifiButton = SCNNode()
    var pyWifiInfo = SCNNode()
    var pyWifiSwitch = false
    
    var pyConnectorButton = SCNNode()
    var pyConnectorInfo = SCNNode()
    var pyConnectorSwitch = false
    
    //Funtion Array for CPX Interactive Buttons
    var CPXButtons = [SCNNode]()
    var CPXDisplays = [SCNNode]()
    //CPX Interative model
    
    //Circuit Playground Interaction Test
    var neoPixelButton = SCNNode()
    var neoPixelInfo = SCNNode()
    var cpxNeoPixelSwitch = false
    
    var ATSButton = SCNNode()
    var ATSInfo = SCNNode()
    var cpxATSSwitch = false
    
    var crocButton = SCNNode()
    var crocInfo = SCNNode()
    var cpxCrocSwitch = false
    
    var temperatureButton = SCNNode()
    var temperatureDisplay = SCNNode()
    var cpxTempSwitch = false
    
    var speakButton = SCNNode()
    var speakInfo = SCNNode()
    var cpxSpeakSwitch = false
    
    var micButton = SCNNode()
    var micInfo = SCNNode()
    var cpxMicSwitch = false
    
    var cpxStandAloneLabel = SCNNode()
    
    var fadeOut = SCNAction()
    var fadeIn = SCNAction()
    
    // UI
    let sampleMask = UIView()
    let maskLayer = CALayer()
    let squareLayer = CAShapeLayer()
    var toggleButtonSelected = false
    
    var promptShown = false

    

    @IBOutlet weak var visualBoardEffectView: UIVisualEffectView!
    var effect: UIVisualEffect!
    
    @IBOutlet weak var scanLabel: UILabel!
    
    @IBOutlet weak var boardInfoButton: UIButton!
    

    @IBAction func boardInfoAction(_ sender: Any) {
    animateIn()
    }
    
    @IBOutlet weak var boardSceneView: ARSCNView!
    
    
    
    @IBAction func dismissBoardIconPopup(_ sender: Any) {
    
        animateOut()
        visualBoardEffectView.isUserInteractionEnabled = false
        //visualBoardEffectView.effect = nil
        
        //promptShown = true
    }
    
    @IBOutlet weak var boardItemView: UIView!
    
    
    
    
    func animateIn() {
        self.view.addSubview(boardItemView)
        boardItemView.center = self.view.center
        boardItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        boardItemView.alpha =  0
        
        UIView.animate(withDuration: 0.4) {
            self.visualBoardEffectView.effect = self.effect
            self.boardItemView.alpha = 1
            self.boardItemView.transform = CGAffineTransform.identity
        }
    }
    
    
    func animateOut() {
        UIView.animate(withDuration: 1, animations: {
            
            self.boardItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.boardItemView.alpha = 0
            self.visualBoardEffectView.effect = nil
        }) { (success:Bool) in
            
            for subview in self.visualBoardEffectView.subviews {
                if subview is UIVisualEffectView {
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    
    
    func easeOutElastic(_ t: Float) -> Float {
        let p: Float = 0.3
        let result = pow(2.0, -10.0 * t) * sin((t - p / 4.0) * (2.0 * Float.pi) / p) + 1.0
        return result
    }
    
    func displayWebView(on rootNode: SCNNode, xOffset: CGFloat) {
        // Xcode yells at us about the deprecation of UIWebView in iOS 12.0, but there is currently
        // a bug that does now allow us to use a WKWebView as a texture for our webViewNode
        // Note that UIWebViews should only be instantiated on the main thread!
        DispatchQueue.main.async {
            let request = URLRequest(url: URL(string: "https://www.adafruit.com/product/4116")!)
            let webView = UIWebView(frame: CGRect(x: 0, y: 0, width: 400, height: 672))
            webView.loadRequest(request)
            
            let webViewPlane = SCNPlane(width: xOffset, height: xOffset * 1.4)
            webViewPlane.cornerRadius = 0.25
            
            let webViewNode = SCNNode(geometry: webViewPlane)
            
            // Set the web view as webViewPlane's primary texture
            webViewNode.geometry?.firstMaterial?.diffuse.contents = webView
            webViewNode.position.z -= 0.5
            webViewNode.opacity = 0
            
            rootNode.addChildNode(webViewNode)
            webViewNode.runAction(.sequence([
                .wait(duration: 2.0),
                .fadeOpacity(to: 1.0, duration: 1.5),
                .moveBy(x: xOffset * 1.0, y: 0, z: -0.05, duration: 1.2),
                .moveBy(x: 0, y: 0, z: -0.05, duration: 0.2)
                ])
            )
        }
    }
    
    func displayDetailView(on rootNode: SCNNode, xOffset: CGFloat) {
        let detailPlane = SCNPlane(width: xOffset, height: xOffset * 1.4)
        detailPlane.cornerRadius = 0.25
        
        let detailNode = SCNNode(geometry: detailPlane)
        detailNode.geometry?.firstMaterial?.diffuse.contents = SKScene(fileNamed: "DetailScene")
        
        // Due to the origin of the iOS coordinate system, SCNMaterial's content appears upside down, so flip the y-axis.
        detailNode.geometry?.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
        detailNode.position.z -= 0.5
        detailNode.opacity = 0
        
        rootNode.addChildNode(detailNode)
        detailNode.runAction(.sequence([
            .wait(duration: 1.0),
            .fadeOpacity(to: 1.0, duration: 1.5),
            .moveBy(x: xOffset * -1.1, y: 0, z: -0.05, duration: 1.5),
            .moveBy(x: 0, y: 0, z: -0.05, duration: 0.2)
            ])
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        
        // Set the view's delegate
        boardSceneView.delegate = self
        
        boardSceneView.session.delegate = self as? ARSessionDelegate
        
        // Set the scene to the view
        boardSceneView.scene = scene
        
        sampleMask.frame = self.view.frame
        
        sampleMask.backgroundColor =  UIColor.black.withAlphaComponent(0.3)
        
        maskLayer.frame = sampleMask.bounds
        
        let squareLayer = CAShapeLayer()
        
        squareLayer.frame = CGRect(x:0 , y:0,width: sampleMask.frame.size.width,height: sampleMask.frame.size.height)
        
        let finalPath = UIBezierPath(roundedRect: CGRect(x:0 , y:0,width: sampleMask.frame.size.width,height: sampleMask.frame.size.height), cornerRadius: 0)
        
        let squarePath = UIBezierPath(roundedRect: CGRect(x:sampleMask.center.x - 150, y:sampleMask.center.y - 150, width: 300, height: 250), cornerRadius: 15)
        
        finalPath.append(squarePath.reversing())
        squareLayer.path = finalPath.cgPath
        squareLayer.borderColor = UIColor.white.withAlphaComponent(1).cgColor
        squareLayer.borderWidth = 1
        
        registerTapRecognizer()
        
        maskLayer.addSublayer(squareLayer)
        
        sampleMask.layer.mask = maskLayer
   
    
        effect = visualBoardEffectView.effect
    
//        //Removes the effect that was applied
        visualBoardEffectView.effect = nil
        
        animateIn()
    }
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
            print("View Will Appear...and it did!")
        maskLayer.addSublayer(squareLayer)
        
       // scanLabel.isHidden = false
        
        self.view.insertSubview(sampleMask, at: 1)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        guard let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "Photos", bundle: Bundle.main) else {
            print("No images available")
            return
        }
        
        configuration.trackingImages = trackedImages
        configuration.maximumNumberOfTrackedImages = 4
        
       // colorArray = [UIColor.blue, UIColor.red, UIColor.yellow, UIColor.white, UIColor.orange, UIColor.green, UIColor.cyan, UIColor.magenta, UIColor.init(red: 153, green: 204, blue: 255, alpha: 1),UIColor.init(red: 255, green: 204, blue: 255, alpha: 1) ]
        
        // Run the view's session
        boardSceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        boardSceneView.session.pause()
        
    }
    
    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        //This node is used to place the Plane used to plant the AR models
        let node = SCNNode()
        
       
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let physicalWidth = imageAnchor.referenceImage.physicalSize.width
            let physicalHeight = imageAnchor.referenceImage.physicalSize.height
            
            
            switch imageAnchor.referenceImage.name {
                
                
                
            case "cpx":
                
                let labelScale: Float = 0.03
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                let circuitPlaygroundLabelScene = SCNScene(named: "art.scnassets/CPX_Displays.scn")!
                
                for child in circuitPlaygroundLabelScene.rootNode.childNodes {
                    cpxStandAloneLabel.addChildNode(child)
                }
                
                cpxStandAloneLabel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z)
                
                cpxStandAloneLabel.scale = SCNVector3(x: labelScale, y: labelScale, z: labelScale)
                
                //For Interactive Test
                
                //NeoPixels
                neoPixelButton = cpxStandAloneLabel.childNode(withName: "neopixel_Button", recursively: true)!
                
                neoPixelInfo = cpxStandAloneLabel.childNode(withName: "neopixel_Info", recursively: true)!
                
                neoPixelInfo.isHidden = true
                
                //ATSAMD21
                ATSButton = cpxStandAloneLabel.childNode(withName: "ATSAMD21_Micro_button", recursively: true)!
                
                ATSInfo = cpxStandAloneLabel.childNode(withName: "ATSAMD_info", recursively: true)!
                
                
                ATSInfo.isHidden = true
                
                
                //Croc/Alligator Clip Pads
                crocButton = cpxStandAloneLabel.childNode(withName: "Croc_Button", recursively: true)!
                
                crocInfo = cpxStandAloneLabel.childNode(withName: "Croc_info", recursively: true)!
                
                crocInfo.isHidden = true

                //Temperature Sensor
                temperatureButton = cpxStandAloneLabel.childNode(withName: "temp_button", recursively: true)!
                
                temperatureDisplay = cpxStandAloneLabel.childNode(withName: "temp_info", recursively: true)!
                
                temperatureDisplay.isHidden = true
                
                //Speaker
                speakButton = cpxStandAloneLabel.childNode(withName: "speaker_button", recursively: true)!
                
                speakInfo = cpxStandAloneLabel.childNode(withName: "speaker_info", recursively: true)!
                
                speakInfo.isHidden = true
                
                //Mic
                micButton = cpxStandAloneLabel.childNode(withName: "mic_button", recursively: true)!
                
                micInfo = cpxStandAloneLabel.childNode(withName: "mic_info", recursively: true)!
                
                micInfo.isHidden = true
                
                planeNode.addChildNode(cpxStandAloneLabel)
                
                node.addChildNode(planeNode)
                
                DispatchQueue.main.async {
                    self.scanLabel.isHidden = true
                    self.sampleMask.isHidden = true
                    
                }

            case "portal2":
              
                print("Recognize Meow")
                let labelScale: Float = 0.03
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                let pyLabelScene = SCNScene(named: "art.scnassets/Py_Display.scn")!
                
                for child in pyLabelScene.rootNode.childNodes {
                    pyStandAloneLabel.addChildNode(child)
                }
                
                pyStandAloneLabel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z)
                
                pyStandAloneLabel.scale = SCNVector3(x: labelScale, y: labelScale, z: labelScale)
                
                //ATSAMD21
                pyATSButton = pyStandAloneLabel.childNode(withName: "py_ATSAMD_Button", recursively: true)!
                
                pyATSInfo = pyStandAloneLabel.childNode(withName: "py_ATSAMD_Display", recursively: true)!
                
                pyATSInfo.isHidden = true
                
                
                pyIC2Button = pyStandAloneLabel.childNode(withName: "py_IC2_Button", recursively: true)!
                
                pyIC2Info = pyStandAloneLabel.childNode(withName: "py_IC2_Display", recursively: true)!
                
                pyIC2Info.isHidden = true
                
                
                pySensorButton = pyStandAloneLabel.childNode(withName: "py_Sensor_Button", recursively: true)!
                
                pySensorInfo = pyStandAloneLabel.childNode(withName: "py_Sensor_Display", recursively: true)!
                
                pySensorInfo.isHidden = true
                
                
                pyDAButton = pyStandAloneLabel.childNode(withName: "py_D_A_Button", recursively: true)!
                
                pyDAInfo = pyStandAloneLabel.childNode(withName: "py_D_A_Display", recursively: true)!
                
                pyDAInfo.isHidden = true
                
                
                pyWifiButton = pyStandAloneLabel.childNode(withName: "py_Wifi_Button", recursively: true)!
                
                pyWifiInfo = pyStandAloneLabel.childNode(withName: "py_Wifi_Display", recursively: true)!
                
                pyWifiInfo.isHidden = true
                
                
                pyConnectorButton = pyStandAloneLabel.childNode(withName: "py_Connector_Button", recursively: true)!
                
                pyConnectorInfo = pyStandAloneLabel.childNode(withName: "py_Connector_Display", recursively: true)!
                
                pyConnectorInfo.isHidden = true
                 
                
                pySpeakerButton = pyStandAloneLabel.childNode(withName: "py_Speaker_Button", recursively: true)!
                
                pySpeakerInfo = pyStandAloneLabel.childNode(withName: "py_Speaker_Display", recursively: true)!
                
                pySpeakerInfo.isHidden = true
            
                // Create a plane geometry to visualize the initial position of the detected image
//                let mainPlane = SCNPlane(width: physicalWidth, height: physicalHeight)
//
//                // This bit is important. It helps us create occlusion so virtual things stay hidden behind the detected image
//                mainPlane.firstMaterial?.colorBufferWriteMask = .alpha
//
//                // Create a SceneKit root node with the plane geometry to attach to the scene graph
//                // This node will hold the virtual UI in place
//                let mainNode = SCNNode(geometry: mainPlane)
//                mainNode.eulerAngles.x = -.pi / 2
//                mainNode.renderingOrder = -1
//                mainNode.opacity = 1
//
//                // Add the plane visualization to the scene
//                node.addChildNode(mainNode)
//
//
//                // Introduce virtual content
//                // self.displayDetailView(on: pyStaneAloneLabel, xOffset: physicalWidth + 10)
//
//                // Animate the WebView to the right
//                self.displayWebView(on: pyStandAloneLabel, xOffset: physicalWidth + 7)
                
                planeNode.addChildNode(pyStandAloneLabel)
                
                node.addChildNode(planeNode)
                
                DispatchQueue.main.async {
                    self.scanLabel.isHidden = true
                    self.sampleMask.isHidden = true
                    
                }
                
                
                
                
            default:
                break
            }
    
            
        }
    return node
}
    





}
