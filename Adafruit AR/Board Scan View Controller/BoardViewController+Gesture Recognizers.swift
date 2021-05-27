//
//  QRViewController+GestureRec.swift
//  Adafruit AR
//
//  Created by Trevor B on 4/24/19.
//  Copyright © 2019 Adafruit. All rights reserved.
//

import UIKit
import ARKit
import SceneKit



extension BoardViewController {
    
    //Gesture Recognizers & Actions
    func registerTapRecognizer() {
        
        let tapGestureRecognizer =  UITapGestureRecognizer (target:self ,action : #selector (tapped))
       
        self.boardSceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    //Tap Gesture
    @objc func tapped(sender: UITapGestureRecognizer) {
        
        let sceneView = sender.view as! ARSCNView
        
        let hitResults = sceneView.hitTest(view.center, types: .existingPlaneUsingExtent)
        
        _ = sender.location(in: self.boardSceneView)
        
        if !hitResults.isEmpty == false  {
            print("Surface Touched")
            
        } else {
            
            print("DID NOT LOAD NODE.")
        }
        
        if sender.state == .ended  {
            
            let location: CGPoint = sender.location(in: sceneView)
            
            let hits = self.boardSceneView.hitTest(location, options: nil)
            
            if hits.count > 0 {
                
                
                let result = hits[0]
                
                let node = result.node
                
                
                fadeOut = SCNAction.fadeOut(duration: 1)
                
                fadeIn = SCNAction.fadeIn(duration: 0.0001)
                
                
                    
                    
                    
                 if (node.name) == "neopixel_Button" {
                    
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
                        
                    } else {
                        
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
                        
                    } else {
                        
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
                        
                    } else {
                        
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
                        
                        
                    } else {
                        
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
                        
                    } else {
                        
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
                        
                    } else {
                        
                        micButton.geometry!.firstMaterial?.transparency = 0.2
                        micInfo.removeAllActions()
                        micInfo.isHidden = true
                        cpxMicSwitch = false
                        
                        
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
                        
                        pySensorButton.geometry!.firstMaterial?.transparency = 0.9
                        
                        pySensorInfo.runAction(scaleAction)
                        
                        pySensorSwitch = true
                        
                    } else {
                        
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
                        
                        pyWifiButton.geometry!.firstMaterial?.transparency = 0.9
                        
                        pyWifiInfo.runAction(scaleAction)
                        
                        pyWifiSwitch = true
                        
                    } else {
                        
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
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.6)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pyATSButton.geometry!.firstMaterial?.transparency = 0.9
                        
                        pyATSInfo.runAction(scaleAction)
                        
                        pyATSSwitch = true
                        
                    } else {
                        
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
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(0.8), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        
                        
                        pySpeakerInfo.runAction(scaleAction)
                        
                        pySpeakerSwitch = true
                        
                    } else {
                        
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
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pyConnectorInfo.runAction(scaleAction)
                        
                        pyConnectorSwitch = true
                        
                    } else {
                        
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
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(0.8), duration: 1.5
                        )
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pyIC2Info.runAction(scaleAction)
                        
                        pyIC2Switch = true
                        
                    } else {
                        
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
                        
                        let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                        
                        scaleAction.timingMode = .linear
                        
                        // Use a custom timing function
                        scaleAction.timingFunction = { (p: Float) in
                            return self.easeOutElastic(p)
                        }
                        
                        pyDAInfo.runAction(scaleAction)
                        
                        pyDASwitch = true
                        
                    } else {
                        
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
        
        
//        //Circuit Playground Interaction Test
//        cpxNeoPixelSwitch = false
//        
//        cpxATSSwitch = false
//        
//        cpxCrocSwitch = false
//        
//        cpxTempSwitch = false
//        
//        cpxSpeakSwitch = false
//        
//        cpxMicSwitch = false
        
        
        
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
        
        
        
//        pyATSSwitch = false
//
//        pyIC2Switch = false
//
//        pySensorSwitch = false
//
//        pySpeakerSwitch = false
//
//        pyDASwitch = false
//
//        pyWifiSwitch = false
//
//        pyConnectorSwitch = false
        
    }
    
}

