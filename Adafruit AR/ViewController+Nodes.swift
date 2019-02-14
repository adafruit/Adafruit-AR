//
//  View Controller + LetterNodes.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 7/17/18.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//


import UIKit
import SceneKit
import ARKit

extension ViewController {
  
  
  func loadAdabotScene(hitTestResult: ARHitTestResult) {
    placementLabel.isHidden = true
    alphButton.isHidden = false
  
    let adabotScene = SCNScene(named: "art.scnassets/Adabot_Idle.dae")!
    
    let transform = hitTestResult.worldTransform
    let thirdColumn = transform.columns.3
    let scale: Float = 0.0002
    
    
    let scaleAction = SCNAction.scale(to: CGFloat(0.010), duration: 1)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      
      return self.easeOutElastic(p)
      
    }
    
    playIdleAnimation()
    
    //Add every adabot child node from adabot scene k
    for childNode in adabotScene.rootNode.childNodes {
      print("Adding Node to the scene")
      self.adabotNode.addChildNode(childNode)
      
      // Find and save reference to teeth material
      if let materials = childNode.geometry?.materials {
        for mat in materials {
          if mat.name! == "Adabot_Teeth_Mat_" {

            teethMaterial = mat
            
          }
        }
      }
      else {
        print("NO TEETH MATERIALS FOUND")}
    }
    
    adabotNode.name = "Adabot Node"

    print("\(String(describing: adabotNode.name ?? nil))")

    self.adabotNode.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    self.adabotNode.position = SCNVector3(thirdColumn.x, thirdColumn.y, thirdColumn.z)
   
    savedLocation = adabotNode.position
    
    self.sceneView.scene.rootNode.addChildNode(adabotNode)
    self.sceneView.scene.rootNode.addChildNode(videoNode)
   
    nodeLoadedtoCurrentScene = !nodeLoadedtoCurrentScene
    
    print("Node Loaded. Is Adabot node visible?: \(nodeLoadedtoCurrentScene)")
    
    playIdleAnimation()
    
    animationLoader()
    
    playIntro()
    
    focusSquare.removeFromParentNode()
    
    letterOrbit()

    adabotNode.runAction(scaleAction)
   
    setupSpecialNodes()

    let pitch = sceneView.session.currentFrame?.camera.eulerAngles.x
    let roll = sceneView.session.currentFrame?.camera.eulerAngles.z
    let yawn = sceneView.session.currentFrame?.camera.eulerAngles.y
    
    let newRotation = SCNVector3(pitch!, yawn!, roll!)
    
    adabotNode.eulerAngles.y = newRotation.y

   // setupConstraints()
    

    setupLetterNodes()

  }
  
  func setupLetterNodes() {
    LetterNodeA = adabotNode.childNode(withName: "LetterA", recursively: true)!
    LetterNodeA.isHidden = true
    
    LetterNodeB = adabotNode.childNode(withName: "LetterB", recursively: true)!
    LetterNodeB.isHidden = true
    
    LetterNodeC = adabotNode.childNode(withName: "LetterC", recursively: true)!
    LetterNodeC.isHidden = true
    
    LetterNodeD = adabotNode.childNode(withName: "LetterD", recursively: true)!
    LetterNodeD.isHidden = true
    
    LetterNodeF = adabotNode.childNode(withName: "LetterF", recursively: true)!
    LetterNodeF.isHidden = true
    
    LetterNodeG = adabotNode.childNode(withName: "LetterG", recursively: true)!
    LetterNodeG.isHidden = true
    
    LetterNodeH = adabotNode.childNode(withName: "LetterH", recursively: true)!
    LetterNodeH.isHidden = true
    
    LetterNodeI = adabotNode.childNode(withName: "LetterI", recursively: true)!
    LetterNodeI.isHidden = true
    
    LetterNodeJ = adabotNode.childNode(withName: "LetterJ", recursively: true)!
    LetterNodeJ.isHidden = true
    
    LetterNodeK = adabotNode.childNode(withName: "LetterK", recursively: true)!
    LetterNodeK.isHidden = true
   
    LetterNodeL = adabotNode.childNode(withName: "LetterL", recursively: true)!
    LetterNodeL.isHidden = true
    
    LetterNodeM = adabotNode.childNode(withName: "LetterM", recursively: true)!
    LetterNodeM.isHidden = true

    LetterNodeN = adabotNode.childNode(withName: "LetterN", recursively: true)!
    LetterNodeN.isHidden = true
 
    LetterNodeO = adabotNode.childNode(withName: "LetterO", recursively: true)!
    LetterNodeO.isHidden = true
    
    LetterNodeP = adabotNode.childNode(withName: "LetterP", recursively: true)!
    LetterNodeP.isHidden = true
    
    videoNode = adabotNode.childNode(withName: "plane", recursively: true)!
    videoNode.isHidden = true
  
    videoFrame = adabotNode.childNode(withName: "plane_bevel", recursively: true)!
    videoFrame.isHidden = true
    
  }
  
  
  
  
  func addLetterA() {
    
    LetterNodeA.isHidden = false
    let scale: Float = 0.0007
    let letterRotation = Rotation(time: 5)
    
    LetterNodeA.scale = SCNVector3(x: scale, y: scale, z: scale)
    let scaleAction = SCNAction.scale(to: CGFloat(0.06), duration: 1.5)
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      return self.easeOutElastic(p)
    }
    
    
    LetterNodeA.name = "LetterA"
    
    
    randomColor(LetterNodeA)
    
    LetterNodeA.runAction(scaleAction)
    LetterNodeA.runAction(letterRotation, forKey: "rotation")
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      self.animateLetterToParent(to: self.sphereA.position, node: self.LetterNodeA)
    })
    print("Letter A - was loaded into the sceneView")
  }
  
  func addLetterB() {
    
    
    LetterNodeB.isHidden = false
    
    let scale: Float = 0.0009
    
    let letterRotation = Rotation(time: 5)
    
    LetterNodeB.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(0.07), duration: 1.3)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      
      return self.easeOutElastic(p)
      
    }
    
    randomColor(LetterNodeB)
    
    
    
    LetterNodeB.name = "LetterB"
    
    LetterNodeB.runAction(scaleAction)
    
    LetterNodeB.runAction(letterRotation, forKey: "rotation")
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereB.position, node: self.LetterNodeB)
      
    })
    
    print("Letter B - was loaded into the sceneView")
  }
  
  func addLetterC() {
    //Letter ID
    LetterNodeC.name = "LetterC"
    
    LetterNodeC.isHidden = false
    
    let scale: Float = 0.009
    
    let letterRotation = Rotation(time: 5)
    
    LetterNodeC.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(6), duration: 1.5)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      
      return self.easeOutElastic(p)
      
    }
    
    randomColor(LetterNodeC)
    
    LetterNodeC.runAction(scaleAction)
    LetterNodeC.runAction(letterRotation, forKey: "rotation")
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereC.position, node: self.LetterNodeC)
    })
    
    print("Letter C - was loaded into the sceneView")
  }
  
  func addLetterD() {
    
    LetterNodeD.isHidden = false
    
    let scale: Float = 0.0007
    
    let letterRotation = Rotation(time: 5)
    
    LetterNodeD.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(0.5), duration: 1.5)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      
      return self.easeOutElastic(p)
      
    }
    
    LetterNodeD.name = "LetterD"
    
    randomColor(LetterNodeD)
    
    LetterNodeD.runAction(scaleAction)
    LetterNodeD.runAction(letterRotation, forKey: "rotation")
    
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereD.position, node: self.LetterNodeD)
      
    })
    
    print("Letter D - was loaded into the sceneView")
  }
  
  func addLetterF() {
    
    LetterNodeF.isHidden = false
    
    let scale: Float = 0.00008
    
    let letterRotation = Rotation(time: 5)
    
    LetterNodeF.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(7), duration: 1.5)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      
      return self.easeOutElastic(p)
      
    }
    
    
    randomColor(LetterNodeF)
    LetterNodeF.name = "LetterF"
    
    LetterNodeF.runAction(scaleAction)
    LetterNodeF.runAction(letterRotation, forKey: "rotation")
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereF.position, node: self.LetterNodeF)
      
    })
    
    print("Letter F - was loaded into the sceneView")
    
  }
  
  func addLetterG() {
    
    LetterNodeG.isHidden = false
    
    let scale: Float = 0.00004
    
    let letterRotation = Rotation(time: 5)
    
    LetterNodeG.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(7), duration: 1.5)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      
      return self.easeOutElastic(p)
      
    }
    
    randomColor(LetterNodeG)
    LetterNodeG.name = "LetterG"
    
    LetterNodeG.runAction(scaleAction)
    LetterNodeG.runAction(letterRotation, forKey: "rotation")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereG.position, node: self.LetterNodeG)
      
    })
    
    print("Letter G - was loaded into the sceneView")
    
  }
  
  func addLetterH() {
    
    LetterNodeH.isHidden = false
    
    let scale: Float = 0.00006
    
    let letterRotation = Rotation(time: 5)
    
    LetterNodeH.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(7), duration: 2)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      
      return self.easeOutElastic(p)
      
    }
    
    randomColor(LetterNodeH)
    
    LetterNodeH.name = "LetterH"
    
    LetterNodeH.runAction(scaleAction)
    LetterNodeH.runAction(letterRotation, forKey: "rotation")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereH.position, node: self.LetterNodeH)
      
    })
    
    print("Letter H - was loaded into the sceneView")
    
  }
  
  func addLetterI() {
    
    LetterNodeI.isHidden = false
    
    let scale: Float = 0.0006
    
    let letterRotation = Rotation(time: 5)
    
    LetterNodeI.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(0.06), duration: 1.5)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      return self.easeOutElastic(p)
    }
    
    randomColor(LetterNodeI)
    
    LetterNodeI.name = "LetterI"
    
    LetterNodeI.runAction(scaleAction)
    LetterNodeI.runAction(letterRotation, forKey: "rotation")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereI.position, node: self.LetterNodeI)
      
    })
    
    print("Letter I - was loaded into the sceneView")
    
  }
  
  func addLetterJ() {
    
    LetterNodeJ.isHidden = false
    
    let scale: Float = 0.00007
    let letterRotation = Rotation(time: 5)
    
    LetterNodeJ.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(7), duration: 1.5)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      return self.easeOutElastic(p)
    }
    
    
    randomColor(LetterNodeJ)
    
    LetterNodeJ.name = "LetterJ"
    
    LetterNodeJ.runAction(scaleAction)
    LetterNodeJ.runAction(letterRotation, forKey: "rotation")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereJ.position, node: self.LetterNodeJ)
      
    })
    
    print("Letter J - was loaded into the sceneView")
    
  }
  
  func addLetterK() {
    
    LetterNodeK.isHidden = false
    
    let scale: Float = 0.0006
    
    let letterRotation = Rotation(time: 5)
    
    LetterNodeK.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(5.5), duration: 2)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      return self.easeOutElastic(p)
    }
    
    randomColor(LetterNodeK)
    LetterNodeK.name = "LetterK"
    
    LetterNodeK.runAction(scaleAction)
    LetterNodeK.runAction(letterRotation, forKey: "rotation")
    
    
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereK.position, node: self.LetterNodeK)
      
    })
    
    print("Letter K - was loaded into the sceneView")
    
  }
  
  func addLetterL() {
    
    LetterNodeL.isHidden = false
    
    let scale: Float = 0.0004
    let letterRotation = Rotation(time: 5)
    
    LetterNodeL.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(5.5), duration: 1.5)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      return self.easeOutElastic(p)
    }
    
    
    randomColor(LetterNodeL)
    LetterNodeL.name = "LetterL"
    LetterNodeL.runAction(scaleAction)
    LetterNodeL.runAction(letterRotation, forKey: "rotation")
    
    
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereL.position, node: self.LetterNodeL)
      
    })
    
    print("Letter L - was loaded into the sceneView")
    
  }
  
  func addLetterM() {
    
    LetterNodeM.isHidden = false
    
    let scale: Float = 0.08
    let letterRotation = Rotation(time: 5)
    
    LetterNodeM.scale = SCNVector3(x: scale, y: scale, z: scale)
    
    let scaleAction = SCNAction.scale(to: CGFloat(5.6), duration: 2.5)
    
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      return self.easeOutElastic(p)
    }
    
    
    randomColor(LetterNodeM)
    LetterNodeM.name = "LetterM"
    LetterNodeM.runAction(letterRotation, forKey: "rotation")
    LetterNodeM.runAction(scaleAction)
    
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereM.position, node: self.LetterNodeM)
      
    })
    
    print("Letter M - was loaded into the sceneView")
    
  }
  
  func addLetterN() {
    
    LetterNodeN.isHidden = false
    
    let scale: Float = 0.0009
    let letterRotation = Rotation(time: 5)
    LetterNodeN.scale = SCNVector3(x: scale, y: scale, z: scale)
    let scaleAction = SCNAction.scale(to: CGFloat(6.2), duration: 2.5)
    scaleAction.timingMode = .linear
    
    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
      return self.easeOutElastic(p)
    }
    randomColor(LetterNodeN)
    LetterNodeN.name = "LetterN"
    
    LetterNodeN.runAction(letterRotation, forKey: "rotation")
    LetterNodeN.runAction(scaleAction)
    
    
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
      
      self.animateLetterToParent(to: self.sphereN.position, node: self.LetterNodeN)
      
    })
    
    print("Letter N - was loaded into the sceneView")
    
  }

    func addLetterO() {
        
        LetterNodeO.isHidden = false
        
        let scale: Float = 0.0009
        let letterRotation = Rotation(time: 5)
        LetterNodeO.scale = SCNVector3(x: scale, y: scale, z: scale)
        
        let scaleAction = SCNAction.scale(to: CGFloat(0.6), duration: 2.5)
        scaleAction.timingMode = .linear
        
        // Use a custom timing function
        scaleAction.timingFunction = { (p: Float) in
            return self.easeOutElastic(p)
        }
        randomColor(LetterNodeO)
        LetterNodeO.name = "LetterO"
        
        LetterNodeO.runAction(letterRotation, forKey: "rotation")
        LetterNodeO.runAction(scaleAction)
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            
            self.animateLetterToParent(to: self.sphereO.position, node: self.LetterNodeO)
            
        })
        
        print("Letter O - was loaded into the sceneView")
        
    }
    
    func addLetterP() {
        
        LetterNodeP.isHidden = false
        
        let scale: Float = 0.0009
        let letterRotation = Rotation(time: 5)
        LetterNodeP.scale = SCNVector3(x: scale, y: scale, z: scale)
        
        let scaleAction = SCNAction.scale(to: CGFloat(0.6), duration: 2.5)
        scaleAction.timingMode = .linear
        
        // Use a custom timing function
        scaleAction.timingFunction = { (p: Float) in
            return self.easeOutElastic(p)
        }
       
        randomColor(LetterNodeP)
        LetterNodeP.name = "LetterP"
        
        LetterNodeP.runAction(letterRotation, forKey: "rotation")
        LetterNodeP.runAction(scaleAction)
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            
            self.animateLetterToParent(to: self.sphereP.position, node: self.LetterNodeP)
            
        })
        
        print("Letter P - was loaded into the sceneView")
        
    }
    
    
    
    
    
  //Mark:- Create a animation loader -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  func animationLoader() {
    
    let waveAnimation = self.loadAnimation(fromSceneNamed: "art.scnassets/Wavingxx.dae")
    adabotNode.addAnimationPlayer(waveAnimation, forKey: "wave")
    waveAnimation.animation.blendOutDuration = 1.5
    waveAnimation.animation.repeatCount = 0.5
    
    let talkingAnimation = self.loadAnimation(fromSceneNamed: "art.scnassets/Talking Animation.dae")
    self.adabotNode.addAnimationPlayer(talkingAnimation, forKey: "talking")
    talkingAnimation.speed = 1.5
    talkingAnimation.animation.blendInDuration = 5
    talkingAnimation.animation.blendOutDuration = 3
    talkingAnimation.animation.repeatCount = 1
    talkingAnimation.animation.isRemovedOnCompletion = true
 
  
    
    
  }
  
  
  func loadAnimation(fromSceneNamed sceneName: String) -> SCNAnimationPlayer {
    let scene = SCNScene( named: sceneName )!
    // find top level animation
    
    var animationPlayer: SCNAnimationPlayer! = nil
    scene.rootNode.enumerateChildNodes { (child, stop) in
      if !child.animationKeys.isEmpty {
        animationPlayer = child.animationPlayer(forKey: child.animationKeys[0])
        stop.pointee = true
      }
    }
    return animationPlayer
  }
  
  
  func playIdleAnimation () {
    let idleAnimation = self.loadAnimation(fromSceneNamed: "art.scnassets/MainIdlex.dae")
    adabotNode.addAnimationPlayer(idleAnimation, forKey: "idle")
    idleAnimation.animation.blendInDuration = 5
    idleAnimation.animation.blendOutDuration = 3


  
  }
  
  
  func playTalkingAnimation() {
  //  adabotNode.animationPlayer(forKey: "looking")?.stop(withBlendOutDuration: 0.5)

    let talkingAnimation = self.loadAnimation(fromSceneNamed: "art.scnassets/Talking Animation.dae")
    self.adabotNode.addAnimationPlayer(talkingAnimation, forKey: "none")
    talkingAnimation.speed = 1.2
    talkingAnimation.animation.blendInDuration = 5
    talkingAnimation.animation.blendOutDuration = 3
    talkingAnimation.animation.repeatCount = 1
    talkingAnimation.animation.isRemovedOnCompletion = true

    //  timer = Timer.scheduledTimer(timeInterval: talkingAnimation.animation.duration + 5, target: self, selector: #selector(playLookAnimation), userInfo: nil, repeats: false)
    
  }
  
  @objc func playLookAnimation() {
    let lookingAnimation = self.loadAnimation(fromSceneNamed: "art.scnassets/Talking Animation.dae")
    self.adabotNode.addAnimationPlayer(lookingAnimation, forKey: "looking")
    lookingAnimation.speed = 1
    lookingAnimation.animation.blendInDuration = 5
    lookingAnimation.animation.blendOutDuration = 3
    lookingAnimation.animation.repeatCount = 1
    lookingAnimation.animation.isRemovedOnCompletion = true

  }

  
  
  
  

  
  func letterOrbit() {

     sphereA = adabotNode.childNode(withName: "Sphere1", recursively: true)!
     sphereA.isHidden = true
     
     sphereB = adabotNode.childNode(withName: "Sphere2", recursively: true)!
     sphereB.isHidden = true
     
     sphereC = adabotNode.childNode(withName: "Sphere3", recursively: true)!
     sphereC.isHidden = true
     
     sphereD = adabotNode.childNode(withName: "Sphere4", recursively: true)!
     sphereD.isHidden = true
     
     sphereF = adabotNode.childNode(withName: "Sphere5", recursively: true)!
     sphereF.isHidden = true
     
     sphereG = adabotNode.childNode(withName: "Sphere6", recursively: true)!
     sphereG.isHidden = true
     
     sphereH = adabotNode.childNode(withName: "Sphere7", recursively: true)!
     sphereH.isHidden = true
     
     sphereI = adabotNode.childNode(withName: "Sphere8", recursively: true)!
     sphereI.isHidden = true
     
     sphereJ = adabotNode.childNode(withName: "Sphere9", recursively: true)!
     sphereJ.isHidden = true
     
     sphereK = adabotNode.childNode(withName: "Sphere10", recursively: true)!
     sphereK.isHidden = true
     
     sphereL = adabotNode.childNode(withName: "Sphere11", recursively: true)!
     sphereL.isHidden = true
     
     sphereM = adabotNode.childNode(withName: "Sphere12", recursively: true)!
     sphereM.isHidden = true
     
     sphereN = adabotNode.childNode(withName: "Sphere13", recursively: true)!
     sphereN.isHidden = true
    
    sphereO = adabotNode.childNode(withName: "Sphere14", recursively: true)!
    sphereO.isHidden = true
    
    sphereP = adabotNode.childNode(withName: "Sphere15", recursively: true)!
    sphereP.isHidden = true
    
  }
  
  
  
  
  
}
