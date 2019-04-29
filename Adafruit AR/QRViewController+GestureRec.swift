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
                    
                    
                    
                    
                    //                else if (node.name) == "Cube1"{
                    //
                    //                    if nodeLit1 {
                    //
                    //                        cubeNode1.geometry?.firstMaterial?.diffuse.contents = UIColor.lightGray
                    //                        cubeNode1.dehighlight()
                    //                        nodeLit1 = true
                    //
                    //                    } else {
                    //                        randomColor(cubeNode1)
                    //                        highlightNode(cubeNode1)
                    //                        nodeLit1 = false
                    //                    }
                    
                    
                    
                    
                    
                    
                    //Test
                else if (node.name) == "neopixel_Button" {
                    
                    if cpxNeoPixelSwitch == false {
                        
                        print("Neopixel button pressed")
                        
                        neoPixelInfo.isHidden = false
                        
                        let scale: Float = 0.0007
                        
                        neoPixelInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(2.1), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        crocButton.isHidden = true
                        speakButton.isHidden = true
                        ATSButton.isHidden = true
                        tempButton.isHidden = true
                        micButton.isHidden = true
                        
                        neoPixelButton.geometry!.firstMaterial?.diffuse.contents = UIColor.orange
                        
                        neoPixelInfo.runAction(scaleAction)
                        cpxNeoPixelSwitch = true
                        
                        
                    } else if cpxNeoPixelSwitch == true {
                        
                        neoPixelButton.geometry!.firstMaterial?.diffuse.contents = UIColor(red: 0, green: 253, blue: 255, alpha: 1)
                       
                        crocButton.isHidden = false
                        speakButton.isHidden = false
                        ATSButton.isHidden = false
                        tempButton.isHidden = false
                        micButton.isHidden = false
                        
                        
                        print("Neopixel Off")
                        
                        neoPixelInfo.removeAllActions()
                        neoPixelInfo.isHidden = true
                        cpxNeoPixelSwitch = false
                        
                        
                    }
                    
                }
                    
                    
                    
                    
                else if (node.name) == "ATSAMD21_Micro_button" {
                    
                    if cpxATSSwitch == false {
                        
                        print("ATSAMD21 button pressed")
                        
                        ATSInfo.isHidden = false
                        
                        let scale: Float = 0.0007
                        
                        ATSInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.8), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                       
                        crocButton.isHidden = true
                        speakButton.isHidden = true
                        neoPixelButton.isHidden = true
                        tempButton.isHidden = true
                        micButton.isHidden = true
                        
                        ATSButton.geometry!.firstMaterial?.diffuse.contents = UIColor.purple
                        
                        ATSInfo.runAction(scaleAction)
                        cpxATSSwitch = true
                        
                        
                    } else if cpxATSSwitch == true {
                        
                        ATSButton.geometry!.firstMaterial?.diffuse.contents = UIColor(red: 0, green: 253, blue: 255, alpha: 1)
                        crocButton.isHidden = false
                        
                        speakButton.isHidden = false
                        neoPixelButton.isHidden = false
                        tempButton.isHidden = false
                        micButton.isHidden = false
                        
                        print("ATSAMD21 Off")
                        //
                        ATSInfo.removeAllActions()
                        ATSInfo.isHidden = true
                        cpxATSSwitch = false
                        
                        
                    }
                    
                }
                    
                else if (node.name) == "Croc_Button" {
                    
                    if cpxCrocSwitch == false {
                        
                        print("Croc button pressed")
                        
                        crocInfo.isHidden = false
                        
                        let scale: Float = 0.0007
                        
                        crocInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.8), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        
                        ATSButton.isHidden = true
                        speakButton.isHidden = true
                        neoPixelButton.isHidden = true
                        tempButton.isHidden = true
                        micButton.isHidden = true
                        
                        
                        
                        crocInfo.runAction(scaleAction)
                        cpxCrocSwitch = true
                        
                        
                    } else if cpxCrocSwitch == true {
                        
                        //Adafruit Blue
                        
                        tempButton.geometry!.firstMaterial?.diffuse.contents = UIColor(red: 0, green: 253, blue: 255, alpha: 1)
                        
                        ATSButton.isHidden = false
                        speakButton.isHidden = false
                        neoPixelButton.isHidden = false
                        tempButton.isHidden = false
                        micButton.isHidden = false
                        
                        print("Croc Off")
                        //
                        crocInfo.removeAllActions()
                        crocInfo.isHidden = true
                        cpxCrocSwitch = false
                        
                        
                    }
                    
                }
                    
                    
                else if (node.name) == "temp_button" {
                    
                    if cpxTempSwitch == false {
                        
                        print("Temp button pressed")
                        
                        tempInfo.isHidden = false
                        
                        let scale: Float = 0.0007
                        
                        tempInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.8), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        ATSButton.isHidden = true
                        speakButton.isHidden = true
                        neoPixelButton.isHidden = true
                        crocButton.isHidden = true
                        micButton.isHidden = true
                        
                        
                        tempButton.geometry!.firstMaterial?.diffuse.contents  = UIColor.red
                        
                        tempInfo.runAction(scaleAction)
                        cpxTempSwitch = true
                        
                        
                    } else if cpxTempSwitch == true {
                        //Adafruit Blue
                       
                        tempButton.geometry!.firstMaterial?.diffuse.contents = UIColor(red: 0, green: 253, blue: 255, alpha: 1)
                        
                        
                        ATSButton.isHidden = false
                        speakButton.isHidden = false
                        neoPixelButton.isHidden = false
                        crocButton.isHidden = false
                        micButton.isHidden = false
                        
                        
                        
                        print("Temp Off")
                        //
                        tempInfo.removeAllActions()
                        tempInfo.isHidden = true
                        cpxTempSwitch = false
                        
                        
                    }
                    
                }
                    

                else if (node.name) == "speaker_button" {
                    
                    if cpxSpeakSwitch == false {
                        
                        print("Speaker button pressed")
                        
                        speakInfo.isHidden = false
                        
                        let scale: Float = 0.0007
                        
                        speakInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.7), duration: 2.2)
                        
                        scaleAction.timingMode = .linear
                        
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        speakInfo.runAction(scaleAction)
                        cpxSpeakSwitch = true
                        
                        ATSButton.isHidden = true
                        
                        neoPixelButton.isHidden = true
                        tempButton.isHidden = true
                        crocButton.isHidden = true
                        micButton.isHidden = true
                        
                        //pink
                        speakButton.geometry!.firstMaterial?.diffuse.contents  = UIColor(red: 248, green: 0, blue: 148, alpha: 1)
                        
                        
                        
                    } else if cpxSpeakSwitch == true {
                        
                        speakButton.geometry!.firstMaterial?.diffuse.contents  = UIColor(red: 0, green: 253, blue: 255, alpha: 1)
                        
                        
                        ATSButton.isHidden = false
                        
                        neoPixelButton.isHidden = false
                        tempButton.isHidden = false
                        crocButton.isHidden = false
                        micButton.isHidden = false
                        
                        
                        print("Speaker Off")
                        //
                        speakInfo.removeAllActions()
                        speakInfo.isHidden = true
                        cpxSpeakSwitch = false
                        
                        
                    }
                    
                }
                    
                    
                    
                else if (node.name) == "mic_button" {
                    
                    if cpxMicSwitch == false {
                        
                        print("Mic button pressed")
                        
                        micInfo.isHidden = false
                        
                        let scale: Float = 0.0007
                        
                        micInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(1.6), duration: 2.2)
                        
                        scaleAction.timingMode = .linear
                        
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        micInfo.runAction(scaleAction)
                        cpxMicSwitch = true
                        //box.firstMaterial?.diffuse.contents  = UIColor.greenColor()
                        micButton.geometry!.firstMaterial?.diffuse.contents  = UIColor.green
                        
                        ATSButton.isHidden = true
                        speakButton.isHidden = true
                        neoPixelButton.isHidden = true
                        tempButton.isHidden = true
                        crocButton.isHidden = true
                        
                        
                    } else if cpxMicSwitch == true {
                        
                        
                        micButton.geometry!.firstMaterial?.diffuse.contents  = UIColor(red: 0, green: 253, blue: 255, alpha: 1)
                        
                        ATSButton.isHidden = false
                        speakButton.isHidden = false
                        neoPixelButton.isHidden = false
                        tempButton.isHidden = false
                        crocButton.isHidden = false
                        

                        
                        print("Mic Off")
                        //
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
                    
                    
                else {
                    print("Nothing Detected.")
                }
                
            }
        }
    }
    
    
    @objc func handlePinch(_ pinchRecognize: UIPinchGestureRecognizer) {
        
        let scale = Float(pinchRecognize.scale / 10)
        let currentScale = pyNode.scale.x
        let newScale = scale / currentScale
        self.pyNode.scale.x = newScale
        self.pyNode.scale.y = newScale
        self.pyNode.scale.z = newScale
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
            pyNode.runAction(pinchAction)
            sender.scale = 1.0
            
        }
    }
    
    
    
    
    
    
}
