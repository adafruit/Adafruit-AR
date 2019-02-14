//Newly replaced from Github
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
    
    
    // For Circuit Playground Express Model
    var cpxNode = SCNNode()
    var cpxLabel = SCNNode()
    
    var cpxLabelDescription = SCNNode()
    var cpxPlayText = SCNNode()
    var cpxStopText = SCNNode()
    var cpxVidSwitch = Bool()
    
    
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
    
    
    //For NeoTrellis M4 Model
    var neoTrellis = SCNNode()
    var neoTrellisLabel = SCNNode()
    
    var neoDescription = SCNNode()
    var neoPlayText = SCNNode()
    var neoStopText = SCNNode()
    var neoSwitch = Bool()
    var neoVideo = SCNNode()
    
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
    
    // URL's for Product Videos
    let crickitVideoURL = URL(string: "https://s3.amazonaws.com/adafruit-ar/video/product_videos/crickit.mp4")
    let hallowingVideoURL = URL(string: "https://s3.amazonaws.com/adafruit-ar/video/product_videos/hallowing.mp4")
    let cpxVidURL = URL(string: "https://s3.amazonaws.com/adafruit-ar/video/product_videos/cpx.mp4")
    
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
    
    // Highlight Nodes in NeoTrellis
    func highlightNode(_ node: SCNNode) {
        
        node.highlight()

        cubeArray = cubeArray.filter { $0 != node }
        
        cubeArray.forEach { cube in
            print("Cubes are dehighlighted expect one")
            cube.dehighlight()
            cube.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
            
        }
        
        cubeArray = [cubeNode1, cubeNode2, cubeNode3, cubeNode4, cubeNode5, cubeNode6, cubeNode7, cubeNode8, cubeNode9, cubeNode10,cubeNode11,cubeNode12, cubeNode13, cubeNode14, cubeNode15, cubeNode16, cubeNode17, cubeNode18, cubeNode19, cubeNode20, cubeNode21, cubeNode22, cubeNode23, cubeNode24, cubeNode25, cubeNode26, cubeNode27, cubeNode28, cubeNode29, cubeNode30,cubeNode31,cubeNode32]
        
    }
    
    
    // Random Color Function for NeoTrellis Seqencer
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
        touchLightButton.setBackgroundImage(UIImage(named: "moon.png"), for: .normal)
        
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
                    touchLightButton.setBackgroundImage(UIImage(named: "Sun.png"), for: .normal)
                } else {
                    touchLightButton.setBackgroundImage(UIImage(named: "moon.png"), for: .normal)
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
    
    // Video for HalloWing eyeball animation
    func halloWingEyeVideo() {
        //This is the video for HalloWing's Eye Ball animation

        // flip video upside down
        playerNode.yScale = -1
        playerNode.name = "playerNode"
        
        // create SKScene and set player node on it
        spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
        
        spriteKitScene.scaleMode = .aspectFill
        
        playerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        
        playerNode.size = spriteKitScene.size
        
        spriteKitScene.addChild(playerNode)
        
        
        videoPlane.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        videoPlane.geometry?.firstMaterial?.isDoubleSided = true
        
        playerNode.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil)
        { notification in
            
            self.player.seek(to: kCMTimeZero)
            
            self.player.play()
            
            print("reset Video")
            
        }
    }
    
    //For Promo Video Playback
    func playCrickitVideo() {
        
        crickitPlayer = AVPlayer(url: crickitVideoURL!)
        crickitPlayerNode = SKVideoNode(avPlayer: crickitPlayer)
        
        // flip video upside down
        crickitPlayerNode.yScale = -1
        crickitPlayerNode.name = "CrickitplayerNode"
        
        // create SKScene and set player node on it
        spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
        
        spriteKitScene.scaleMode = .aspectFill
        
        crickitPlayerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        
        crickitPlayerNode.size = spriteKitScene.size
        
        spriteKitScene.addChild(crickitPlayerNode)
        
        
        crickitVideo.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        crickitVideo.geometry?.firstMaterial?.isDoubleSided = true
        
        crickitPlayerNode.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: crickitPlayer.currentItem, queue: nil)
        { notification in
            
            self.crickitPlayer.seek(to: kCMTimeZero)
            self.crickitPlayer.play()
        }
    }

    func playHallowingVideo() {
        
        halloWingPlayer = AVPlayer(url: hallowingVideoURL!)
        halloWingPlayerNode = SKVideoNode(avPlayer: halloWingPlayer)
        
        // flip video upside down
        halloWingPlayerNode.yScale = -1
        halloWingPlayerNode.name = "HallowingplayerNode"
        
        // create SKScene and set player node on it
        spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
        
        spriteKitScene.scaleMode = .aspectFill
        
        halloWingPlayerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        
        halloWingPlayerNode.size = spriteKitScene.size
        
        spriteKitScene.addChild(halloWingPlayerNode)
        
        
        halloWingVideo.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        halloWingVideo.geometry?.firstMaterial?.isDoubleSided = true
        
        halloWingPlayerNode.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: halloWingPlayer.currentItem, queue: nil)
        { notification in
            
            self.halloWingPlayer.seek(to: kCMTimeZero)
            self.halloWingPlayer.play()
        }
    }
    
    func playCPXVideo() {
        
        cpxPlayer = AVPlayer(url: cpxVidURL!)
        cpxPlayerNode = SKVideoNode(avPlayer: cpxPlayer)
        
        // flip video upside down
        cpxPlayerNode.yScale = -1
        cpxPlayerNode.name = "CPXplayerNode"
        
        // create SKScene and set player node on it
        spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
        
        spriteKitScene.scaleMode = .aspectFill
        
        cpxPlayerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        
        cpxPlayerNode.size = spriteKitScene.size
        
        spriteKitScene.addChild(cpxPlayerNode)
        
        
        cpxVideo.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        cpxVideo.geometry?.firstMaterial?.isDoubleSided = true
        
        cpxPlayerNode.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: cpxPlayer.currentItem, queue: nil)
        { notification in
            
            self.cpxPlayer.seek(to: kCMTimeZero)
            self.cpxPlayer.play()
        }
    }
    
    //Gesture Recognizers & Actions
    func registerTapRecognizer() {
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        let tapGestureRecognizer =  UITapGestureRecognizer (target:self ,action : #selector (tapped))
        self.qrSceneView.addGestureRecognizer(tapGestureRecognizer)
        self.qrSceneView.addGestureRecognizer(pinchGestureRecognizer)
        
    }
    
    //Tap Gesture
    @objc func tapped(sender: UITapGestureRecognizer) {
        
        let sceneView = sender.view as! ARSCNView
        
        let hitResults = sceneView.hitTest(view.center, types: .existingPlaneUsingExtent)
        
        let currentTouchPoint = sender.location(in: self.qrSceneView)
        
        if !hitResults.isEmpty == false  {
            print("Surface Touched")
            
        } else {
            
            print("DID NOT LOAD NODE.")
        }
        
        if sender.state == .ended  {
            
            let location: CGPoint = sender.location(in: sceneView)
            
            let hits = self.qrSceneView.hitTest(location, options: nil)
            
            if hits.count > 0 {
                
                
                let result = hits[0] as! SCNHitTestResult
                
                let node = result.node
                
                
                fadeOut = SCNAction.fadeOut(duration: 1)
                
                fadeIn = SCNAction.fadeIn(duration: 0.0001)
                
                if (node.name) == "crickitLabel2"{
                    
                    let alert = UIAlertController(title: "Leaving Adafruit AR", message: "Would you like to visit the Crickit Learn Guide?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "I Don't Like Nice Things", style: .default, handler: nil))
                    
                    alert.addAction(UIAlertAction(title: "Lets Go!", style: .default, handler: { (nil) in
                        
                        if let url = URL(string: "https://learn.adafruit.com/adafruit-crickit-creative-robotic-interactive-construction-kit") {
                            UIApplication.shared.open(url, options: [:])
                        }
                        
                    }))
                    
                    present(alert, animated: true, completion: nil)
                    
                    
                    print("Launch Circuit Playground Guide")
                    
                }
                
                    
                    
                    //Grand Central Learn Guide
                
                else if (node.name) == "Grand Central Learn Guide"{
                    
                    print("Grand Central Learn Guide Button Pressed.")
                    
                    let alert = UIAlertController(title: "Leaving Adafruit AR", message: "Would you like to visit the Grand Central Learn Guide?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "I Don't Like Nice Things", style: .default, handler: nil))
                    
                    alert.addAction(UIAlertAction(title: "Lets Go!", style: .default, handler: { (nil) in
                        
                        if let url = URL(string: "https://learn.adafruit.com/adafruit-grand-central") {
                            UIApplication.shared.open(url, options: [:])
                        }
                        
                    }))
                    
                    present(alert, animated: true, completion: nil)
                    
                    
                    print("Launch Grand Central Guide...")
                    
                }
                    
               else if (node.name) == "Circuit Learn Guide"{
                    
                    let alert = UIAlertController(title: "Leaving Adafruit AR", message: "Would you like to visit the Circuit Playground Express Learn Guide?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "I Don't Like Nice Things", style: .default, handler: nil))
                    
                    alert.addAction(UIAlertAction(title: "Lets Go!", style: .default, handler: { (nil) in
                        
                        if let url = URL(string: "https://learn.adafruit.com/adafruit-circuit-playground-express") {
                            UIApplication.shared.open(url, options: [:])
                        }
                        
                    }))
                    
                    present(alert, animated: true, completion: nil)
                    
                    
                    print("Launching Circuit Playground Guide...")
                    
                }
                    
                    
                else if (node.name) == "Crickit video2"{
                    
                    if crickitVideoSwitch == false {
                        
                        crickitPlayText.isHidden = true
                        crickitStopText.isHidden = false
                        crickitVideo.isHidden = false
                        
                        playCrickitVideo()
                        print("on")
                        
                    } else{
                        
                        print("off")
                        
                        crickitPlayText.isHidden = false
                        crickitStopText.isHidden = true
                        crickitVideo.isHidden = true
                        
                        self.crickitPlayer.seek(to: kCMTimeZero)
                        crickitPlayerNode.pause()
                        crickitVideo.geometry?.firstMaterial?.diffuse.contents = nil
                        
                    }
                    
                    crickitVideoSwitch = !crickitVideoSwitch
                    
                }
                    
                else if (node.name) == "HallowLabel"{
                    
                    
                    let alert = UIAlertController(title: "Leaving Adafruit AR", message: "Would you like to visit the HalloWing Learn Guide?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "I Don't Like Nice Things", style: .default, handler: nil))
                    
                    alert.addAction(UIAlertAction(title: "Lets Go!", style: .default, handler: { (nil) in
                        
                        if let url = URL(string: "https://learn.adafruit.com/adafruit-hallowing?view=all") {
                            UIApplication.shared.open(url, options: [:])
                        }
                        
                    }))
                    
                    present(alert, animated: true, completion: nil)
                    
                    
                    print("Launch HalloWing Learn Guide...")
                    
                    
                }
                    
                else if (node.name) == "Hallowing video2" {
                    
                    
                    if hallowingVideoSwitch == false {
                        print("Test1")
                        
                        hallowingPlayText.isHidden = true
                        hallowingStopText.isHidden = false
                        hallowingLabelDescription.isHidden = true
                        halloWingVideo.isHidden = false
                        playHallowingVideo()
                        hallowingVideoSwitch = true
                        
                    } else if hallowingVideoSwitch == true {
                        print("Test2")
                        hallowingPlayText.isHidden = false
                        hallowingStopText.isHidden = true
                        hallowingLabelDescription.isHidden = false
                        self.halloWingPlayer.seek(to: kCMTimeZero)
                        halloWingPlayerNode.pause()
                        halloWingVideo.geometry?.firstMaterial?.diffuse.contents = nil
                        
                        
                        hallowingVideoSwitch = false
                        halloWingVideo.isHidden = true
                    }
                }
                    
                    
                    
                else if (node.name) == "Circuit video button2"{
                    
                    
                    if cpxVidSwitch == false {
                        
                        
                        cpxPlayText.isHidden = true
                        cpxStopText.isHidden = false
                        cpxLabelDescription.isHidden = true
                        cpxVideo.isHidden = false
                        playCPXVideo()
                        cpxVidSwitch = true
                        
                    } else if cpxVidSwitch == true {
                        
                        cpxPlayText.isHidden = false
                        cpxStopText.isHidden = true
                        cpxLabelDescription.isHidden = false
                        self.cpxPlayer.seek(to: kCMTimeZero)
                        cpxPlayerNode.pause()
                        cpxVideo.geometry?.firstMaterial?.diffuse.contents = nil
                        
                        
                        cpxVidSwitch = false
                        cpxVideo.isHidden = true
                    }
                }
                    
                    //- 2
                else if (node.name) == "Assembly Plane2"{
                    
                    print("Testing")
                    
                    
                    if crickitSwitch == false {
                        
                        unassembleText.isHidden = false
                        
                        assembleText.isHidden = true
                        
                        crickitSolo.isHidden = true
                        
                        crickitAnimation.isHidden = false
                        
                        crickitSwitch = true
                        
                    } else if crickitSwitch == true {
                        
                        crickitSwitch = false
                        
                        assembleText.isHidden = false
                        
                        unassembleText.isHidden = true
                        
                        crickitSolo.isHidden = false
                        
                        crickitAnimation.isHidden = true
                    }
                    
                }
                    
                else if (node.name) == "NeoTrellis Learn Guide "{
                    
                    
                    let alert = UIAlertController(title: "Leaving Adafruit AR", message: "Would you like to visit the NeoTrellis M4 Express Learn Guide?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "I Don't Like Nice Things", style: .default, handler: nil))
                    
                    alert.addAction(UIAlertAction(title: "Lets Go!", style: .default, handler: { (nil) in
                        
                        if let url = URL(string: "https://learn.adafruit.com/adafruit-neotrellis-m4/overview") {
                            UIApplication.shared.open(url, options: [:])
                        }
                    }))
                    
                    present(alert, animated: true, completion: nil)
                    
                    print("Launching NeoTrellis Guide...")
                    
                } else if (node.name) == "NeoTrellis Video"{
                    
                    
                    if neoSwitch == false {
                        
                        neoPlayText.isHidden = true
                        neoStopText.isHidden = false
                        neoDescription.isHidden = true
                        neoVideo.isHidden = false
                        
                        neoSwitch = true
                        
                    } else if neoSwitch == true {
                        
                        neoPlayText.isHidden = false
                        neoStopText.isHidden = true
                        neoDescription.isHidden = false
                        
                        neoSwitch = false
                        neoVideo.isHidden = true
                    }
                    
                }
                    
                    
                else if (node.name) == "Cube1"{
                    
                    if nodeLit1 {
                        
                        cubeNode1.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode1.dehighlight()
                        nodeLit1 = true
                        
                    } else {
                        randomColor(cubeNode1)
                        highlightNode(cubeNode1)
                        nodeLit1 = false
                    }
                    
                }else if (node.name) == "Cube2"{
                    
                    if nodeLit2 {
                        
                        cubeNode2.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode2.dehighlight()
                        nodeLit2 = true
                        
                    } else {
                        randomColor(cubeNode2)
                        highlightNode(cubeNode2)
                        nodeLit2 = false
                    }
                }
                    
                else if (node.name) == "Cube3"{
                    
                    if nodeLit3 {
                        
                        cubeNode3.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode3.dehighlight()
                        nodeLit3 = true
                        
                    } else {
                        randomColor(cubeNode3)
                        highlightNode(cubeNode3)
                        nodeLit3 = false
                    }
                    
                }
                    
                else if (node.name) == "Cube4"{
                    
                    if nodeLit4 {
                        
                        cubeNode4.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode4.dehighlight()
                        nodeLit4 = true
                        
                    } else {
                        randomColor(cubeNode4)
                        highlightNode(cubeNode4)
                        nodeLit4 = false
                    }
                    
                    
                    
                }
                    
                else if (node.name) == "Cube5"{
                    
                    if nodeLit5 {
                        
                        cubeNode5.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode5.dehighlight()
                        nodeLit5 = true
                        
                        
                    } else {
                        randomColor(cubeNode5)
                        highlightNode(cubeNode5)
                        nodeLit5 = false
                    }
                    
                    
                    
                }
                else if (node.name) == "Cube6"{
                    
                    if nodeLit6 {
                        
                        cubeNode6.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode6.dehighlight()
                        nodeLit6 = true
                        
                    } else {
                        randomColor(cubeNode6)
                        highlightNode(cubeNode6)
                        nodeLit6 = false
                    }
                    
                    
                    
                }
                else if (node.name) == "Cube7"{
                    
                    if nodeLit7 {
                        
                        cubeNode7.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode7.dehighlight()
                        nodeLit7 = true
                        
                    } else {
                        randomColor(cubeNode7)
                        highlightNode(cubeNode7)
                        
                        nodeLit7 = false
                    }
                    
                    
                    
                }
                    
                    
                else if (node.name) == "Cube8"{
                    
                    if nodeLit8 {
                        
                        cubeNode8.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode8.dehighlight()
                        nodeLit8 = true
                        
                    } else {
                        randomColor(cubeNode8)
                        highlightNode(cubeNode8)
                        nodeLit8 = false
                        
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube9"{
                    
                    if nodeLit9 {
                        
                        cubeNode9.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode9.dehighlight()
                        nodeLit9 = true
                        
                    } else {
                        randomColor(cubeNode9)
                        highlightNode(cubeNode9)
                        nodeLit9 = false
                        
                    }
                    
                    
                }
                else if (node.name) == "Cube10"{
                    
                    if nodeLit10 {
                        
                        cubeNode10.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode10.dehighlight()
                        nodeLit10 = true
                        
                        
                    } else {
                        randomColor(cubeNode10)
                        highlightNode(cubeNode10)
                        nodeLit10 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube11"{
                    
                    if nodeLit11 {
                        
                        cubeNode11.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode11.dehighlight()
                        nodeLit11 = true
                        
                        
                    } else {
                        randomColor(cubeNode11)
                        highlightNode(cubeNode11)
                        nodeLit11 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube12"{
                    
                    if nodeLit12 {
                        
                        cubeNode12.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode12.dehighlight()
                        nodeLit12 = true
                        
                        
                    } else {
                        randomColor(cubeNode12)
                        highlightNode(cubeNode12)
                        nodeLit12 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube13"{
                    
                    if nodeLit13 {
                        
                        cubeNode13.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode13.dehighlight()
                        nodeLit13 = true
                        
                        
                    } else {
                        randomColor(cubeNode13)
                        highlightNode(cubeNode13)
                        nodeLit13 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube14"{
                    
                    if nodeLit14 {
                        
                        cubeNode14.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode14.dehighlight()
                        nodeLit14 = true
                        
                        
                    } else {
                        randomColor(cubeNode14)
                        highlightNode(cubeNode14)
                        nodeLit14 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube15"{
                    
                    if nodeLit15 {
                        
                        cubeNode15.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode15.dehighlight()
                        nodeLit15 = true
                        
                        
                    } else {
                        randomColor(cubeNode15)
                        highlightNode(cubeNode15)
                        nodeLit15 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube16"{
                    
                    if nodeLit16 {
                        
                        cubeNode16.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode16.dehighlight()
                        nodeLit16 = true
                        
                        
                    } else {
                        randomColor(cubeNode16)
                        highlightNode(cubeNode16)
                        nodeLit16 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube17"{
                    
                    if nodeLit17 {
                        
                        cubeNode17.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode17.dehighlight()
                        nodeLit17 = true
                        
                        
                    } else {
                        randomColor(cubeNode17)
                        highlightNode(cubeNode17)
                        nodeLit17 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube18"{
                    
                    if nodeLit18 {
                        
                        cubeNode18.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode18.dehighlight()
                        nodeLit18 = true
                        
                        
                    } else {
                        randomColor(cubeNode18)
                        highlightNode(cubeNode18)
                        nodeLit18 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube19"{
                    
                    if nodeLit19 {
                        
                        cubeNode19.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode19.dehighlight()
                        nodeLit19 = true
                        
                        
                    } else {
                        randomColor(cubeNode19)
                        highlightNode(cubeNode19)
                        nodeLit19 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube20"{
                    
                    if nodeLit20 {
                        
                        cubeNode20.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode20.dehighlight()
                        nodeLit20 = true
                        
                        
                    } else {
                        randomColor(cubeNode20)
                        highlightNode(cubeNode20)
                        nodeLit20 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube21"{
                    
                    if nodeLit21 {
                        
                        cubeNode21.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode21.dehighlight()
                        nodeLit21 = true
                        
                        
                    } else {
                        randomColor(cubeNode21)
                        highlightNode(cubeNode21)
                        nodeLit21 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube22"{
                    
                    if nodeLit22 {
                        
                        cubeNode22.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode22.dehighlight()
                        nodeLit22 = true
                        
                        
                    } else {
                        randomColor(cubeNode22)
                        highlightNode(cubeNode22)
                        nodeLit22 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube23"{
                    
                    if nodeLit23 {
                        
                        cubeNode23.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode23.dehighlight()
                        nodeLit23 = true
                        
                        
                    } else {
                        randomColor(cubeNode23)
                        highlightNode(cubeNode23)
                        nodeLit23 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube24"{
                    
                    if nodeLit24 {
                        
                        cubeNode24.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode24.dehighlight()
                        nodeLit24 = true
                        
                        
                    } else {
                        randomColor(cubeNode24)
                        highlightNode(cubeNode24)
                        nodeLit24 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube25"{
                    
                    if nodeLit25 {
                        
                        cubeNode25.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode25.dehighlight()
                        nodeLit25 = true
                        
                        
                    } else {
                        randomColor(cubeNode25)
                        highlightNode(cubeNode25)
                        nodeLit25 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube26"{
                    
                    if nodeLit26 {
                        
                        cubeNode26.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode26.dehighlight()
                        nodeLit26 = true
                        
                        
                    } else {
                        randomColor(cubeNode26)
                        highlightNode(cubeNode26)
                        nodeLit26 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube27"{
                    
                    if nodeLit27 {
                        
                        cubeNode27.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode27.dehighlight()
                        nodeLit27 = true
                        
                    } else {
                        randomColor(cubeNode27)
                        highlightNode(cubeNode27)
                        nodeLit27 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube28"{
                    
                    if nodeLit28 {
                        
                        cubeNode28.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode28.dehighlight()
                        nodeLit28 = true
                        
                    } else {
                        randomColor(cubeNode28)
                        highlightNode(cubeNode28)
                        nodeLit28 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube29"{
                    
                    if nodeLit29 {
                        
                        cubeNode29.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode29.dehighlight()
                        nodeLit29 = true
                        
                        
                    } else {
                        randomColor(cubeNode29)
                        highlightNode(cubeNode29)
                        nodeLit29 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube30"{
                    
                    if nodeLit30 {
                        
                        cubeNode30.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode30.dehighlight()
                        nodeLit30 = true
                        
                    } else {
                        randomColor(cubeNode30)
                        highlightNode(cubeNode30)
                        nodeLit30 = false
                    }
                    
                    
                }
                else if (node.name) == "Cube31"{
                    
                    if nodeLit31 {
                        
                        cubeNode31.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode31.dehighlight()
                        nodeLit31 = true
                        
                        
                    } else {
                        randomColor(cubeNode31)
                        highlightNode(cubeNode31)
                        nodeLit31 = false
                    }
                    
                    
                }
                    
                else if (node.name) == "Cube32"{
                    
                    if nodeLit32 {
                        
                        cubeNode32.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                        cubeNode32.dehighlight()
                        nodeLit32 = true
                        
                    } else {
                        randomColor(cubeNode32)
                        highlightNode(cubeNode32)
                        nodeLit32 = false
                        
                    }
                    
                    
                }
                    
                else {
                    print("Nothing Detected.")
                }
                
            }
        }
    }
    
  
    //Pinch Gesture
    @objc func pinch(sender: UIPinchGestureRecognizer) {
        
        let sceneView = sender.view as! ARSCNView
        let pinchLocation = sender.location(in: qrSceneView)
        let hitResults = sceneView.hitTest(pinchLocation)
        
        if !hitResults.isEmpty {
            
            let pinchAction = SCNAction.scale(by: sender.scale, duration: 0)
            print(sender.scale)

            
            grandCentralNode.runAction(pinchAction)
            crickitNode.runAction(pinchAction)
            halloWingNode.runAction(pinchAction)
            cpxNode.runAction(pinchAction)
           
            sender.scale = 1.0
            
        }
    }
    
    
    // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        //This node is used to place the Plane used to plant the AR models
        let node = SCNNode()
    
        if let imageAnchor = anchor as? ARImageAnchor {

            switch imageAnchor.referenceImage.name {
   
            //HalloWing QR Code Reference
            case "HallowingQRcode_v2":
                
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
                
                self.scanLabel.isHidden = true
                
                sampleMask.isHidden = true
                
                
            // CPX QR Code Reference
            case "CPX-QRCode_v2":
                
                let scale: Float = 0.05
                
                let labelScale: Float = 1.6
                
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
               
                cpxNode.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z)
                
                cpxNode.eulerAngles.x = 90
                
                cpxNode.scale = SCNVector3(x: scale, y: scale, z: scale)


                
                planeNode.addChildNode(cpxNode)
                
                planeNode.addChildNode(cpxLabel)
                
                node.addChildNode(planeNode)
                
                self.scanLabel.isHidden = true
                
                sampleMask.isHidden = true
                
          
            //Newer Crickit QR Code Reference
            case "CrickitQRCode_v2":
                
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
                
                scanLabel.isHidden = true
                
                sampleMask.isHidden = true
                
                
            case "NeoTrellis_v2":
                
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
                
                self.scanLabel.isHidden = true
                
                sampleMask.isHidden = true
                
                
            case "GC-3":
                
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
                
                //grandCentralLabel =  grandCentralLabel.childNode(withName: "Grand Central Learn Guide", recursively: true)!
                
                //grandCPlayText = cpxLabel.childNode(withName: "CPlay video", recursively: true)!
                
                //grandCStopText = cpxLabel.childNode(withName: "CStop video", recursively: true)!
                
                grandCentralVideo.isHidden = true
                
                //grandCStopText.isHidden = true
                
                //  grandCVidSwitch = false

                planeNode.addChildNode(grandCentralLabel)
                
                planeNode.addChildNode(grandCentralNode)
                
                node.addChildNode(planeNode)
                
                self.scanLabel.isHidden = true
                
                sampleMask.isHidden = true
                
            default:
                break
            }
            
        }
        
        return node
        
    }

}

