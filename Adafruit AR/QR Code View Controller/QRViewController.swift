// Newly replaced from Github- Test
//  QRViewController.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 9/4/18.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation

class QRViewController: UIViewController, ARSCNViewDelegate {
    
    
    // AR Objects

    // For Hallowing Model
    let halloWingNode = SCNNode()
    var hallowLabelNode = SCNNode()
    
    var hallowingPlayText = SCNNode()
    var hallowingStopText = SCNNode()
    var hallowingVideoSwitch = Bool()
    var hallowingLabelDescription = SCNNode()
    var hallowingLoaded = Bool()
    
    // For Circuit Playground Express Model
    var cpxNode = SCNNode()
    var cpxLabel = SCNNode()
    
    var cpxLabelDescription = SCNNode()
    var cpxPlayText = SCNNode()
    var cpxStopText = SCNNode()
    var cpxVidSwitch = Bool()
    var cpxLoaded = Bool()
    //Product image tracking test
    
    // For Circuit Playground Express Model

    var cpxStandAloneLabel = SCNNode()
    
    var cpxLabelDescriptionStandAlone = SCNNode()
    var cpxPlayTextStandAlone = SCNNode()
    var cpxStopTextStandAlone = SCNNode()
    var cpxVidSwitchStandAlone = Bool()
    var crickitLoaded = Bool()
    
    // For Crickit w/ CPX Model
    
    // VVV crickitNode holds both Circkit solo and Crickit animated model VVV
    let crickitNode = SCNNode()
    var crickitSolo = SCNNode()
    var crickitAnimation = SCNNode()
    var crickitLabelNode = SCNNode()
    
    var unassembleText = SCNNode()
    var assembleText = SCNNode()
    var crickitPlayText = SCNNode()
    var crickitStopText = SCNNode()
    var crickitSwitch = Bool()
    var crickitVideoSwitch = Bool()
    
    

    
    
    //For Grand Central M4 AR Model
    var grandCentralNode = SCNNode()
    var grandCentralLabel = SCNNode()
    var grandCentralDescription = SCNNode()
    
    var grandPlayText = SCNNode()
    var grandStopText = SCNNode()
    var grandSwitch = Bool()
    var grandVideo = SCNNode()
    var grandCentralLoaded = Bool()
    
    //For NeoTrellis M4 Model
    var neoTrellis = SCNNode()
    var neoTrellisLabel = SCNNode()
    
    var neoDescription = SCNNode()
    var neoPlayText = SCNNode()
    var neoStopText = SCNNode()
    var neoSwitch = Bool()
    var neoVideo = SCNNode()
    var neoLoaded = Bool()
    //For PyPortal Model
    var pyNode = SCNNode()
    var pyLabel = SCNNode()
    
    var pyLabelDescription = SCNNode()
    var pyPlayText = SCNNode()
    var pyStopText = SCNNode()
    var pyVidSwitch = Bool()
    var pyLoaded = Bool()
    //For Button Textures
    var colorArray = [UIColor]()
    
    //For Button Switches
    var boolArray = [Bool]()
  
    //NeoTrellis Cubes
    var cubeNode1 = SCNNode()
    var cubeNode2 = SCNNode()
    var cubeNode3 = SCNNode()
    var cubeNode4 = SCNNode()
    var cubeNode5 = SCNNode()
    var cubeNode6 = SCNNode()
    var cubeNode7 = SCNNode()
    var cubeNode8 = SCNNode()
    var cubeNode9 = SCNNode()
    var cubeNode10 = SCNNode()
    var cubeNode11 = SCNNode()
    var cubeNode12 = SCNNode()
    var cubeNode13 = SCNNode()
    var cubeNode14 = SCNNode()
    var cubeNode15 = SCNNode()
    var cubeNode16 = SCNNode()
    var cubeNode17 = SCNNode()
    var cubeNode18 = SCNNode()
    var cubeNode19 = SCNNode()
    var cubeNode20 = SCNNode()
    var cubeNode21 = SCNNode()
    var cubeNode22 = SCNNode()
    var cubeNode23 = SCNNode()
    var cubeNode24 = SCNNode()
    var cubeNode25 = SCNNode()
    var cubeNode26 = SCNNode()
    var cubeNode27 = SCNNode()
    var cubeNode28 = SCNNode()
    var cubeNode29 = SCNNode()
    var cubeNode30 = SCNNode()
    var cubeNode31 = SCNNode()
    var cubeNode32 = SCNNode()
    
    //Holds Cube Nodes 1-32 loaded in viewDidLoad
    var cubeArray = [SCNNode]()

    // True/False Switches
    var nodeLit1 = false
    var nodeLit2 = false
    var nodeLit3 = false
    var nodeLit4 = false
    var nodeLit5 = false
    var nodeLit6 = false
    var nodeLit7 = false
    var nodeLit8 = false
    var nodeLit9 = false
    var nodeLit10 = false
    var nodeLit11 = false
    var nodeLit12 = false
    var nodeLit13 = false
    var nodeLit14 = false
    var nodeLit15 = false
    var nodeLit16 = false
    var nodeLit17 = false
    var nodeLit18 = false
    var nodeLit19 = false
    var nodeLit20 = false
    var nodeLit21 = false
    var nodeLit22 = false
    var nodeLit23 = false
    var nodeLit24 = false
    var nodeLit25 = false
    var nodeLit26 = false
    var nodeLit27 = false
    var nodeLit28 = false
    var nodeLit29 = false
    var nodeLit30 = false
    var nodeLit31 = false
    var nodeLit32 = false
    
    // For HalloWing Eyeball Video
    var fileUrl = NSURL()
    var player = AVPlayer()
    var playerNode = SKVideoNode()
    var spriteKitScene = SKScene()
    
    // Variables for Circkit Product Video
    var crickitVideo = SCNNode()
    var crickitPlayer = AVPlayer()
    var crickitPlayerNode = SKVideoNode()
    
    // Variables for HalloWing Product Video
    var halloWingVideo = SCNNode()
    var halloWingPlayer = AVPlayer()
    var halloWingPlayerNode = SKVideoNode()
    
    // Variables for Circuit Playground Express Product Video
    var cpxVideo = SCNNode()
    var cpxPlayer = AVPlayer()
    var cpxPlayerNode = SKVideoNode()
    
    // Variables for Circuit Playground Express Product Video
    var grandCentralVideo = SCNNode()
    var grandCentralPlayer = AVPlayer()
    var grandCentralPlayerNode = SKVideoNode()
    
    // Variables for PyPortal Product Video
    var pyVideo = SCNNode()
    var pyPlayer = AVPlayer()
    var pyPlayerNode = SKVideoNode()
    
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
    
    //Funtion Array for CPX Interactive Buttons
    var PyButtons = [SCNNode]()
    var PyDisplays = [SCNNode]()
    var pyStaneAloneLabel = SCNNode()
    
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // URL's for Product Videos
    let crickitVideoURL = URL(string: "https://s3.amazonaws.com/adafruit-ar/video/product_videos/crickit.mp4")
    
    let hallowingVideoURL = URL(string: "https://s3.amazonaws.com/adafruit-ar/video/product_videos/hallowing.mp4")
    
    let cpxVidURL = URL(string: "https://s3.amazonaws.com/adafruit-ar/video/product_videos/cpx.mp4")
    
    let pyVidURL = URL(string: "https://s3.amazonaws.com/adafruit-ar/video/product_videos/pyportal.mp4")
    
    //For Rotation
     var newAngleY :Float = 0.0
     var currentAngleY :Float = 0.0
    

    
    // Transitions
    var fadeOut = SCNAction()
    var fadeIn = SCNAction()
    
    // For UI Blur Effect
    var effect : UIVisualEffect!
    
    // UI
    let sampleMask = UIView()
    let maskLayer = CALayer()
    let squareLayer = CAShapeLayer()
    var toggleButtonSelected = false
    
    // For Original HalloWing Video playback
    var videoPlane = SCNNode()
    
    let AspectDiv: CGFloat = 1000
    
    struct AspectRatio {
        static let width: CGFloat = 320
        static let height: CGFloat = 180
    }
    

    func easeOutElastic(_ t: Float) -> Float {
        let p: Float = 0.3
        let result = pow(2.0, -10.0 * t) * sin((t - p / 4.0) * (2.0 * Float.pi) / p) + 1.0
        return result
    }
    
    
    
    // Highlight Nodes in NeoTrellis
    func highlightNode(_ node: SCNNode) {

        cubeArray = cubeArray.filter { $0 != node }
        
        cubeArray.forEach { cube in
            print("Cubes are dehighlighted expect one")
            cube.dehighlight()
            cube.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
        }
        
        cubeArray = [cubeNode1, cubeNode2, cubeNode3, cubeNode4, cubeNode5, cubeNode6, cubeNode7, cubeNode8, cubeNode9, cubeNode10,cubeNode11,cubeNode12, cubeNode13, cubeNode14, cubeNode15, cubeNode16, cubeNode17, cubeNode18, cubeNode19, cubeNode20, cubeNode21, cubeNode22, cubeNode23, cubeNode24, cubeNode25, cubeNode26, cubeNode27, cubeNode28, cubeNode29, cubeNode30,cubeNode31,cubeNode32]
        
    }
    
    // Random Color Function for NeoTrellis
    func randomColor(_ node: SCNNode){
        
        let material = SCNMaterial()
        
        if colorArray.isEmpty {
            
        } else {
            let randomResult = Int(arc4random_uniform(UInt32(colorArray.count-1)))
            
            material.diffuse.contents = colorArray[randomResult]
            
            node.geometry?.materials = [material]
            
        }
    }
    
    
    // Interface Builder Outlets
    @IBOutlet weak var qrSceneView: ARSCNView!
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var qrInfoDisplayButton: UIButton!
    
    @IBOutlet weak var addedBlurEffect: UIVisualEffectView!
    
    @IBOutlet weak var touchLightButton: UIButton!
    
    @IBOutlet weak var scanLabel: UILabel!
    
    @IBOutlet var qrCodeInfoDisplay: UIView!
    
    // Interface Builder Actions
    @IBAction func qrInfoButtonAction(_ sender: UIButton) {
        animateOut()
        addedBlurEffect.isUserInteractionEnabled = false
    }
    
    @IBAction func qrInfoIcon(_ sender: UIButton) {
        animateIn()
    }
    
    @IBAction func torchAction(_ sender: UIButton) {
        toggleButtonSelected = !toggleButtonSelected
        toggleTorch()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let scene = SCNScene()
        // Set the view's delegate
        
        qrSceneView.delegate = self
        
        qrSceneView.session.delegate = self as? ARSessionDelegate
        
        // Set the scene to the view
        qrSceneView.scene = scene
        
        qrCodeInfoDisplay.layer.cornerRadius = 10
        
        addedBlurEffect.isUserInteractionEnabled = false
        
        effect = addedBlurEffect.effect
        
        addedBlurEffect.effect = nil
        
        registerTapRecognizer()
        
        // For ShadowOverlay & Transparent Square
        touchLightButton.setBackgroundImage(UIImage(named: "flash-on-icon.png"), for: .normal)
        
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
        
        maskLayer.addSublayer(squareLayer)
        
        sampleMask.layer.mask = maskLayer
        
        //file Location HalloWing eyeball video
        fileUrl = NSURL(fileURLWithPath: Bundle.main.path(forResource: "hallowing_eye", ofType: "mov")!)
        
        player = AVPlayer(url: fileUrl as URL)
        
        playerNode = SKVideoNode(avPlayer: player)
        
        fadeOut = SCNAction.fadeOut(duration: 1)
        
        fadeIn = SCNAction.fadeIn(duration: 0.0001)
        
        boolArray = [nodeLit1, nodeLit2, nodeLit3, nodeLit4, nodeLit5, nodeLit6, nodeLit7, nodeLit8, nodeLit9, nodeLit11,nodeLit12, nodeLit12, nodeLit13, nodeLit14, nodeLit15, nodeLit16, nodeLit17, nodeLit18, nodeLit19, nodeLit20, nodeLit21, nodeLit22, nodeLit23, nodeLit24, nodeLit25, nodeLit26, nodeLit27, nodeLit28, nodeLit29, nodeLit30, nodeLit31, nodeLit32]

        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        maskLayer.addSublayer(squareLayer)
        
        scanLabel.isHidden = false
        
        self.view.insertSubview(sampleMask, at: 1)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        guard let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "Photos", bundle: Bundle.main) else {
            print("No images available")
            return
        }
        
        configuration.trackingImages = trackedImages
        configuration.maximumNumberOfTrackedImages = 4
        
        colorArray = [UIColor.blue, UIColor.red, UIColor.yellow, UIColor.white, UIColor.orange, UIColor.green, UIColor.cyan, UIColor.magenta, UIColor.init(red: 153, green: 204, blue: 255, alpha: 1),UIColor.init(red: 255, green: 204, blue: 255, alpha: 1) ]
        
        // Run the view's session
        qrSceneView.session.run(configuration)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        qrSceneView.session.pause()
        
    }
    
    //UI Animation
    func animateIn() {
        self.view.addSubview(qrCodeInfoDisplay)
        qrCodeInfoDisplay.center = self.view.center
        qrCodeInfoDisplay.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        qrCodeInfoDisplay.alpha =  0
        
        UIView.animate(withDuration: 0.4) {
            self.addedBlurEffect.effect = self.effect
            self.qrCodeInfoDisplay.alpha = 1
            self.qrCodeInfoDisplay.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 1, animations: {
            
            self.qrCodeInfoDisplay.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.qrCodeInfoDisplay.alpha = 0
            self.addedBlurEffect.effect = nil
        }) { (success:Bool) in
            
            for subview in self.addedBlurEffect.subviews {
                if subview is UIVisualEffectView {
                    subview.removeFromSuperview()
                }
            }
        }
    }
    
    //Torch Light
    func toggleTorch() {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if toggleButtonSelected == true {
                    device.torchMode = .on
                    touchLightButton.setBackgroundImage(UIImage(named: "flash-off-icon.png"), for: .normal)
                } else {
                    touchLightButton.setBackgroundImage(UIImage(named: "flash-on-icon.png"), for: .normal)
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    
    
    
    
    
    
    
    
    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        //This node is used to place the Plane used to plant the AR models
        let node = SCNNode()
    
        
        
        
        
        if let imageAnchor = anchor as? ARImageAnchor {

            let physicalWidth = imageAnchor.referenceImage.physicalSize.width
            let physicalHeight = imageAnchor.referenceImage.physicalSize.height
                
                
            switch imageAnchor.referenceImage.name {
   
            //HalloWing QR Code Reference
            case "HallowingQRcode_v2":
                hallowingLoaded = true
                
                let scale: Float = 0.005
                
                let labelScale: Float = 1.8
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0)
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                let hallowLabelScene = SCNScene(named: "art.scnassets/HalloWingLabel.scn")!
                
                for child in hallowLabelScene.rootNode.childNodes {
                    hallowLabelNode.addChildNode(child)
                }
                
                hallowLabelNode.scale = SCNVector3(x: labelScale, y: labelScale, z: labelScale)

                let halloWingScene = SCNScene(named: "art.scnassets/HallowingM0.dae")!
                
                for child in halloWingScene.rootNode.childNodes {
                    halloWingNode.addChildNode(child)
                }
                
                halloWingNode.eulerAngles.x = 90
                
                halloWingNode.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                halloWingNode.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z)
                
                halloWingVideo = hallowLabelNode.childNode(withName: "hallowing plane", recursively: true)!
                
                hallowingLabelDescription =  hallowLabelNode.childNode(withName: "HallowLabel1", recursively: true)!
                
                hallowingPlayText = hallowLabelNode.childNode(withName: "HPlay video", recursively: true)!
                
                hallowingStopText = hallowLabelNode.childNode(withName: "HStop video", recursively: true)!
                
                halloWingVideo.isHidden = true
                
                hallowingStopText.isHidden = true
                
                hallowingVideoSwitch = false
                
                planeNode.addChildNode(hallowLabelNode)
                
                planeNode.addChildNode(halloWingNode)

                //For Eyeball Animation
                
                videoPlane = halloWingNode.childNode(withName: "plane", recursively: true)!
                
                node.addChildNode(planeNode)
                
                halloWingEyeVideo()
                
                DispatchQueue.main.async {
                    self.scanLabel.isHidden = true
                    self.sampleMask.isHidden = true
                    
                }

                
            // CPX QR Code Reference
            case "CPX-QRCode_v2":
                cpxLoaded = true
                let scale: Float = 0.05
                
                let labelScale: Float = 1.8
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                let circuitPlaygroundLabelScene = SCNScene(named: "art.scnassets/CPXLabel.scn")!
                
                for child in circuitPlaygroundLabelScene.rootNode.childNodes {
                    cpxLabel.addChildNode(child)
                }
                
                cpxLabel.position = SCNVector3Zero
                
                cpxLabel.scale = SCNVector3(x: labelScale, y: labelScale, z: labelScale)
                
                cpxVideo = cpxLabel.childNode(withName: "cpx plane", recursively: true)!
                
                cpxLabelDescription =  cpxLabel.childNode(withName: "Circuit Label", recursively: true)!
                
                cpxPlayText = cpxLabel.childNode(withName: "CPlay video", recursively: true)!
                
                cpxStopText = cpxLabel.childNode(withName: "CStop video", recursively: true)!
                
                
                cpxVideo.isHidden = true
                
                cpxStopText.isHidden = true
                
                cpxVidSwitch = false
                
                let CPXScene = SCNScene(named: "art.scnassets/Circuit_Playground.dae")!
                
                
                for child in CPXScene.rootNode.childNodes {
                    cpxNode.addChildNode(child)
                }
               
               
                cpxNode.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z + 0.05)
                
                cpxNode.eulerAngles.x = 90
                
                cpxNode.scale = SCNVector3(x: scale, y: scale, z: scale)


                planeNode.addChildNode(cpxNode)
                
                planeNode.addChildNode(cpxLabel)
                
                node.addChildNode(planeNode)
                
                DispatchQueue.main.async {
                    self.scanLabel.isHidden = true
                    self.sampleMask.isHidden = true
                    
                }
          
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

                
            //Newer Crickit QR Code Reference
            case "CrickitQRCode_v2":
                crickitLoaded = true
                let scale: Float = 5
                
                let labelScale: Float = 1.7
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                let crickitLabelScene = SCNScene(named: "art.scnassets/CrickitLabel.scn")!
                
                for child in crickitLabelScene.rootNode.childNodes {
                    crickitLabelNode.addChildNode(child)
                }
                
                crickitLabelNode.position = SCNVector3Zero

                crickitLabelNode.name = "crickitLabel1"
                
                crickitLabelNode.scale = SCNVector3(x: labelScale, y: labelScale, z: labelScale)
                
                unassembleText = crickitLabelNode.childNode(withName: "Unassemble Text", recursively: true)!
                
                assembleText = crickitLabelNode.childNode(withName: "Assembly Text", recursively: true)!
                
                unassembleText.isHidden = true
                
                let crickitScene = SCNScene(named: "art.scnassets/Crickit Express.dae")!
                
                crickitNode.position = SCNVector3Zero
                
                crickitNode.position.z = 0.2
                
                crickitNode.eulerAngles = SCNVector3(x: 89.2, y: -0.3, z: 2.5)
                
                crickitNode.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                for child in crickitScene.rootNode.childNodes {
                    crickitNode.addChildNode(child)
                }
                
                crickitAnimation = crickitNode.childNode(withName: "CPX", recursively: true)!
                
                crickitSolo = crickitNode.childNode(withName: "Crickit_Solo_", recursively: true)!
                
                crickitSwitch = false
                
                crickitAnimation.isHidden = true
                
                crickitVideo = crickitLabelNode.childNode(withName: "crickit plane", recursively: true)!
                
                crickitPlayText = crickitLabelNode.childNode(withName: "Play video", recursively: true)!
                
                crickitStopText = crickitLabelNode.childNode(withName: "Stop video", recursively: true)!
                
                crickitStopText.isHidden = true
                
                crickitVideo.isHidden = true
                
                planeNode.addChildNode(crickitNode)
                
                planeNode.addChildNode(crickitLabelNode)
                
                node.addChildNode(planeNode)
               
                DispatchQueue.main.async {
                    self.scanLabel.isHidden = true
                    self.sampleMask.isHidden = true
                    
                }
                
            case "NeoTrellis_v2":
                neoLoaded = true
                
                let scale: Float = 0.004
               
                let labelScale: Float = 2.2
                
                let NeoTrellisScene = SCNScene(named: "art.scnassets/NeoTrellis_v2.dae")!
                
                let neoTrellisLabelScene = SCNScene(named: "art.scnassets/NeoTrellisLabel.scn")!
                
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
               
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                //For NeoTrellis Label Node
                for child in neoTrellisLabelScene.rootNode.childNodes {
                    neoTrellisLabel.addChildNode(child)
                }
                
                neoTrellisLabel.position = SCNVector3Zero
                
                neoTrellisLabel.scale = SCNVector3(x: labelScale, y: labelScale, z: labelScale)
                
                let neoVideoButton = neoTrellisLabel.childNode(withName: "NeoTrellis Video", recursively: true)!
            
                neoDescription = neoTrellisLabel.childNode(withName: "NeoTrellisLabel", recursively: true)!
                
                neoVideo = neoTrellisLabel.childNode(withName: "NeoTrellis plane", recursively: true)!
                
                neoPlayText = neoTrellisLabel.childNode(withName: "NPlay video", recursively: true)!
                
                neoStopText = neoTrellisLabel.childNode(withName: "NStop video", recursively: true)!
                
                neoSwitch = false
                
                neoVideo.isHidden = true
                
                neoVideoButton.isHidden = true
                
                neoPlayText.isHidden = true
                
                neoStopText.isHidden = true
               
                for child in NeoTrellisScene.rootNode.childNodes {
                    neoTrellis.addChildNode(child)
                }
                
                neoTrellis.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z)
                
                //Row 1
                cubeNode1 = neoTrellis.childNode(withName: "Cube1", recursively: true)!
                cubeNode2 = neoTrellis.childNode(withName: "Cube2", recursively: true)!
                cubeNode3 = neoTrellis.childNode(withName: "Cube3", recursively: true)!
                cubeNode4 = neoTrellis.childNode(withName: "Cube4", recursively: true)!
                //Row 2
                cubeNode5 = neoTrellis.childNode(withName: "Cube5", recursively: true)!
                cubeNode6 = neoTrellis.childNode(withName: "Cube6", recursively: true)!
                cubeNode7 = neoTrellis.childNode(withName: "Cube7", recursively: true)!
                cubeNode8 = neoTrellis.childNode(withName: "Cube8", recursively: true)!
                //Row 3
                cubeNode9 = neoTrellis.childNode(withName: "Cube9", recursively: true)!
                cubeNode10 = neoTrellis.childNode(withName: "Cube10", recursively: true)!
                cubeNode11 = neoTrellis.childNode(withName: "Cube11", recursively: true)!
                cubeNode12 = neoTrellis.childNode(withName: "Cube12", recursively: true)!
                //Row 4
                cubeNode13 = neoTrellis.childNode(withName: "Cube13", recursively: true)!
                cubeNode14 = neoTrellis.childNode(withName: "Cube14", recursively: true)!
                cubeNode15 = neoTrellis.childNode(withName: "Cube15", recursively: true)!
                cubeNode16 = neoTrellis.childNode(withName: "Cube16", recursively: true)!
                //Row 5
                cubeNode17 = neoTrellis.childNode(withName: "Cube17", recursively: true)!
                cubeNode18 = neoTrellis.childNode(withName: "Cube18", recursively: true)!
                cubeNode19 = neoTrellis.childNode(withName: "Cube19", recursively: true)!
                cubeNode20 = neoTrellis.childNode(withName: "Cube20", recursively: true)!
                //Row 6
                cubeNode21 = neoTrellis.childNode(withName: "Cube21", recursively: true)!
                cubeNode22 = neoTrellis.childNode(withName: "Cube22", recursively: true)!
                cubeNode23 = neoTrellis.childNode(withName: "Cube23", recursively: true)!
                cubeNode24 = neoTrellis.childNode(withName: "Cube24", recursively: true)!
                //Row 7
                cubeNode25 = neoTrellis.childNode(withName: "Cube25", recursively: true)!
                cubeNode26 = neoTrellis.childNode(withName: "Cube26", recursively: true)!
                cubeNode27 = neoTrellis.childNode(withName: "Cube27", recursively: true)!
                cubeNode28 = neoTrellis.childNode(withName: "Cube28", recursively: true)!
                //Row 8
                cubeNode29 = neoTrellis.childNode(withName: "Cube29", recursively: true)!
                cubeNode30 = neoTrellis.childNode(withName: "Cube30", recursively: true)!
                cubeNode31 = neoTrellis.childNode(withName: "Cube31", recursively: true)!
                cubeNode32 = neoTrellis.childNode(withName: "Cube32", recursively: true)!
                
                neoTrellis.eulerAngles.x = 90
                
                neoTrellis.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                planeNode.addChildNode(neoTrellisLabel)
                planeNode.addChildNode(neoTrellis)
                
                node.addChildNode(planeNode)
                
                cubeArray = [cubeNode1, cubeNode2, cubeNode3, cubeNode4, cubeNode5, cubeNode6, cubeNode7, cubeNode8, cubeNode9, cubeNode10,cubeNode11,cubeNode12, cubeNode13, cubeNode14, cubeNode15, cubeNode16, cubeNode17, cubeNode18, cubeNode19, cubeNode20, cubeNode21, cubeNode22, cubeNode23, cubeNode24, cubeNode25, cubeNode26, cubeNode27, cubeNode28, cubeNode29, cubeNode30,cubeNode31,cubeNode32]
                
                print(cubeArray.count)
                
                DispatchQueue.main.async {
                    self.scanLabel.isHidden = true
                    self.sampleMask.isHidden = true
                    
                }
                
            case "GC-3":
                grandCentralLoaded = true
                
                let scale: Float = 0.005
                
                let labelScale: Float = 2
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                let grandCentralLabelScene = SCNScene(named: "art.scnassets/GrandCentralLabel.scn")!
                
                for child in grandCentralLabelScene.rootNode.childNodes {
                    grandCentralLabel.addChildNode(child)
                }
                
                grandCentralLabel.position = SCNVector3Zero
                
                grandCentralLabel.scale = SCNVector3(x: labelScale, y: labelScale, z: labelScale)
                
                let grandCentralScene = SCNScene(named: "art.scnassets/Grand Central.dae")!
                
                for child in grandCentralScene.rootNode.childNodes {
                    grandCentralNode.addChildNode(child)
                }
                
                grandCentralNode.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z)
                
                grandCentralNode.eulerAngles.x = 0
                
                grandCentralNode.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                grandCentralVideo = grandCentralLabel.childNode(withName: "Grand Central plane", recursively: true)!
                
                grandCentralVideo.isHidden = true
                
                planeNode.addChildNode(grandCentralLabel)
                
                planeNode.addChildNode(grandCentralNode)
                
                node.addChildNode(planeNode)
                
                DispatchQueue.main.async {
                    self.scanLabel.isHidden = true
                    self.sampleMask.isHidden = true
                    
                }
                
            case "pyportal":
                pyLoaded = true
                
                let scale: Float = 6.5
                
                let labelScale: Float = 4
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                let pyLabelScene = SCNScene(named: "art.scnassets/PyportalLabel.scn")!
                
                for child in pyLabelScene.rootNode.childNodes {
                    pyLabel.addChildNode(child)
                }
                
                pyLabel.position = SCNVector3Zero
                
                pyLabel.scale = SCNVector3(x: labelScale, y: labelScale, z: labelScale)
                
                let pyScene = SCNScene(named: "art.scnassets/pyPortal.dae")!
                
                for child in pyScene.rootNode.childNodes {
                    pyNode.addChildNode(child)
                }
                
                pyNode.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z)
                
                pyNode.eulerAngles.x = 0
                
                pyNode.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                pyVideo = pyLabel.childNode(withName: "py video", recursively: true)!
                
                pyLabelDescription =  pyLabel.childNode(withName: "pyLabel", recursively: true)!
                
                pyPlayText = pyLabel.childNode(withName: "PPlay video", recursively: true)!
                
                pyStopText = pyLabel.childNode(withName: "PStop video", recursively: true)!
                
                pyVideo.isHidden = true
                
                pyStopText.isHidden = true
                
                pyVidSwitch = false
                
                planeNode.addChildNode(pyLabel)
                
                planeNode.addChildNode(pyNode)
                
                node.addChildNode(planeNode)
                
                DispatchQueue.main.async {
                    self.scanLabel.isHidden = true
                    self.sampleMask.isHidden = true
                    
                }

            case "portal2":
                
                let labelScale: Float = 0.03
                
                let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
                
                plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
                
                let planeNode = SCNNode(geometry: plane)
                
                planeNode.eulerAngles.x = -.pi / 2
                
                let pyLabelScene = SCNScene(named: "art.scnassets/Py_Display.scn")!
                
                for child in pyLabelScene.rootNode.childNodes {
                    pyStaneAloneLabel.addChildNode(child)
                }
                
                pyStaneAloneLabel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z)
                
                pyStaneAloneLabel.scale = SCNVector3(x: labelScale, y: labelScale, z: labelScale)
                
                //ATSAMD21
                pyATSButton = pyStaneAloneLabel.childNode(withName: "py_ATSAMD_Button", recursively: true)!
                
                pyATSInfo = pyStaneAloneLabel.childNode(withName: "py_ATSAMD_Display", recursively: true)!
                
                pyATSInfo.isHidden = true
                

                pyIC2Button = pyStaneAloneLabel.childNode(withName: "py_IC2_Button", recursively: true)!
                
                pyIC2Info = pyStaneAloneLabel.childNode(withName: "py_IC2_Display", recursively: true)!
                
                pyIC2Info.isHidden = true

                
                pySensorButton = pyStaneAloneLabel.childNode(withName: "py_Sensor_Button", recursively: true)!
                
                pySensorInfo = pyStaneAloneLabel.childNode(withName: "py_Sensor_Display", recursively: true)!
                
                pySensorInfo.isHidden = true
                
                
                pyDAButton = pyStaneAloneLabel.childNode(withName: "py_D_A_Button", recursively: true)!
                
                pyDAInfo = pyStaneAloneLabel.childNode(withName: "py_D_A_Display", recursively: true)!
                
                pyDAInfo.isHidden = true
                
                
                pyWifiButton = pyStaneAloneLabel.childNode(withName: "py_Wifi_Button", recursively: true)!
                
                pyWifiInfo = pyStaneAloneLabel.childNode(withName: "py_Wifi_Display", recursively: true)!
                
                pyWifiInfo.isHidden = true
                
                
                pyConnectorButton = pyStaneAloneLabel.childNode(withName: "py_Connector_Button", recursively: true)!
                
                pyConnectorInfo = pyStaneAloneLabel.childNode(withName: "py_Connector_Display", recursively: true)!
                
                pyConnectorInfo.isHidden = true
                
                
                pySpeakerButton = pyStaneAloneLabel.childNode(withName: "py_Speaker_Button", recursively: true)!
                
                pySpeakerInfo = pyStaneAloneLabel.childNode(withName: "py_Speaker_Display", recursively: true)!
                
                pySpeakerInfo.isHidden = true
                
                

                // Create a plane geometry to visualize the initial position of the detected image
                let mainPlane = SCNPlane(width: physicalWidth, height: physicalHeight)
                
                // This bit is important. It helps us create occlusion so virtual things stay hidden behind the detected image
                mainPlane.firstMaterial?.colorBufferWriteMask = .alpha
                
                // Create a SceneKit root node with the plane geometry to attach to the scene graph
                // This node will hold the virtual UI in place
                let mainNode = SCNNode(geometry: mainPlane)
                mainNode.eulerAngles.x = -.pi / 2
                mainNode.renderingOrder = -1
                mainNode.opacity = 1
                
                // Add the plane visualization to the scene
                node.addChildNode(mainNode)
                
                
                    // Introduce virtual content
                   // self.displayDetailView(on: pyStaneAloneLabel, xOffset: physicalWidth + 10)
                    
                    // Animate the WebView to the right
                 //   self.displayWebView(on: pyStaneAloneLabel, xOffset: physicalWidth + 7)
                
                
                
                
                planeNode.addChildNode(pyStaneAloneLabel)
                
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

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //FOR UNIT TESTING VVV
    var productsLoaded = Int()
    var productsOutOfStock = Int()
    
    
    func functionToTest() {
         productsLoaded = 0
         productsOutOfStock = 0
        
         aFuctionForReaction()
    }
    
    
    func aFuctionForReaction(){
        productsLoaded = productsLoaded + 1
        productsOutOfStock = productsLoaded * 5
    }
    

}


