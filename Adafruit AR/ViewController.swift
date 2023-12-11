  //  ViewController.swift
  //  Adafruit AR
  //
  //  Created by Trevor Beaton on 4/23/18.
  //  Copyright © Adafruit. All rights reserved.
  //
  
  import ARKit
  import UIKit
  import SceneKit
  import SpriteKit
  import ReplayKit
  import AVFoundation
  
  
  class ViewController: UIViewController, ARSCNViewDelegate {

    //For Focus Square
    var focusSquare = FocusSquare()
    var dragOnInfinitePlanesEnabled = false
    
    // For Main Adafruit AR/Adabot
    let configuration = ARWorldTrackingConfiguration()
    var toggleButtonSelected = true
    var nodeLoadedtoCurrentScene = false
  
    //For Mouth Animation
    let speakingTeethColor = UIColor(red: 1.0, green: 0.5, blue: 0.5, alpha: 1)
    var teethMaterial : SCNMaterial = SCNMaterial()
    var audioPlayer : AVAudioPlayer?
   
    //All Nodes
    var head = SCNNode()
    var ballNode = SCNNode()
    var adabotNode = SCNNode()
    var LetterNodeA = SCNNode()
    var LetterNodeB = SCNNode()
    var LetterNodeC = SCNNode()
    var LetterNodeD = SCNNode()
    var LetterNodeF = SCNNode()
    var LetterNodeG = SCNNode()
    var LetterNodeH = SCNNode()
    var LetterNodeI = SCNNode()
    var LetterNodeJ = SCNNode()
    var LetterNodeK = SCNNode()
    var LetterNodeL = SCNNode()
    var LetterNodeM = SCNNode()
    var LetterNodeN = SCNNode()
    var LetterNodeO = SCNNode()
    var LetterNodeP = SCNNode()
    var LetterNodeQ = SCNNode()
    
    var focusOfTheHead = SCNNode()
    let letterNode = SCNNode()
    var currentNode: SCNNode?
    
    var videoNode = SCNNode()
    
    var orbitRoot = SCNNode()
    var orbitingNode1 = SCNNode()
    var orbitingNode2 = SCNNode()
    var orbitingNode3 = SCNNode()
    var orbitingNode4 = SCNNode()
    var orbitingNode5 = SCNNode()
    var orbitingNode6 = SCNNode()
    var orbitingNode7 = SCNNode()
    var orbitingNode8 = SCNNode()
    
    
    var orbitRootPosition = SCNVector3()
    var currentCamPosition = matrix_float4x4()

    var sphereA = SCNNode()
    var sphereB = SCNNode()
    var sphereC = SCNNode()
    var sphereD = SCNNode()
    var sphereF = SCNNode()
    var sphereG = SCNNode()
    var sphereH = SCNNode()
    var sphereI = SCNNode()
    var sphereJ = SCNNode()
    var sphereK = SCNNode()
    var sphereL = SCNNode()
    var sphereM = SCNNode()
    var sphereN = SCNNode()
    var sphereO = SCNNode()
    var sphereP = SCNNode()
    var sphereQ = SCNNode()
    
    
    var colorArray = [UIColor]()
    
    weak var timer: Timer?
    
    //Letter Effects
    var fadeOut = SCNAction()
    var fadeIn = SCNAction()
  
    //Booleans
    var videoWasLoadedToScene = Bool()
    
    //For UI Blur Effect
    var effect : UIVisualEffect!
    
    //For Random Number Generator
    var storedVarible : Int = 1
    var randomNum: Int = 1
    var arrayOfNum = [Int]()
    var rndmColors = [UIColor]()
   
    //For Recording Function
    var recordButtonWasSelected: Bool = false
    var preferStatusBarHidden: Bool!

    //For Video playback
    var videoFrame = SCNNode()

    struct AspectRatio {
      static let width: CGFloat = 320
      static let height: CGFloat = 180
    }
   
    let AspectDiv: CGFloat = 1000
    var savedLocation = SCNVector3()
    var videoNodeIsPlaying = false
    var playerNode = SKVideoNode()
    var player = AVPlayer()

    var storedLetter: String = ""
    var videoInfoAwake = false
    

    
    // The full type name is also allowed
   //  var emptyFloats: Array<Float> = Array()
    var randomFunc : [() -> ()] = Array()
    
    //Animations
    var animations = [String: CAAnimation]()
  
    
    func disableUserInteraction () {
      toggleButton.isEnabled = false
    }
    
    func enableUserInteraction () {
       toggleButton.isEnabled = true
    }

    func setupConstraints() {
      // Set up constraints for head movement
      let headConstraint = SCNLookAtConstraint(target: ballNode)
      //  let newConstraint = SCNBillboardConstraint.self
      
      headConstraint.isGimbalLockEnabled = false
      //  head.pivot =  SCNMatrix4MakeTranslation(0.5, 0.5, 0.5)  // Slow the constraint down a bit
      headConstraint.localFront = SCNVector3(0, 0, 1)
      headConstraint.influenceFactor = 0.3
      head.constraints = [headConstraint]
    }
    
    
    func setupSpecialNodes() {
      head = adabotNode.childNode(withName: "HeadBone", recursively: true)!
      // head.runAction(headRotation)
      
    }

    
    //Mark:- UI Elements --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @IBOutlet var itemView: UIView!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var sceneView: ARSCNView!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var addedBlurEffect: UIVisualEffectView!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var alphButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var placementLabel: UILabel!
    
    @IBOutlet var videoInfoView: UIView!
    
    @IBAction func videoInfoDone(_ sender: Any) {
    animateVideoInfoOut()
    }
    
    //Mark:- UI Action ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    @IBAction func dismissPopup(_ sender: Any) {
      animateOut()
      addedBlurEffect.isUserInteractionEnabled = false
    }
    
    @IBAction func toggleAction(_ sender: UIButton) {
      toggleButtonSelected = !toggleButtonSelected
      updateOnOffButton()
    }
    
    @IBAction func infoAction(_ sender: UIButton) {
      animateIn()
    }
    
    @IBAction func recordToggle(_ sender: UIButton) {
      recordButtonWasSelected = !recordButtonWasSelected
      recordUpdater()
    }
    
    @IBAction func alphButton(_ sender: UIButton) {
     
      print("Letters Array Count:  \(randomFunc.count)")

      if videoInfoAwake == false {

        animateVideoInfoIn()

      } else {
        print("Button Pressed")
      }
    
      if videoWasLoadedToScene == true {
        print("loaded to scene")
      } else {
        print("not playing")
        addLetter()
        
      }
   
    }
    
    

    //Mark:- For AR Scene Initialization --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
      super.viewDidLoad()
     
      let scene = SCNScene()
    
      alphButton.isHidden = true
     
      // Set the view's delegate
      sceneView.delegate = self
      
      sceneView.session.delegate = self as? ARSessionDelegate
      
      // Set the scene to the view
      sceneView.scene = scene
      
      self.adabotNode.isPaused = false
      
      effect = addedBlurEffect.effect

      addedBlurEffect.effect = nil
      
      itemView.layer.cornerRadius = 10
      
      videoInfoView.layer.cornerRadius = 10
      
      recordButton.layer.cornerRadius = 20
      
      animateIn()
      
      sceneView.showsStatistics = false
      
      sceneView.autoenablesDefaultLighting = false
      
      configuration.planeDetection = .horizontal
      
      configuration.isLightEstimationEnabled = false
      
      sceneView.session.run(configuration)
      
      updateOnOffButton()
      
      registerTapRecognizer()
      
      arrayOfNum += 1...23
      
      colorArray = [UIColor.blue, UIColor.red, UIColor.yellow, UIColor.purple, UIColor.orange, UIColor.green, UIColor.magenta, UIColor.cyan]
     
      randomFunc = [self.addLetterA, self.addLetterB, self.addLetterC, self.addLetterD, self.addLetterF, self.addLetterG, self.addLetterH, self.addLetterI, self.addLetterJ,self.addLetterK,self.addLetterL,self.addLetterM, addLetterN, self.addLetterO,self.addLetterP,self.addLetterQ]
      
      playAndLoadIntro()
      
      //Call updateTeeth for every frame of video
      let dpLink = CADisplayLink(target: self, selector: #selector(self.updateTeeth))
      
       // dpLink.add(to: .current, forMode: .RunLoop.Mode.common)
      
      setupFocusSquare()
      screenLocation()
    }
    
  
    
    func animateLetterToParent(to destinationPoint: SCNVector3, node: SCNNode) {
      
      let action = SCNAction.move(to: destinationPoint, duration: 1)
      action.timingMode = .easeInEaseOut
      node.runAction(action) { [weak self] in
        
      }
    }
    
    func screenLocation() {
      let ball = SCNSphere(radius: 0.06)
       ballNode = SCNNode(geometry: ball)
      let material = SCNMaterial()
       material.diffuse.contents = UIColor.clear
      
       ball.materials = [material]
      sceneView.scene.rootNode.addChildNode(ballNode)
    }
    

    override func viewDidAppear(_ animated: Bool) {
      
    sceneView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
    print("View Did Appeared")
   
    }
    
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      // Pause the view's session
      
      exitVideoNode()
      sceneView.session.pause()
      audioPlayer?.stop()
      print("Will View Disappeared")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    
      
      sceneView.session.run(configuration)
      print("view will appear")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
      super.viewWillTransition(to: size, with: coordinator)
    }
    
    //Mark:- UI Menu Transitions -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    func animateVideoInfoIn() {
      self.view.addSubview(videoInfoView)
      videoInfoView.center = self.view.center
      videoInfoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
      videoInfoView.alpha =  0
      videoInfoAwake = true
      UIView.animate(withDuration: 0.4) {
        self.addedBlurEffect.effect = self.effect
        self.videoInfoView.alpha = 1
        self.videoInfoView.transform = CGAffineTransform.identity
      }
    }
    
    
    func animateVideoInfoOut(){
      UIView.animate(withDuration: 1, animations: {
        
        self.videoInfoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.videoInfoView.alpha = 0
        self.addedBlurEffect.effect = nil
      }) { (success:Bool) in
        
        for subview in self.addedBlurEffect.subviews {
          if subview is UIVisualEffectView {
            subview.removeFromSuperview()
          }
        }
      }
    }
    
    
    func animateIn() {
      self.view.addSubview(itemView)
      itemView.center = self.view.center
      itemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
      itemView.alpha =  0
      
      UIView.animate(withDuration: 0.4) {
        self.addedBlurEffect.effect = self.effect
        self.itemView.alpha = 1
        self.itemView.transform = CGAffineTransform.identity
      }
    }
    
    
    func animateOut() {
      UIView.animate(withDuration: 1, animations: {
        
        self.itemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.itemView.alpha = 0
        self.addedBlurEffect.effect = nil
      }) { (success:Bool) in
        
        for subview in self.addedBlurEffect.subviews {
          if subview is UIVisualEffectView {
            subview.removeFromSuperview()
          }
        }
      }
    }
    
    
    func updateOnOffButton() {
      
      if toggleButtonSelected {
        print("Update On Button")
        resetTracking()
        toggleButton.setBackgroundImage(UIImage(named: "openBox4.png"), for: .normal)
        setupFocusSquare()
        placementLabel.isHidden = false
        removeAllAnimationsForLetters()
        randomFunc = [self.addLetterA, self.addLetterB, self.addLetterC, self.addLetterD, self.addLetterF, self.addLetterG, self.addLetterH, self.addLetterI, self.addLetterJ,self.addLetterK,self.addLetterL,self.addLetterM, self.addLetterN,self.addLetterO, self.addLetterP,self.addLetterQ]
      
      }
      else {
        print("Update Off Button")
        
        removeAllAnimationsForLetters()
        clearAllLetters()
        alphButton.isHidden = true
        audioPlayer?.stop()
        playerNode.pause()
        playerNode.removeFromParent()

        if nodeLoadedtoCurrentScene == true {
          playOutro()
        }
        
        nodeLoadedtoCurrentScene = false
        toggleButton.setBackgroundImage(UIImage(named: "closedBox4.png"), for: .normal)
        disablePlane()
        clearScene()
        exitVideoNode()
        placementLabel.isHidden = true
        focusSquare.removeFromParentNode()
        randomFunc = []
      }
    }
    
    
    //Mark:- Loading Models To Scene ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    func Rotation(time: TimeInterval) -> SCNAction {
      let Rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: time)
      let foreverRotation = SCNAction.repeatForever(Rotation)
      return foreverRotation
    }
    
    
    func generateRandom() {
      print("AMOUNT OF ITEMS IN ARRAY \(arrayOfNum.count)")
      
      if arrayOfNum.isEmpty {
        print("Refilling array with integer elements")
        arrayOfNum += 1...24
        
      } else {
        print("AMOUNT OF ITEMS IN ARRAY \(arrayOfNum.count)")
        let randomIndex = Int(arc4random_uniform(UInt32(arrayOfNum.count-1)))
        print("Random Number generator: \(arrayOfNum[randomIndex])")
        storedVarible = arrayOfNum[randomIndex]
        print("Print STORED VARIABLE: \(storedVarible)")
        arrayOfNum.remove(at: randomIndex)
        
      }
    }
    
    
    // Timing function that has a "bounce in" effect
    
    func easeOutElastic(_ t: Float) -> Float {
      let p: Float = 0.3
      let result = pow(2.0, -10.0 * t) * sin((t - p / 4.0) * (2.0 * Float.pi) / p) + 1.0
      return result
    }

    
    //Mark:- ARKit Configuration -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    func disablePlane () {
    
      print("disablePlane() called")
      let configuration = ARWorldTrackingConfiguration()
      configuration.planeDetection = []
      sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    
    func resetTracking() {
     
      print("Reset Tracking")
      configuration.planeDetection = [.horizontal]
      sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
      self.adabotNode.eulerAngles.y = (self.sceneView.pointOfView?.eulerAngles.y)!
    }
    
    func clearScene() {
      
      print("clearScene()")

      LetterNodeA.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeB.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeC.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeD.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeF.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeG.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeH.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeI.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeJ.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeK.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeL.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      
      LetterNodeM.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
      LetterNodeN.childNodes.forEach {
        $0.removeFromParentNode()
      }
      
        LetterNodeO.childNodes.forEach {
            $0.removeFromParentNode()
        }
        
        LetterNodeP.childNodes.forEach {
            $0.removeFromParentNode()
        }
        
      adabotNode.childNodes.forEach {
        $0.removeFromParentNode()
      }
    }
   
    
    func clearAllLetters() {
     
      LetterNodeA.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeB.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeC.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeD.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeF.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeG.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeH.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeI.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeJ.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeK.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeL.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      
      LetterNodeM.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
      
      LetterNodeN.childNodes.forEach {
        $0.removeAllActions()
        $0.removeFromParentNode()
      }
        
        LetterNodeO.childNodes.forEach {
            $0.removeAllActions()
            $0.removeFromParentNode()
        }
        
        LetterNodeP.childNodes.forEach {
            $0.removeAllActions()
            $0.removeFromParentNode()
        }
        
    }
    
    
    //Mark:- Recording Function --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    func recordAction() {
      
      let recorder = RPScreenRecorder.shared()
      
      recordButton.isUserInteractionEnabled = true
      recordButton.isEnabled = true
      
      let pulse1 = CASpringAnimation(keyPath: "transform.scale")
      pulse1.duration = 0.6
      pulse1.fromValue = 1.0
      pulse1.toValue = 1.20
      pulse1.autoreverses = true
      pulse1.repeatCount = 1
      pulse1.initialVelocity = 0.8
      pulse1.damping = 0.8
      
      let animationGroup = CAAnimationGroup()
      animationGroup.duration = 2.7
      animationGroup.repeatCount = 1000
      animationGroup.animations = [pulse1]
      
      recordButton.layer.add(animationGroup, forKey: "pulse")
      
      
      recorder.startRecording { (error) in
        if let error = error {
          print(error)
        }
      }
    }
    
    
    func stopRecording() {
      
      recordButton.layer.removeAllAnimations()
      
      let recorder = RPScreenRecorder.shared()
      
      recorder.stopRecording { (previewVC, error) in
        
        if let previewVC = previewVC {
          
          previewVC.previewControllerDelegate = self as RPPreviewViewControllerDelegate
          
          if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            previewVC.modalPresentationStyle = UIModalPresentationStyle.popover
            previewVC.popoverPresentationController?.sourceRect = self.recordButton.frame //position popover relative to record button - NEEDS TESTING
            previewVC.popoverPresentationController?.sourceView = self.view
            //Show Preview
            self.present(previewVC, animated: true)
          }
            
          else {
            //Set boundaries safe for iPhone X - NEEDS TESTING
            let safeArea = self.view.safeAreaInsets
            let safeAreaHeight = self.view.frame.height - safeArea.top
            let safeAreaWidth = self.view.frame.width - (safeArea.left + safeArea.right)
            let scaleX = safeAreaWidth / self.view.frame.width
            let scaleY = safeAreaHeight / self.view.frame.height
            let scale = min(scaleX, scaleY)
            previewVC.view.transform = CGAffineTransform(scaleX: scale, y: scale)
            //Show Preview
            self.present(previewVC, animated: true) {
              previewVC.view.frame.origin.x += safeArea.left
              previewVC.view.frame.origin.y += safeArea.top
            }
          }
        }
        
        if let error = error {
          print(error)
        }
      }
    }

    
    func recordUpdater() {
      
      if recordButtonWasSelected {
        print("Currently Recording...")
        recordAction()
        recordButton.backgroundColor = UIColor.red
        
      } else {
        recordButton.backgroundColor = UIColor.white
        print("Stopped/Not Recording.")
        stopRecording()
      }
    }
    
    
    //Mark:- Focus Square ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    func setupFocusSquare() {
      focusSquare.unhide()
      focusSquare.removeFromParentNode()
      sceneView.scene.rootNode.addChildNode(focusSquare)
    }
    
    
    func updateFocusSquare() {
      let (worldPosition, planeAnchor, _) = worldPositionFromScreenPosition(view.center, objectPos: focusSquare.position)
      
      if let worldPosition = worldPosition {
        focusSquare.update(for: worldPosition, planeAnchor: planeAnchor, camera: sceneView.session.currentFrame?.camera)
      }
    }
    
    
    //Mark:- Random Number Generator ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    func generateRandomNum() {
      print("AMOUNT OF ITEMS IN ARRAY \(arrayOfNum.count)")
      
      if arrayOfNum.isEmpty {
        print("Refilling array with integer elements")
        arrayOfNum += 1...24
    
      } else {
        print("AMOUNT OF ITEMS IN ARRAY \(arrayOfNum.count)")
        let randomIndex = Int(arc4random_uniform(UInt32(arrayOfNum.count-1)))
        print("Random Number generator: \(arrayOfNum[randomIndex])")
        storedVarible = arrayOfNum[randomIndex]
        print("Print STORED VARIABLE: \(storedVarible)")
        arrayOfNum.remove(at: randomIndex)
        
      }
    }
   
    
    func randomColor(_ node: SCNNode) {
   
      let material = SCNMaterial()
      
      if colorArray.isEmpty {
        
        colorArray = [UIColor.blue, UIColor.red, UIColor.yellow, UIColor.purple, UIColor.orange, UIColor.green, UIColor.magenta, UIColor.cyan]
        
        
      } else {
        
        let randomResult = Int(arc4random_uniform(UInt32(colorArray.count-1)))
        
        material.diffuse.contents = colorArray[randomResult]
        
        node.geometry?.materials = [material]
      
      }
    }
    

    func addLetter() {
      
      if randomFunc.isEmpty {
       
        removeAllAnimationsForLetters()
       
        clearAllLetters()
        
        print("Letter Array is empty & all cleared out")
        randomFunc = [self.addLetterA, self.addLetterB, self.addLetterC, self.addLetterD, self.addLetterF, self.addLetterG, self.addLetterH, self.addLetterI, self.addLetterJ,self.addLetterK,self.addLetterL,self.addLetterM, self.addLetterN, self.addLetterO,self.addLetterP,self.addLetterQ]
      
      } else {
        
        let randomResult = Int(arc4random_uniform(UInt32(randomFunc.count)))
        
        randomFunc.remove(at: randomResult)()
        
        return
     
      }
    }


      public func playVideo(_ videoURL: URL) {
      // create AVPlayer
      player = AVPlayer(url: videoURL)
     
      // place AVPlayer on SKVideoNode
      playerNode = SKVideoNode(avPlayer: player)
      
      // flip video upside down
      playerNode.yScale = -1
      playerNode.name = "playerNode"
      
      // create SKScene and set player node on it
      let spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
      spriteKitScene.scaleMode = .aspectFit
      playerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
      playerNode.size = spriteKitScene.size
      spriteKitScene.addChild(playerNode)
      
      // create 3D SCNNode and set SKScene as a material

      videoNode.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
      videoNode.geometry?.firstMaterial?.isDoubleSided = true
     
      videoFrame.isHidden = false
      videoNode.isHidden = false
      
      videoWasLoadedToScene = true
      videoNodeIsPlaying = true
     
      playerNode.play()

      timer?.invalidate()
    }
    

    func loadAnimation(withKey: String, sceneName:String, animationIdentifier:String) {
      let sceneURL = Bundle.main.url(forResource: sceneName, withExtension: "dae")
      let sceneSource = SCNSceneSource(url: sceneURL!, options: nil)
      
      if let animationObject = sceneSource?.entryWithIdentifier(animationIdentifier, withClass: CAAnimation.self) {
        // The animation will only play once
        animationObject.repeatCount = 1
        // To create smooth transitions between animations
        animationObject.fadeInDuration = CGFloat(1)
        animationObject.fadeOutDuration = CGFloat(0.5)
        
        // Store the animation for later use
        animations[withKey] = animationObject
      }
    }
    

    //Mark:- Systems ----------------------------------------------------------------------------
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
      guard anchor is ARPlaneAnchor else { return }
    }
    

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
      DispatchQueue.main.async {
        self.updateFocusSquare()
        self.placementLabel.text = "\(self.focusSquare.placementMessage)"
        self.ballNode.position = (self.sceneView.pointOfView?.position)!
      
      }
    }
  }
  

  //Extensions -------------------------------------------------------------------------
  
  extension Int {
    var degreesToRadians: Double { return Double(self) * .pi/180}
  }
  
  
  extension ViewController: RPPreviewViewControllerDelegate {
    
    func previewControllerDidFinish(_ previewController: RPPreviewViewController) {
      dismiss(animated: true, completion: nil)
      
    }
  }
 
  
  extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
      get {
        return layer.cornerRadius
      }
      set {
        layer.cornerRadius = newValue
      }
    }
  }
