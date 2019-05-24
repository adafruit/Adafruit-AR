//
//  QRViewController+GestureRec.swift
//  Adafruit AR
//
//  Created by Trevor B on 4/24/19.
//  Copyright © 2019 Vanguard Logic LLC. All rights reserved.
//

import UIKit
import ARKit
import SceneKit


extension QRViewController {
    
    //Gesture Recognizers & Actions
    func registerTapRecognizer() {
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        let tapGestureRecognizer =  UITapGestureRecognizer (target:self ,action : #selector (tapped))
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panned))
        
        self.qrSceneView.addGestureRecognizer(tapGestureRecognizer)
        self.qrSceneView.addGestureRecognizer(pinchGestureRecognizer)
        self.qrSceneView.addGestureRecognizer(panGestureRecognizer)
    
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
  

                
                else if (node.name) == "neopixel_Button" {
                    
                    if cpxNeoPixelSwitch == false {

                        setCpxUI(Button: neoPixelButton, Display: neoPixelInfo)

                        let scale: Float = 0.0007
                        
                        neoPixelInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }

                        neoPixelInfo.runAction(scaleAction)
                        
                        cpxNeoPixelSwitch = true
                        
                    } else if cpxNeoPixelSwitch == true {
                        
                        neoPixelButton.geometry!.firstMaterial?.transparency = 0.2
                        neoPixelInfo.removeAllActions()
                        neoPixelInfo.isHidden = true
                        cpxNeoPixelSwitch = false
                    }
                    
                }

                else if (node.name) == "ATSAMD21_Micro_button" {
                    
                    if cpxATSSwitch == false {
                        
                        let scale: Float = 0.0007
                        
                        ATSInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.3), duration: 1.8)
                        scaleAction.timingMode = .linear
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }

                        setCpxUI(Button: ATSButton, Display: ATSInfo)
                        ATSInfo.runAction(scaleAction)
                        cpxATSSwitch = true
                   
                    } else if cpxATSSwitch == true {
                        
                        ATSButton.geometry!.firstMaterial?.transparency = 0.2
                        ATSInfo.removeAllActions()
                        ATSInfo.isHidden = true
                        cpxATSSwitch = false
                        
                        
                    }
                    
                }
                    
                else if (node.name) == "Croc_Button" {
                    
                    if cpxCrocSwitch == false {

                        let scale: Float = 0.0007
                        
                        crocInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.2), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        setCpxUI(Button: crocButton, Display: crocInfo)

                        crocInfo.runAction(scaleAction)
                        
                        cpxCrocSwitch = true
                        
                    } else if cpxCrocSwitch == true {
                        
                        crocButton.geometry!.firstMaterial?.transparency = 0.2
                        crocInfo.removeAllActions()
                        crocInfo.isHidden = true
                        cpxCrocSwitch = false
                        
                        
                    }
                    
                }
                    
                    
                else if (node.name) == "temp_button" {
                    
                    if cpxTempSwitch == false {

                        let scale: Float = 0.0007
                        
                        temperatureDisplay.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        setCpxUI(Button: temperatureButton, Display: temperatureDisplay)

                        temperatureDisplay.runAction(scaleAction)
                       
                        cpxTempSwitch = true
                        
                        
                    } else if cpxTempSwitch == true {

                        temperatureButton.geometry!.firstMaterial?.transparency = 0.2
                        temperatureDisplay.removeAllActions()
                        temperatureDisplay.isHidden = true
                        cpxTempSwitch = false
                        
                    }
                    
                }
                    

                else if (node.name) == "speaker_button" {
                    
                    if cpxSpeakSwitch == false {
                        
                        let scale: Float = 0.0007
                        
                        speakInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 2.2)
                        
                        scaleAction.timingMode = .linear
  
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }

                        speakInfo.runAction(scaleAction)
                        
                        setCpxUI(Button: speakButton, Display: speakInfo)

                        cpxSpeakSwitch = true

                    } else if cpxSpeakSwitch == true {
                        
                        speakButton.geometry!.firstMaterial?.transparency = 0.2
                        speakInfo.removeAllActions()
                        speakInfo.isHidden = true
                        cpxSpeakSwitch = false
                        
                        
                    }
                    
                }
                    
                    
                    
                else if (node.name) == "mic_button" {
                    
                    if cpxMicSwitch == false {

                        let scale: Float = 0.0007
                        
                        micInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.2), duration: 2.2)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        setCpxUI(Button: micButton, Display: micInfo)

                        micInfo.runAction(scaleAction)

                        cpxMicSwitch = true
   
                    } else if cpxMicSwitch == true {
                        
                        micButton.geometry!.firstMaterial?.transparency = 0.2
                        micInfo.removeAllActions()
                        micInfo.isHidden = true
                        cpxMicSwitch = false
                        
                        
                    }
                    
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
                    
                else if (node.name) == "Pyportal Learn Guide"{
                    
                    
                    let alert = UIAlertController(title: "Leaving Adafruit AR", message: "Would you like to visit the PyPortal Learn Guide?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "I Don't Like Nice Things", style: .default, handler: nil))
                    
                    alert.addAction(UIAlertAction(title: "Lets Go!", style: .default, handler: { (nil) in
                        
                        if let url = URL(string: "https://learn.adafruit.com/adafruit-pyportal") {
                            UIApplication.shared.open(url, options: [:])
                        }
                    }))
                    
                    present(alert, animated: true, completion: nil)
                    
                    print("Launching PyPortal Guide...")
                }
                    
                else if (node.name) == "pyVideoLabel" {
                    
                    
                    if pyVidSwitch == false {
                        print("Test1")
                        
                        pyPlayText.isHidden = true
                        pyStopText.isHidden = false
                        pyLabelDescription.isHidden = true
                        pyVideo.isHidden = false
                        playPyVideo()
                        pyVidSwitch = true
                        
                    } else if pyVidSwitch == true {
                        print("Test2")
                        pyPlayText.isHidden = false
                        pyStopText.isHidden = true
                        pyLabelDescription.isHidden = false
                        self.pyPlayer.seek(to: kCMTimeZero)
                        pyPlayerNode.pause()
                        pyVideo.geometry?.firstMaterial?.diffuse.contents = nil
                        
                        
                        pyVidSwitch = false
                        pyVideo.isHidden = true
                    }
                    
                    
                }
                    
                    
                else if (node.name) == "py_Sensor_Button" {
                    
                    if pySensorSwitch == false {
                        
                        setPy(Button: pySensorButton, Display: pySensorInfo)
                        
                        let scale: Float = 0.0007
                        
                        pySensorInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pySensorInfo.runAction(scaleAction)
                        
                        pySensorSwitch = true
                        
                    } else if pySensorSwitch == true {
                        
                        pySensorButton.geometry!.firstMaterial?.transparency = 0.2
                        pySensorInfo.removeAllActions()
                        pySensorInfo.isHidden = true
                        pySensorSwitch = false
                    }
                    
                }
                    
                else if (node.name) == "py_Wifi_Button" {
                    
                    if pyWifiSwitch == false {
                        
                        setPy(Button: pyWifiButton, Display: pyWifiInfo)
                        
                        let scale: Float = 0.0007
                        
                        pyWifiInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pyWifiInfo.runAction(scaleAction)
                        
                        pyWifiSwitch = true
                        
                    } else if pyWifiSwitch == true {
                        
                        pyWifiButton.geometry!.firstMaterial?.transparency = 0.2
                        pyWifiInfo.removeAllActions()
                        pyWifiInfo.isHidden = true
                        pyWifiSwitch = false
                    }
                    
                }
                    
                else if (node.name) == "py_ATSAMD_Button" {
                    
                    if pyATSSwitch == false {
                        
                        setPy(Button: pyATSButton, Display: pyATSInfo)
                        
                        let scale: Float = 0.0007
                        
                        pyATSInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pyATSInfo.runAction(scaleAction)
                        
                        pyATSSwitch = true
                        
                    } else if pyATSSwitch == true {
                        
                        pyATSButton.geometry!.firstMaterial?.transparency = 0.2
                        pyATSInfo.removeAllActions()
                        pyATSInfo.isHidden = true
                        pyATSSwitch = false
                    }
                    
                }
                    
                else if (node.name) == "py_Speaker_Button" {
                    
                    if pySpeakerSwitch == false {
                        
                        setPy(Button: pySpeakerButton, Display: pySpeakerInfo)
                        
                        let scale: Float = 0.0007
                        
                        pySpeakerInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pySpeakerInfo.runAction(scaleAction)
                        
                        pySpeakerSwitch = true
                        
                    } else if pySpeakerSwitch == true {
                        
                        pySpeakerButton.geometry!.firstMaterial?.transparency = 0.2
                        pySpeakerInfo.removeAllActions()
                        pySpeakerInfo.isHidden = true
                        pySpeakerSwitch = false
                    }
                    
                }
                    
                else if (node.name) == "py_Connector_Button" {
                    
                    if pyConnectorSwitch == false {
                        
                        setPy(Button: pyConnectorButton, Display: pyConnectorInfo)
                        
                        let scale: Float = 0.0007
                        
                        pyConnectorInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pyConnectorInfo.runAction(scaleAction)
                        
                        pyConnectorSwitch = true
                        
                    } else if pyConnectorSwitch == true {
                        
                        pyConnectorButton.geometry!.firstMaterial?.transparency = 0.2
                        pyConnectorInfo.removeAllActions()
                        pyConnectorInfo.isHidden = true
                        pyConnectorSwitch = false
                    }
                    
                }
                    
                    
                else if (node.name) == "py_IC2_Button" {
                    
                    if pyIC2Switch == false {
                        
                        setPy(Button: pyIC2Button, Display: pyIC2Info)
                        
                        let scale: Float = 0.0007
                        
                        pyIC2Info.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pyIC2Info.runAction(scaleAction)
                        
                        pyIC2Switch = true
                        
                    } else if pyIC2Switch == true {
                        
                        pyIC2Button.geometry!.firstMaterial?.transparency = 0.2
                        pyIC2Info.removeAllActions()
                        pyIC2Info.isHidden = true
                        pyIC2Switch = false
                    }
                    
                }
                    
                    
                else if (node.name) == "py_D_A_Button" {
                    
                    if pyDASwitch == false {
                        
                        setPy(Button: pyDAButton, Display: pyDAInfo)
                        
                        let scale: Float = 0.0007
                        
                        pyDAInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pyDAInfo.runAction(scaleAction)
                        
                        pyDASwitch = true
                        
                    } else if pyDASwitch == true {
                        
                        pyDAButton.geometry!.firstMaterial?.transparency = 0.2
                        pyDAInfo.removeAllActions()
                        pyDAInfo.isHidden = true
                        pyDASwitch = false
                    }
                    
                }
                    
                    
                    
                    
                else {
                    print("Nothing Detected.")
                }
                
            }
        }
    }
    

    func setCpxUI(Button: SCNNode, Display: SCNNode) {
        
        print("\(Button.name ?? "") was pressed and " + "\(Display.name ?? "") was displayed")
        
        Button.isHidden = false
       
        Button.geometry!.firstMaterial?.transparency = 0.9
        
        Display.isHidden = false
        
        CPXButtons = CPXButtons.filter { $0 != Button }
        
        CPXDisplays = CPXDisplays.filter { $0 != Display }
        
        CPXButtons.forEach { button in
            
            button.geometry!.firstMaterial?.transparency = 0.2
        }
        
        CPXDisplays.forEach { display in
            
           display.isHidden = true
            

        }
        
    CPXButtons = [ATSButton, micButton, crocButton, temperatureButton, speakButton,neoPixelButton]
    CPXDisplays = [crocInfo, speakInfo, ATSInfo, temperatureDisplay,micInfo, neoPixelInfo]
        
        
        

        
    }

    
    
    func setPy(Button: SCNNode, Display: SCNNode) {
     
        print("\(Button.name ?? "") was pressed and " + "\(Display.name ?? "") was displayed")
        
        Button.isHidden = false
        
        Button.geometry!.firstMaterial?.transparency = 0.9
        
        Display.isHidden = false
        
        PyButtons = PyButtons.filter { $0 != Button }
        
        PyDisplays = PyDisplays.filter { $0 != Display }
        
        PyButtons.forEach { button in
            
            button.geometry!.firstMaterial?.transparency = 0.2
        }
        
        PyDisplays.forEach { display in
            
            display.isHidden = true
            
        }
        
        PyButtons = [pyATSButton, pySensorButton, pyDAButton, pySpeakerButton, pyWifiButton, pyIC2Button, pyConnectorButton]
        PyDisplays = [pyATSInfo, pySpeakerInfo, pyDAInfo, pyWifiInfo, pySensorInfo, pyConnectorInfo, pyIC2Info]
        
    }
    
    
    
    
    
    //Rotation
    @objc func panned(recognizer :UIPanGestureRecognizer) {
        
        if recognizer.state == .changed {
            
            guard let sceneView = recognizer.view as? ARSCNView else {
                return
            }
            
            let touch = recognizer.location(in: sceneView)
            let translation = recognizer.translation(in: sceneView)
            
            let hitTestResults = self.qrSceneView.hitTest(touch, options: nil)
            
            if let hitTest = hitTestResults.first {
                
                let currentNode = hitTest.node
                
                self.newAngleY = Float(translation.x) * (Float) (Double.pi)/180
                self.newAngleY += self.currentAngleY
                
                
                 cpxNode.eulerAngles.z = self.newAngleY
                 grandCentralNode.eulerAngles.z = self.newAngleY
                 crickitNode.eulerAngles.z = self.newAngleY
                 halloWingNode.eulerAngles.z = self.newAngleY
                 neoTrellis.eulerAngles.z = self.newAngleY
                 pyNode.eulerAngles.z = self.newAngleY
                
            }
            
        }
        else if recognizer.state == .ended {
            self.currentAngleY = self.newAngleY
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
            sender.scale = 1.0
            
            cpxNode.runAction(pinchAction)
            grandCentralNode.runAction(pinchAction)
            crickitNode.runAction(pinchAction)
            halloWingNode.runAction(pinchAction)
            pyNode.runAction(pinchAction)
            neoTrellis.runAction(pinchAction)



        }
    }
    
    
    
    
    
    
}
