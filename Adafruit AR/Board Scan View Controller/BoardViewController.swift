//
//  BoardViewController.swift
//  Adafruit AR
//
//  Created by Trevor B on 5/20/19.
//  Copyright © 2019 Adafruit. All rights reserved.
//

import UIKit
import ARKit
import RealityKit


@available(iOS 13.0, *)
class BoardViewController: UIViewController, ARSCNViewDelegate {
    
    
    var audioPlayer : AVAudioPlayer?

    //For Minerva AR
    var minervaModel = SCNNode()
    var leftWing = SCNNode()
    var rightWing = SCNNode()
    var openEyes = SCNNode()
    var beak = SCNNode()
    
    var animationWasPlayed = false
    
    var minervaPartsLoaded = false

    
    //MARK:- Tarot Cards
    
    var starCard = SCNNode()
    var temperanceCard = SCNNode()
    var deathCard = SCNNode()
    var WOFCard = SCNNode()
    var hermitCard = SCNNode()
    var judgementCard = SCNNode()
    var pentacleCard = SCNNode()
    
    // MARK:- Tarot Cards 1.10.1
    var THMCard = SCNNode()
    var towerCard = SCNNode()
    var loversCard = SCNNode()
    var sunCard = SCNNode()
    var justiceCard = SCNNode()
    var moonCard = SCNNode()
    var worldCard = SCNNode()
    var devilCard = SCNNode()
    
    
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

    var isReadyToScan = false

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

        startImageTracking()
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
    
    func sampleMaskSetup() {
       
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
   
        maskLayer.addSublayer(squareLayer)
        
        self.view.insertSubview(sampleMask, at: 1)
        
    
        effect = visualBoardEffectView.effect
    
        //Removes the effect that was applied
        visualBoardEffectView.effect = nil
        
        animateIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        // Set the view's delegate
        boardSceneView.delegate = self

        boardSceneView.session.delegate = self as? ARSessionDelegate





//        let worldAnchor = ARWorldAnchor(column3: [0, 0,-4, 1])
//        boardSceneView.session.add(anchor: worldAnchor)
        // Set the scene to the view
        boardSceneView.scene = scene
        
        sampleMaskSetup()
        
        loadMinervaModel()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }



    func startImageTracking (){
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()



        guard let trackedImages = ARReferenceImage.referenceImages(inGroupNamed: "Photos", bundle: Bundle.main) else {
            print("No images available")
            return
        }

        configuration.trackingImages = trackedImages
        configuration.maximumNumberOfTrackedImages = 7
        configuration.isAutoFocusEnabled = true

        // Run the view's session
        boardSceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }



    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        boardSceneView.session.pause()
        
    }
    
    func minervaWingAnimation () {
        
        let hoverUp = SCNAction.moveBy(x: 0, y: 2, z: 0, duration: 2.5)
                
        let hoverDown = SCNAction.moveBy(x: 0, y: -2, z: 0, duration: 2.5)
                
        let hoverSequence = SCNAction.sequence([hoverUp, hoverDown])
        
        _ = SCNAction.repeatForever(hoverSequence)
        
        let rotateAnimation = SCNAction.rotateTo(x: 0, y: 0, z: -0.3, duration: 0.1)
        rotateAnimation.timingMode = .linear
        
        let rotateAnimationReverse = SCNAction.rotateTo(x: 0, y: 0, z: 0.3, duration: 0.1)
        rotateAnimationReverse.timingMode = .linear
        
        let headReset = SCNAction.rotateTo(x: -0.01, y: 0, z: -0.0, duration: 0.1)
        
        _ = SCNAction.sequence([rotateAnimation, rotateAnimationReverse, rotateAnimation, rotateAnimationReverse, rotateAnimation, rotateAnimationReverse, headReset])

    }
    
    func minervaTalk(node: SCNNode){
    
        node.rotation = SCNVector4(0, 0, 180, 0)
        
        let rotateUp = SCNAction.rotateTo(x: -30, y: 0, z: 0, duration: 0.2)
       rotateUp.timingMode = .easeInEaseOut
      

        let rotateDown = SCNAction.rotateTo(x: -29.2, y: 0, z: 0, duration: 0.4)
       rotateDown.timingMode = .easeInEaseOut
        
        
        let rotateSequence = SCNAction.sequence([rotateUp, rotateDown])

        let rotateforever1 = SCNAction.repeat(rotateSequence, count: 40)
        _ = SCNAction.repeatForever(rotateSequence)
        node.runAction(rotateforever1)
    }
    
    
    
    private func minervaIntroAnimation () {
        
        let scale: Float = 0.0000005
        
        let scaleAction = SCNAction.scale(to: 0.03, duration: 7)
        scaleAction.timingMode = .easeOut
        
        minervaModel.scale = SCNVector3(x: scale, y: scale, z: scale)
        minervaModel.runAction(scaleAction)
        
        animationWasPlayed = true
    
    }
    
    func hoverModel(body: SCNNode){
        
        let hoverUp = SCNAction.moveBy(x: 0, y: 0.13, z: 0, duration: 1.3)
        hoverUp.timingMode = .easeInEaseOut
        
        let hoverDown = SCNAction.moveBy(x: 0, y: -0.13, z: 0, duration: 1.3)
        hoverDown.timingMode = .easeInEaseOut
        
        let hoverSequence = SCNAction.sequence([hoverUp, hoverDown])
        
        let hoverForever = SCNAction.repeatForever(hoverSequence)
        
        body.runAction(hoverForever)
        
    }
    
    func minervaAnimation(eyes: SCNNode, rightWing: SCNNode, leftWing: SCNNode) {
        
        let eyesShut = SCNAction.hide()
        let kEyesOpen = SCNAction.unhide()

        let blinkWaitShort = SCNAction.wait(duration: 0.1)
       
        let blinkWaitLong = SCNAction.wait(duration: 2)
        
        let blinkSequence = SCNAction.sequence([kEyesOpen, blinkWaitLong,eyesShut,blinkWaitShort,kEyesOpen,blinkWaitShort,eyesShut,blinkWaitShort])
        
        let blinkForever = SCNAction.repeatForever(blinkSequence)

        let rotateUp = SCNAction.rotateTo(x: 0, y: 0, z: 2.5, duration: 0.12)
       rotateUp.timingMode = .easeInEaseOut
      
        let rotateDown = SCNAction.rotateTo(x: 0, y: 0, z: 3.2, duration: 0.12)
       rotateDown.timingMode = .easeInEaseOut
       
        let rotateUpAlt = SCNAction.rotateTo(x: 0, y: 0, z: -2.5, duration: 0.12)
       rotateUpAlt.timingMode = .easeInEaseOut
      
        let rotateDownAlt = SCNAction.rotateTo(x: 0, y: 0, z: -3.2, duration: 0.12)
       rotateDownAlt.timingMode = .easeInEaseOut


        let rotateSequence = SCNAction.sequence([rotateUp, rotateDown])
        let rotateSequenceAlt = SCNAction.sequence([rotateUpAlt, rotateDownAlt])
        let repeatForever = SCNAction.repeatForever(rotateSequence)
        let repeatForeverAlt = SCNAction.repeatForever(rotateSequenceAlt)


        leftWing.runAction(repeatForever)
        rightWing.runAction(repeatForeverAlt)
        eyes.runAction(blinkForever)
       
    }
    
  
    
    
    
    
    func addRotationAnimation(node: SCNNode) {
        let rotateOne = SCNAction.rotateBy(x: 0, y: 0, z: CGFloat(Float.pi), duration: 3.0)
        let repeatForever = SCNAction.repeatForever(rotateOne)
        node.runAction(repeatForever)
    }
    
    func cardOpacity(node: SCNNode){
        let fadeIn = SCNAction.fadeIn(duration: 2)
        let fadeInWait1 = SCNAction.wait(duration: 16)
        let fadeInWait2 = SCNAction.wait(duration: 2)
        let fadeInOut = SCNAction.fadeOut(duration: 1)
        
        let fadeInSequence = SCNAction.sequence([fadeInWait1,fadeIn, fadeInWait2,fadeInOut])
        node.opacity = 0.0
        node.runAction(fadeInSequence)
    }
    
    //Create AR Object
    func ARObjectToScene(ARObject: SCNNode, ARScene: SCNScene, planeNode: SCNNode, size: SCNVector3){
        
        for child in ARScene.rootNode.childNodes {
           
            ARObject.addChildNode(child)
     
        }
        
        ARObject.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
        ARObject.scale = SCNVector3(x: size.x, y: size.y, z: size.z)
        ARObject.eulerAngles.x = -.pi / 2
        
        planeNode.addChildNode(ARObject)
        
    }
    
    //Create AR Plane
    func ARPlaneAnchor(imageReferenceAnchor: ARImageAnchor, mainNode: SCNNode) {
        
        let plane = SCNPlane(width: imageReferenceAnchor.referenceImage.physicalSize.width, height: imageReferenceAnchor.referenceImage.physicalSize.height)

        plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 0.0)
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -.pi / 2
        
        mainNode.addChildNode(planeNode)
        
        DispatchQueue.main.async {
           
            self.scanLabel.isHidden = true
            self.sampleMask.isHidden = true
            
        }
        print("Plane node was launched")
        
        
    }
    
    //Create AR Plane
    func SwiftUIARPlaneAnchor(imageReferenceAnchor: ARImageAnchor, mainNode: SCNNode) {
        
        _ = SCNMaterial()
        
        let plane = SCNPlane(width: imageReferenceAnchor.referenceImage.physicalSize.width + 0.5, height: imageReferenceAnchor.referenceImage.physicalSize.height  + 0.5)

        plane.firstMaterial?.diffuse.contents = UIColor(white: 0, alpha: 0)
        
        let planeNode = SCNNode(geometry: plane)
        planeNode.eulerAngles.x = -.pi / 2
        
       // imageMaterial.lightingModel = .constant
        
     //   planeNode.geometry?.materials = [imageMaterial]
        
        mainNode.addChildNode(planeNode)
        
        DispatchQueue.main.async {
           
            self.scanLabel.isHidden = true
            self.sampleMask.isHidden = true
            
        }
        print("SwiftUI Plane node was launched")
        
        
    }
    
    // MARK: - ARSCNViewDelegate
   

    
    func loadMinervaModel (){
        

        
        let minervaScene = SCNScene(named: "art.scnassets/Minerva.scn")!
        
        for child in minervaScene.rootNode.childNodes {
           
            minervaModel.addChildNode(child)
     
        }
        
        leftWing = minervaModel.childNode(withName: "Left_Wing", recursively: true)!

        rightWing = minervaModel.childNode(withName: "Right_Wing", recursively: true)!

        openEyes = minervaModel.childNode(withName: "Eye_Gear", recursively: true)!
         
        beak = minervaModel.childNode(withName: "Lower_Movable_Beak", recursively: true)!
       
        minervaModel.scale = SCNVector3(x: 0.03, y: 0.03, z: 0.03)

        
        
    }
  
    
    
    
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        //This node is used to place the Plane used to plant AR models.
        let node = SCNNode()

        if let imageAnchor = anchor as? ARImageAnchor {

            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width + 0.5, height:
            imageAnchor.referenceImage.physicalSize.height  + 0.5)

            plane.firstMaterial?.diffuse.contents = UIColor(white: 0, alpha: 0)
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
            switch (imageAnchor.referenceImage.name) {
            
            case "TemperanceCard":
              
                ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
             // Card
                ARObjectToScene(ARObject: temperanceCard, ARScene: ARScenes.temperanceCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: temperanceCard)
                
                temperanceCard.opacity = 0.0

                temperanceCard.position.x = (-0.2)
                
                addRotationAnimation(node: temperanceCard)
               
               
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                
                if animationWasPlayed == false {
                                   minervaIntroAnimation()
                               }else {
                                   print("Intro animation was played.")
                               }
                
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                
                audioPlayer?.stop()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                
                    self.playTemperanceAudio()
                   
                }
                
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.temperanceText)
                
               
                
            case "FOCCard":
              
               print("Recognized Adabot Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: pentacleCard, ARScene: ARScenes.pentacleCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: pentacleCard)
               
                pentacleCard.opacity = 0.0
                
                pentacleCard.position.x = (-0.2)
                
                addRotationAnimation(node: pentacleCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                       self.playFourOfCoinAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.fourOfCoinText)
            
               
            case "StarCard":
              
               print("Recognized Blinka Star Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: starCard, ARScene: ARScenes.starCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: starCard)
               
                starCard.opacity = 0.0

                starCard.position.x = (-0.2)
            
                addRotationAnimation(node: starCard)
            
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                // If intro animation played
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    print("Loaded.")
                }else {
                    print("Parts were loaded.")
                }
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                
                audioPlayer?.stop()

                
                DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                    self.playStarAudio()
                }
           
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.starText)
                
            case "HermitCard":
              
               print("Recognized Hermit Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: hermitCard, ARScene: ARScenes.hermitCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: hermitCard)
               
                hermitCard.opacity = 0.0

                hermitCard.position.x = (-0.2)
                
                addRotationAnimation(node: hermitCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
          
               
            
                if animationWasPlayed == false {
                                   minervaIntroAnimation()
                               }else {
                                   print("Intro animation was a played.")
                               }
            
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    print("Loaded.")
                }else {
                    print("Parts were loaded.")
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                
                audioPlayer?.stop()

                DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                    self.playHermitAudio()
                }
                
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                                
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.hermitText)

            
                
            case "JudgementCard":
              
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: judgementCard, ARScene: ARScenes.judgementCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))
              
                cardOpacity(node: judgementCard)
               
                judgementCard.opacity = 0.0

                judgementCard.position.x = (-0.2)

                addRotationAnimation(node: judgementCard)

                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                                
                minervaModel.position.x = (+0.2)
                                
                planeNode.addChildNode(minervaModel)

          
                if animationWasPlayed == false {
                                   minervaIntroAnimation()
                               }else {
                                   print("Intro animation was a played.")
                               }
 
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    print("Loaded.")
                }else {
                    print("Parts were loaded.")
                }
                
               
 
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                
                audioPlayer?.stop()
 
                DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                    self.playJudgementAudio()
                }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.judgementText)

                
                // MARK:- WOF
            case "WOFCard":
              
               print("Recognized WOFCard Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: WOFCard, ARScene: ARScenes.WOFCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: WOFCard)
               
                WOFCard.opacity = 0.0

                WOFCard.position.x = (-0.2)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                                
                minervaModel.position.x = (+0.2)
                                
                planeNode.addChildNode(minervaModel)

                addRotationAnimation(node: WOFCard)
            
                if animationWasPlayed == false {
                                    minervaIntroAnimation()
                                }else {
                                    print("Intro animation was a played.")
                                }

                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    print("Loaded.")
                }else {
                    print("Parts were loaded.")
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.minervaTalk(node: self.beak)
                  
                }
                
                audioPlayer?.stop()
                DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                    self.playWOFAudio()
                  
                }
                
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.WOFText)
          
                
            // MARK:- 1.10.1 Update
            case "THMCard":
              
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: THMCard, ARScene: ARScenes.thmCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: THMCard)
               
                THMCard.opacity = 0.0
                
                THMCard.position.x = (-0.2)
                
                addRotationAnimation(node: THMCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playthmAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.tHMText)
                
                
                
            case "TowerCard":
              
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: towerCard, ARScene: ARScenes.towerCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: towerCard)
               
                towerCard.opacity = 0.0
                
                towerCard.position.x = (-0.2)
                
                addRotationAnimation(node: towerCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playtowerAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.towerText)
                
                
            case "LoversCard":
              
               print("Recognized Adabot Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: loversCard, ARScene: ARScenes.loversCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: loversCard)
               
                loversCard.opacity = 0.0
                
                loversCard.position.x = (-0.2)
                
                addRotationAnimation(node: loversCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playloversAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.loversText)
                
                
                
            case "SunCard":
              
               print("Recognized Adabot Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: sunCard, ARScene: ARScenes.sunCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: towerCard)
               
                sunCard.opacity = 0.0
                
                sunCard.position.x = (-0.2)
                
                addRotationAnimation(node: sunCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playsunAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.sunText)
                
            case "JusticeCard":
              
               print("Recognized Adabot Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: justiceCard, ARScene: ARScenes.justiceCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: justiceCard)
               
                justiceCard.opacity = 0.0
                
                justiceCard.position.x = (-0.2)
                
                addRotationAnimation(node: justiceCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                   }
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playjusticeAudio()
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.justiceText)
                
                
            case "MoonCard":
              
               print("Recognized Adabot Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: moonCard, ARScene: ARScenes.moonCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: moonCard)
               
                moonCard.opacity = 0.0
                
                moonCard.position.x = (-0.2)
                
                addRotationAnimation(node: moonCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playmoonAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.moonText)
                
                
            case "WorldCard":
              
               print("Recognized Adabot Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: worldCard, ARScene: ARScenes.worldCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: worldCard)
               
                worldCard.opacity = 0.0
                
                worldCard.position.x = (-0.2)
                
                addRotationAnimation(node: worldCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playworldAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.worldText)
                
                
            case "DevilCard":
              
               print("Recognized Adabot Image.")
     
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
               ARObjectToScene(ARObject: devilCard, ARScene: ARScenes.devilCardScene, planeNode: node,  size: SCNVector3(0.006, 0.006, 0.006))

                cardOpacity(node: devilCard)
               
                devilCard.opacity = 0.0
                
                devilCard.position.x = (-0.2)
                
                addRotationAnimation(node: devilCard)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playdevilAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.devilText)
                
                
            case "FoolCard":
                
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                    self.playfoolAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.foolText)
                
            case "MagicianCard":
                
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playmagicianAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.magicianText)
                
                
            case "PriestessCard":
                
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playpriestessAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.priestessText)
                
                
            case "StrengthCard":
                
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                   
                   audioPlayer?.stop()
                   DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                       self.playstrengthAudio()
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.strengthText)
                
            case "ChariotCard":
                
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }

               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.chariotText)
                
                
            case "EmperorCard":
                
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.emperorText)
                
            case "EmpressCard":
                
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
                
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.empressText)
                
            case "HeirophantCard":
                
               ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                minervaModel.position = SCNVector3(planeNode.position.x, planeNode.position.y, planeNode.position.z )
                
                minervaModel.position.x = (+0.2)
                
                planeNode.addChildNode(minervaModel)
                
                
                if animationWasPlayed == false {
                    minervaIntroAnimation()
                }else {
                    print("Intro animation was a played.")
                }
                
                if minervaPartsLoaded == false {
                    
                    hoverModel(body: minervaModel)
                    minervaAnimation(eyes: openEyes, rightWing: rightWing, leftWing: leftWing)

                    minervaPartsLoaded = true
                    
                }else {
                    print("Parts were loaded.")
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                       self.minervaTalk(node: self.beak)
                     
                   }
               
                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                              
                arHostingController(for: planeNode, textForDialogue: ListOfTexts.heirophantText)


            case "pico4":

               print("Recognized PICO Board.")

                ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)

                SwiftUIARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)

                arPICOHostingController(for: planeNode)


            case "cpx":
                
                ARPlaneAnchor(imageReferenceAnchor: imageAnchor, mainNode: node)
                
                ARObjectToScene(ARObject: cpxStandAloneLabel, ARScene: ARScenes.circuitPlaygroundLabelScene, planeNode: node, size: SCNVector3(0.03,0.03,0.03))

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

                //createHostingController(for: planeNode)

            
            case "portal2":
              
                print("Recognized PyPortal.")
                
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

extension Notification.Name {
    static let notifTest = Notification.Name(rawValue: "Test")
}

//@available(iOS 13.0, *)
//extension BoardViewController {
//    func renderer(_ renderer: SCNSceneRenderer,didAdd node: SCNNode,for anchor: ARAnchor) {
//
//        guard let worldAnchor = anchor as? ARWorldAnchor
//        else { return }
//
//        print(worldAnchor.isKind(of: ARWorldAnchor.self))
//
//        // it prints "true"
//
//        let earthNode = SCNNode()
//        earthNode.geometry = SCNSphere(radius: 0.8)
//
//       // let path = "art.scnassets/earthAlbedo.jpg"
//
//        if #available(iOS 14.0, *) {
//            earthNode.geometry?.firstMaterial?.diffuse.contents = UIColor(Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)))
//        } else {
//            // Fallback on earlier versions
//        }
//
//        node.position = minervaModel.position
//
//        node.addChildNode(earthNode)
//    }
//}
