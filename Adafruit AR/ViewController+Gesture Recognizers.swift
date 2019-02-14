//
//  View Controller + Gesture Recognizers.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 7/18/18.
//  Copyright © 2018 Vanguard Logic LLC. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

extension ViewController {
  
  //Mark:- Gesture Recognizers --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  func registerTapRecognizer() {
    let tapGestureRecognizer =  UITapGestureRecognizer (target:self ,action : #selector (tapped))
    let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
    let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(rotate))
    
    self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    self.sceneView.addGestureRecognizer(pinchGestureRecognizer)
    self.sceneView.addGestureRecognizer(longPressGestureRecognizer)
  }
  
  
  //Gesture Actions
  @objc func tapped(sender: UITapGestureRecognizer) {
   
    let sceneView = sender.view as! ARSCNView
    
    let hitResults = sceneView.hitTest(view.center, types: .existingPlaneUsingExtent)
    
    let currentTouchPoint = sender.location(in: self.sceneView)
    
    if !hitResults.isEmpty && nodeLoadedtoCurrentScene == false  {
      print("Surface Touched")
      clearScene()
      loadAdabotScene(hitTestResult: hitResults.first!)
      storedVarible = 0

    } else {
     
        print("DID NOT LOAD NODE.")
   
    }
    
    if sender.state == .ended && !nodeLoadedtoCurrentScene == false {

      let location: CGPoint = sender.location(in: sceneView)
     
      let hits = self.sceneView.hitTest(location, options: nil)
      
      if hits.count > 0 {
        
    let result = hits[0] as! SCNHitTestResult
    
    let node = result.node

        fadeOut = SCNAction.fadeOut(duration: 1)
       
        fadeIn = SCNAction.fadeIn(duration: 0.0001)
      
        if (node.name) == "Adabot_Node"{
        
         fadeInAllLetters()
         exitVideoNode()
         generateRandomNum()
         playTalkingAnimation()
         playOtherSoundClips()
          
        print("Adabot Test")
          
        }else if (node.name) == "LetterA"{
          
        playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/a_is_for_ampere.mp4")!)

        fadeOutAllLetters()
       
        print("Letter A was tapped.")

       
        }else if (node.name) == "LetterB"{

          playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/b_is_for_battery.mp4")!)
          
        
          fadeOutAllLetters()
        
          print("Letter B was tapped.")
          
        }else if (node.name) == "LetterC"{
         
          
            playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/c_is_for_capacitor.mp4")!)
          
        fadeOutAllLetters()
          print("Letter C was tapped.")
          
        }else if (node.name) == "LetterD"{
          
          
            playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/d_is_for_diode.mp4")!)
          
          fadeOutAllLetters()
          print("Letter D was tapped.")
          
        }else if (node.name) == "LetterF"{
          
          playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/f_is_for_frequency.mp4")!)
          
          fadeOutAllLetters()
          print("Letter F was tapped.")
          
        }else if (node.name) == "LetterG"{
          
            playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/g_is_for_ground.mp4")!)
          
         fadeOutAllLetters()
          print("Letter G was tapped.")
          
        }else if (node.name) == "LetterH"{

            playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/h_is_for_hertz.mp4")!)
          
          fadeOutAllLetters()
          print("Letter H was tapped.")
          
        }else if (node.name) == "LetterI"{
        
          playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/i_is_for_IC.mp4")!)
          
          fadeOutAllLetters()
          print("Letter I was tapped.")
          
        } else if (node.name) == "LetterJ"{
          
          playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/j_is_for_joule.mp4")!)
          
          fadeOutAllLetters()
          print("Letter J was tapped.")
       
        } else if (node.name) == "LetterK"{
          
          playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/k_is_for_kits.mp4")!)
          
          fadeOutAllLetters()
          print("Letter K was tapped.")
        
        } else if (node.name) == "LetterL"{
          
          playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/l_is_for_led.mp4")!)
          
          fadeOutAllLetters()
          print("Letter L was tapped.")
        } else if (node.name) == "LetterM"{
          
          playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/m_is_for_mosfet.mp4")!)
          
          fadeOutAllLetters()
          print("Letter M was tapped.")
        } else if (node.name) == "LetterN"{
          
            playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/n_is_for_noise.mp4")!)
          
          fadeOutAllLetters()
          print("Letter N was tapped.")
            
        } else if (node.name) == "LetterO"{
                
                playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/o_is_for_ohm.mp4")!)
                
                fadeOutAllLetters()
                print("Letter O was tapped.")
            
        }else if (node.name) == "LetterP"{
                
                playVideo(URL(string: "https://s3.amazonaws.com/adafruit-ar/video/circuit_playground/p_is_for_pcb.mp4")!)
                
                fadeOutAllLetters()
                print("Letter P was tapped.")
            
            
        }else if (SKVideoNode).self == SKVideoNode.self {
        
          if videoNodeIsPlaying == false {
         
            playerNode.play()

            videoNodeIsPlaying = !videoNodeIsPlaying
            
          } else if videoNodeIsPlaying == true {
           
            videoNodeIsPlaying = !videoNodeIsPlaying
            
            playerNode.pause()

          }
          
        }else {
          print("Nothing Detected.")
        }
        
      }
    }
  }
  
  
  @objc func pinch(sender: UIPinchGestureRecognizer) {
    print("Pinch function called")
    
    let sceneView = sender.view as! ARSCNView
    let pinchLocation = sender.location(in: sceneView)
    let hitResults = sceneView.hitTest(pinchLocation)
   
    if !hitResults.isEmpty {
      
      let pinchAction = SCNAction.scale(by: sender.scale, duration: 0)
      print(sender.scale)
      adabotNode.runAction(pinchAction)
      sender.scale = 1.0
    }
  
    
    }
  
  
  @objc func rotate(sender: UILongPressGestureRecognizer) {
    let sceneView = sender.view as! ARSCNView
    let holdLocation = sender.location(in: sceneView)
    let hitTest = sceneView.hitTest(holdLocation)

    if !hitTest.isEmpty {
     
      if sender.state == .began {
        
        if videoWasLoadedToScene == true {
         
          exitVideoNode()
          
          fadeInAllLetters()
          
        } else if videoWasLoadedToScene == false {
         
          let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreesToRadians), z: 0, duration: 2)
          
          let forever = SCNAction.repeatForever(rotation)
          
          adabotNode.runAction(forever)
          
        }
        
      } else if sender.state == .ended {
      
        adabotNode.removeAllActions()
      }
    }
  }
  
  
  func exitVideoNode() {
    videoFrame.isHidden = true
    videoNode.isHidden = true
    videoWasLoadedToScene = false
    playerNode.pause()
    playerNode.removeFromParent()
    

  }
  
  
  func fadeOutAllLetters() {
   
    self.LetterNodeA.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeB.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeC.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeD.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeF.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeG.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeH.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeI.runAction(fadeOut, forKey: "fadeOut")
 
    self.LetterNodeJ.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeK.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeL.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeM.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeN.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeO.runAction(fadeOut, forKey: "fadeOut")
    self.LetterNodeP.runAction(fadeOut, forKey: "fadeOut")
    
  }
  
  
  func fadeInAllLetters() {
  
    let longerFadeIn = SCNAction.fadeIn(duration: 1)
    
    LetterNodeA.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeB.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeC.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeD.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeF.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeG.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeH.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeI.runAction(longerFadeIn, forKey: "fadeIn2")
  
    LetterNodeJ.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeK.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeL.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeM.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeN.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeO.runAction(longerFadeIn, forKey: "fadeIn2")
    LetterNodeP.runAction(longerFadeIn, forKey: "fadeIn2")
  }
  
  
  func removeAllAnimationsForLetters() {

    LetterNodeA.removeAction(forKey: "fadeOut")
    LetterNodeB.removeAction(forKey: "fadeOut")
    LetterNodeC.removeAction(forKey: "fadeOut")
    LetterNodeD.removeAction(forKey: "fadeOut")
    LetterNodeF.removeAction(forKey: "fadeOut")
    LetterNodeG.removeAction(forKey: "fadeOut")
    LetterNodeH.removeAction(forKey: "fadeOut")
    LetterNodeI.removeAction(forKey: "fadeOut")
    LetterNodeJ.removeAction(forKey: "fadeOut")
    LetterNodeK.removeAction(forKey: "fadeOut")
    LetterNodeL.removeAction(forKey: "fadeOut")
    LetterNodeM.removeAction(forKey: "fadeOut")
    LetterNodeN.removeAction(forKey: "fadeOut")
    LetterNodeO.removeAction(forKey: "fadeOut")
    LetterNodeP.removeAction(forKey: "fadeOut")
    
    
    LetterNodeA.removeAction(forKey: "fadeIn")
    LetterNodeB.removeAction(forKey: "fadeIn")
    LetterNodeC.removeAction(forKey: "fadeIn")
    LetterNodeD.removeAction(forKey: "fadeIn")
    LetterNodeF.removeAction(forKey: "fadeIn")
    LetterNodeG.removeAction(forKey: "fadeIn")
    LetterNodeH.removeAction(forKey: "fadeIn")
    LetterNodeI.removeAction(forKey: "fadeIn")
    LetterNodeJ.removeAction(forKey: "fadeIn")
    LetterNodeK.removeAction(forKey: "fadeIn")
    LetterNodeL.removeAction(forKey: "fadeIn")
    LetterNodeM.removeAction(forKey: "fadeIn")
    LetterNodeN.removeAction(forKey: "fadeIn")
    LetterNodeO.removeAction(forKey: "fadeIn")
    LetterNodeP.removeAction(forKey: "fadeIn")
    
  }
  
}
