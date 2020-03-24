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
                
                neoPixelButton.geometry!.firstMaterial?.transparency = 0.3
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
                
                ATSButton.geometry!.firstMaterial?.transparency = 0.3
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
                
                crocButton.geometry!.firstMaterial?.transparency = 0.5
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
                
                temperatureButton.geometry!.firstMaterial?.transparency = 0.5
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
                
                speakButton.geometry!.firstMaterial?.transparency = 0.5
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
                
                micButton.geometry!.firstMaterial?.transparency = 0.5
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
            
        else if (node.name) == "pygamer_Sensor_Button" {
            
            if pygamerSensorSwitch == false {
                
                setPygamer(Button: pygamerSensorButton, Display: pygamerSensorInfo)
                
                let scale: Float = 0.0007
                
                pygamerSensorInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                pygamerSensorButton.geometry!.firstMaterial?.transparency = 0.9
                
                pygamerSensorInfo.runAction(scaleAction)
                
                pygamerSensorSwitch = true
                
            } else {
                
                pygamerSensorButton.geometry!.firstMaterial?.transparency = 0.2
                pygamerSensorInfo.removeAllActions()
                pygamerSensorInfo.isHidden = true
                pygamerSensorSwitch = false
            }
            
        }
            
        else if (node.name) == "pygamer_Accelerometer_Button" {
            
            if pygamerAccelerometerSwitch == false {
                
                setPygamer(Button: pygamerAccelerometerButton, Display: pygamerAccelerometerInfo)
                
                let scale: Float = 0.0007
                
                pygamerAccelerometerInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                pygamerAccelerometerButton.geometry!.firstMaterial?.transparency = 0.9
                
                pygamerAccelerometerInfo.runAction(scaleAction)
                
                pygamerAccelerometerSwitch = true
                
            } else {
                
                pygamerAccelerometerButton.geometry!.firstMaterial?.transparency = 0.2
                pygamerAccelerometerInfo.removeAllActions()
                pygamerAccelerometerInfo.isHidden = true
                pygamerAccelerometerSwitch = false
            }
            
        }
            
        else if (node.name) == "pygamer_ATSAMD_Button" {
            
            if pygamerATSSwitch == false {
                
                setPygamer(Button: pygamerATSButton, Display: pygamerATSInfo)
                
                let scale: Float = 0.0007
                
                pygamerATSInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.8), duration: 1.6)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                pygamerATSButton.geometry!.firstMaterial?.transparency = 0.9
                
                pygamerATSInfo.runAction(scaleAction)
                
                pygamerATSSwitch = true
                
            } else {
                
                pygamerATSButton.geometry!.firstMaterial?.transparency = 0.2
                pygamerATSInfo.removeAllActions()
                pygamerATSInfo.isHidden = true
                pygamerATSSwitch = false
            }
            
        }
            
        else if (node.name) == "pygamer_Speaker_Button" {
            
            if pygamerSpeakerSwitch == false {
                
                setPygamer(Button: pygamerSpeakerButton, Display: pygamerSpeakerInfo)
                
                let scale: Float = 0.0007
                
                pygamerSpeakerInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                
                
                pygamerSpeakerInfo.runAction(scaleAction)
                
                pygamerSpeakerSwitch = true
                
            } else {
                
                pygamerSpeakerButton.geometry!.firstMaterial?.transparency = 0.2
                pygamerSpeakerInfo.removeAllActions()
                pygamerSpeakerInfo.isHidden = true
                pygamerSpeakerSwitch = false
            }
            
        }
            
        else if (node.name) == "pygamer_Feather_Button" {
            
            if pygamerFeatherSwitch == false {
                
                setPygamer(Button: pygamerFeatherButton, Display: pygamerFeatherInfo)
                
                let scale: Float = 0.0007
                
                pygamerFeatherInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.8), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                pygamerFeatherInfo.runAction(scaleAction)
                
                pygamerFeatherSwitch = true
                
            } else {
                
                pygamerFeatherButton.geometry!.firstMaterial?.transparency = 0.2
                pygamerFeatherInfo.removeAllActions()
                pygamerFeatherInfo.isHidden = true
                pygamerFeatherSwitch = false
            }
            
        }
            
            
        else if (node.name) == "pygamer_IC2_Button" {
            
            if pygamerIC2Switch == false {
                
                setPygamer(Button: pygamerIC2Button, Display: pygamerIC2Info)
                
                let scale: Float = 0.0007
                
                pygamerIC2Info.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.7), duration: 1.5
                )
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                pygamerIC2Info.runAction(scaleAction)
                
                pygamerIC2Switch = true
                
            } else {
                
                pygamerIC2Button.geometry!.firstMaterial?.transparency = 0.2
                pygamerIC2Info.removeAllActions()
                pygamerIC2Info.isHidden = true
                pygamerIC2Switch = false
            }
            
        }
            
            
        else if (node.name) == "pygamer_D_A_Button" {
            
            if pygamerDASwitch == false {
                
                setPygamer(Button: pygamerDAButton, Display: pygamerDAInfo)
                
                let scale: Float = 0.0007
                
                pygamerDAInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.8), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                pygamerDAInfo.runAction(scaleAction)
                
                pygamerDASwitch = true
                
            } else {
                
                pygamerDAButton.geometry!.firstMaterial?.transparency = 0.2
                pygamerDAInfo.removeAllActions()
                pygamerDAInfo.isHidden = true
                pygamerDASwitch = false
            }
            
        }
            
        else if (node.name) == "pygamer_JST_Button" {
            
            if pygamerJSTSwitch == false {
                
                setPygamer(Button: pygamerJSTButton, Display: pygamerJSTInfo)
                
                let scale: Float = 0.0007
                
                pygamerJSTInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                pygamerJSTInfo.runAction(scaleAction)
                
                pygamerJSTSwitch = true
                
            } else {
                
                pygamerJSTButton.geometry!.firstMaterial?.transparency = 0.2
                pygamerJSTInfo.removeAllActions()
                pygamerJSTInfo.isHidden = true
                pygamerJSTSwitch = false
            }
            
        }
            
            
        else if (node.name) == "pygamer_Buttons" {
            
            if pyButtonsSwitch == false {
                
                setFrontPygamer(Button: pyButtons, Display: pyButtonsDisplay)
                
                let scale: Float = 0.0007
                
                pyButtonsDisplay.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                pyButtonsDisplay.runAction(scaleAction)
                
                pyButtonsSwitch = true
                
            } else {
                
                pyButtons.geometry!.firstMaterial?.transparency = 0.2
                pyButtonsDisplay.removeAllActions()
                pyButtonsDisplay.isHidden = true
                pyButtonsSwitch = false
            }
            
        }
            
            
            
        else if (node.name) == "pygamer_NeoPixel_Button" {
            
            if pyNeopixelsSwitch == false {
                
                setFrontPygamer(Button: pyNeopixels, Display: pyNeopixelsDisplay)
                
                let scale: Float = 0.0007
                
                pyNeopixelsDisplay.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                pyNeopixelsDisplay.runAction(scaleAction)
                
                pyNeopixelsSwitch = true
                
            } else {
                
                pyNeopixels.geometry!.firstMaterial?.transparency = 0.2
                pyNeopixelsDisplay.removeAllActions()
                pyNeopixelsDisplay.isHidden = true
                pyNeopixelsSwitch = false
            }
            
        }
            
        else if (node.name) == "pygamer_TFT_Button" {
            
            if TFTDisplaySwitch == false {
                
                setFrontPygamer(Button: TFTDisplay, Display: TFTDisplayInfo)
                
                let scale: Float = 0.0007
                
                TFTDisplayInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                TFTDisplayInfo.runAction(scaleAction)
                
                TFTDisplaySwitch = true
                
            } else {
                
                TFTDisplay.geometry!.firstMaterial?.transparency = 0.2
                TFTDisplayInfo.removeAllActions()
                TFTDisplayInfo.isHidden = true
                TFTDisplaySwitch = false
            }
            
        }
            
            
        else if (node.name) == "pygamer_Analog_Button" {
            
            if analogStickSwitch == false {
                
                setFrontPygamer(Button: analogStick, Display: analogStickDisplay)
                
                let scale: Float = 0.0007
                
                analogStickDisplay.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                analogStickDisplay.runAction(scaleAction)
                
                analogStickSwitch = true
                
            } else {
                
                analogStick.geometry!.firstMaterial?.transparency = 0.2
                analogStickDisplay.removeAllActions()
                analogStickDisplay.isHidden = true
                analogStickSwitch = false
            }
            
        }
            
        else if (node.name) == "ClueTFT_button" {
            
            if clueTFTSwitch == false {
                
                setClueUI(Button: clueTFTButton, Display: clueTFTInfo)
                
                let scale: Float = 0.0007
                
                clueTFTInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                clueTFTButton.geometry!.firstMaterial?.transparency = 0.9
                
                clueTFTInfo.runAction(scaleAction)
                
                clueTFTSwitch = true
                
            } else {
                
                clueTFTButton.geometry!.firstMaterial?.transparency = 0.3
                clueTFTInfo.removeAllActions()
                clueTFTInfo.isHidden = true
                clueTFTSwitch = false
            }
            
        }
            
        else if (node.name) == "ClueNeopixel_button" {
            
            if clueNeopixelSwitch == false {
                
                setClueUI(Button: clueNeopixelButton, Display: clueNeopixelInfo)
                
                let scale: Float = 0.0007
                
                clueNeopixelInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                clueNeopixelButton.geometry!.firstMaterial?.transparency = 0.9
                
                clueNeopixelInfo.runAction(scaleAction)
                
                clueNeopixelSwitch = true
                
            } else {
                
                clueNeopixelButton.geometry!.firstMaterial?.transparency = 0.3
                clueNeopixelInfo.removeAllActions()
                clueNeopixelInfo.isHidden = true
                clueNeopixelSwitch = false
            }
            
        }
            
        else if (node.name) == "ClueNordic_button" {
            
            if clueNordicSwitch == false {
                
                setClueUI(Button: clueNordicButton, Display: clueNordicInfo)
                
                let scale: Float = 0.0007
                
                clueNordicInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.8), duration: 1.6)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                clueNordicButton.geometry!.firstMaterial?.transparency = 0.9
                
                clueNordicInfo.runAction(scaleAction)
                
                clueNordicSwitch = true
                
            } else {
                
                clueNordicButton.geometry!.firstMaterial?.transparency = 0.3
                clueNordicInfo.removeAllActions()
                clueNordicInfo.isHidden = true
                clueNordicSwitch = false
            }
            
        }
            
            
            
            
        else if (node.name) == "ClueSpeaker_button" {
            
            if clueSpeakerSwitch == false {
                
                setClueUI(Button: clueSpeakerButton, Display: clueSpeakerInfo)
                
                let scale: Float = 0.0007
                
                clueSpeakerInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.8), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                
                clueSpeakerButton.geometry!.firstMaterial?.transparency = 0.9
                
                
                clueSpeakerInfo.runAction(scaleAction)
                
                clueSpeakerSwitch = true
                
            } else {
                
                clueSpeakerButton.geometry!.firstMaterial?.transparency = 0.3
                clueSpeakerInfo.removeAllActions()
                clueSpeakerInfo.isHidden = true
                clueSpeakerSwitch = false
            }
            
        }
            
            
        else if (node.name) == "ClueUSB_button" {
            
            if clueUSBSwitch == false {
                
                setClueUI(Button: clueUSBButton, Display: clueUSBInfo)
                
                let scale: Float = 0.0007
                
                clueUSBInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.7), duration: 1.5
                )
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                clueUSBButton.geometry!.firstMaterial?.transparency = 0.9
                
                clueUSBInfo.runAction(scaleAction)
                
                clueUSBSwitch = true
                
            } else {
                
                clueUSBButton.geometry!.firstMaterial?.transparency = 0.3
                clueUSBInfo.removeAllActions()
                clueUSBInfo.isHidden = true
                clueUSBSwitch = false
            }
            
        }
            
        else if (node.name) == "ClueGA_button" {
            
            if clueGASwitch == false {
                
                setClueUI(Button: clueGAButton, Display: clueGAInfo)
                
                let scale: Float = 0.0007
                
                clueGAInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                
                let scaleAction = SCNAction.scale(to: CGFloat(0.9), duration: 1.8)
                
                scaleAction.timingMode = .linear
                
                // Use a custom timing function
                scaleAction.timingFunction = { (p: Float) in
                    return self.easeOutElastic(p)
                }
                
                clueGAButton.geometry!.firstMaterial?.transparency = 0.9
                
                clueGAInfo.runAction(scaleAction)
                
                clueGASwitch = true
                
            } else {
                
                clueGAButton.geometry!.firstMaterial?.transparency = 0.3
                clueGAInfo.removeAllActions()
                clueGAInfo.isHidden = true
                clueGASwitch = false
            }
            
        }
       // CPBDisplays = [CPBcrocInfo, CPBspeakInfo, CPBATSInfo, CPBtemperatureDisplay,CPBmicInfo, CPBneoPixelInfo]









    if (node.name) == "CPBmic_Button" {

    if CPBmicSwitch == false {


    let scale: Float = 0.0007

    CPBmicInfo.scale = SCNVector3(x: scale, y: scale, z: scale)

    let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)

    scaleAction.timingMode = .linear

    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
    return self.easeOutElastic(p)
    }
    setCPBUI(Button: CPBmicButton, Display: CPBmicInfo)

    CPBmicInfo.runAction(scaleAction)

    CPBmicSwitch = true

    } else {

    CPBmicButton.geometry!.firstMaterial?.transparency = 0.4
    CPBmicInfo.removeAllActions()
    CPBmicInfo.isHidden = true
    CPBmicSwitch = false
    }

    }

    else if (node.name) == "CPBspeaker_Button" {

        if CPBspeakSwitch == false {

            let scale: Float = 0.0007

            CPBspeakInfo.scale = SCNVector3(x: scale, y: scale, z: scale)

            let scaleAction = SCNAction.scale(to: CGFloat(1.3), duration: 1.8)
            scaleAction.timingMode = .linear
            // Use a custom timing function
            scaleAction.timingFunction = { (p: Float) in
                return self.easeOutElastic(p)
            }

            setCPBUI(Button: CPBspeakButton, Display: CPBspeakInfo)
            CPBspeakInfo.runAction(scaleAction)
            CPBspeakSwitch = true

            } else {

                CPBspeakButton.geometry!.firstMaterial?.transparency = 0.4
                CPBspeakInfo.removeAllActions()
                CPBspeakInfo.isHidden = true
                CPBspeakSwitch = false
                
        }

    }

    else if (node.name) == "CPBneopixel_Button" {

    if CPBneopixelSwitch == false {

    let scale: Float = 0.0007

    CPBneopixelInfo.scale = SCNVector3(x: scale, y: scale, z: scale)

    let scaleAction = SCNAction.scale(to: CGFloat(1.2), duration: 1.8)

    scaleAction.timingMode = .linear

    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
    return self.easeOutElastic(p)
    }

    setCPBUI(Button: CPBneopixelButton, Display: CPBneopixelInfo)

    CPBneopixelInfo.runAction(scaleAction)

    CPBneopixelSwitch = true

    } else {

    CPBneopixelButton.geometry!.firstMaterial?.transparency = 0.4
    CPBneopixelInfo.removeAllActions()
    CPBneopixelInfo.isHidden = true
    CPBneopixelSwitch = false


    }

    }


    else if (node.name) == "CPBATSAMD21_Micro_Button" {

    if CPBATSSwitch == false {

    let scale: Float = 0.0007

    CPBATSInfo.scale = SCNVector3(x: scale, y: scale, z: scale)

    let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)

    scaleAction.timingMode = .linear

    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
    return self.easeOutElastic(p)
    }

    setCPBUI(Button: CPBATSButton, Display: CPBATSInfo)

    CPBATSInfo.runAction(scaleAction)

    CPBATSSwitch = true


    } else {

    CPBATSButton.geometry!.firstMaterial?.transparency = 0.4
    CPBATSInfo.removeAllActions()
    CPBATSInfo.isHidden = true
    CPBATSSwitch = false

    }

    }


    else if (node.name) == "CPBtemp_Button" {

    if CPBtempSwitch == false {

    let scale: Float = 0.0007

    CPBtemperatureInfo.scale = SCNVector3(x: scale, y: scale, z: scale)

    let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 2.2)

    scaleAction.timingMode = .linear

    // Use a custom timing function
    scaleAction.timingFunction = { (p: Float) in
    return self.easeOutElastic(p)
    }

    CPBtemperatureInfo.runAction(scaleAction)

    setCPBUI(Button: CPBtemperatureButton, Display: CPBtemperatureInfo)

    CPBtempSwitch = true

    } else {

    CPBtemperatureButton.geometry!.firstMaterial?.transparency = 0.4
    CPBtemperatureInfo.removeAllActions()
    CPBtemperatureInfo.isHidden = true
    CPBtempSwitch = false


    }

    }


    else if (node.name) == "CPBCroc_Button" {

    if CPBcrocSwitch == false {
     
     let scale: Float = 0.0007
     
     CPBcrocInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
     
     let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 2.2)
     
     scaleAction.timingMode = .linear
     
     // Use a custom timing function
     scaleAction.timingFunction = { (p: Float) in
         return self.easeOutElastic(p)
     }
     
     CPBcrocInfo.runAction(scaleAction)
     
     setCPBUI(Button: CPBcrocButton, Display: CPBcrocInfo)
     
     CPBcrocSwitch = true
     
    } else {
     
     CPBcrocButton.geometry!.firstMaterial?.transparency = 0.4
     CPBcrocInfo.removeAllActions()
     CPBcrocInfo.isHidden = true
     CPBcrocSwitch = false
     
     
    }

    }
        

                   if (node.name) == "edgeLight_Button" {
                              
                              if edgeLightSwitch == false {
                                  
                                  
                                  let scale: Float = 0.0007
                                  
                                  edgeLightInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                                  
                                  let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                                  
                                  scaleAction.timingMode = .linear
                                  
                                  // Use a custom timing function
                                  scaleAction.timingFunction = { (p: Float) in
                                      return self.easeOutElastic(p)
                                  }
                                  setEdgeUI(Button: edgeLightButton, Display: edgeLightInfo)
                               
                                 edgeLightInfo.runAction(scaleAction)
                                  
                                  edgeLightSwitch = true
                                  
                              } else {
                                  
                                  edgeLightButton.geometry!.firstMaterial?.transparency = 0.3
                                  edgeLightInfo.removeAllActions()
                                  edgeLightInfo.isHidden = true
                                  edgeLightSwitch = false
                              }
                              
                          }
                              

















        if (node.name) == "mmaskLight_Button" {
                   
                   if mmLightSwitch == false {
                       
                       
                       let scale: Float = 0.0007
                       
                       mmLightInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                       
                       let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                       
                       scaleAction.timingMode = .linear
                       
                       // Use a custom timing function
                       scaleAction.timingFunction = { (p: Float) in
                           return self.easeOutElastic(p)
                       }
                       setMmUI(Button: mmLightButton, Display: mmLightInfo)
                    
                       mmLightInfo.runAction(scaleAction)
                       
                       mmLightSwitch = true
                       
                   } else {
                       
                       mmLightButton.geometry!.firstMaterial?.transparency = 0.3
                       mmLightInfo.removeAllActions()
                       mmLightInfo.isHidden = true
                       mmLightSwitch = false
                   }
                   
               }
                   
               else if (node.name) == "mmaskSeesaw_Button" {
                   
                   if mmSeesawSwitch == false {
                       
                       let scale: Float = 0.0007
                       
                       mmSeesawInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                       
                       let scaleAction = SCNAction.scale(to: CGFloat(1.3), duration: 1.8)
                       scaleAction.timingMode = .linear
                       // Use a custom timing function
                       scaleAction.timingFunction = { (p: Float) in
                           return self.easeOutElastic(p)
                       }
                       
                       setMmUI(Button: mmSeesawButton, Display: mmSeesawInfo)
                       mmSeesawInfo.runAction(scaleAction)
                       mmSeesawSwitch = true
                       
                   } else {
                       
                       mmSeesawButton.geometry!.firstMaterial?.transparency = 0.3
                       mmSeesawInfo.removeAllActions()
                       mmSeesawInfo.isHidden = true
                       mmSeesawSwitch = false
                       
                       
                   }
                   
               }
                   
               else if (node.name) == "mmaskTactile_Button" {
                   
                   if mmTactileSwitch == false {
                       
                       let scale: Float = 0.0007
                       
                       mmTactileInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                       
                       let scaleAction = SCNAction.scale(to: CGFloat(1.2), duration: 1.8)
                       
                       scaleAction.timingMode = .linear
                       
                       // Use a custom timing function
                       scaleAction.timingFunction = { (p: Float) in
                           return self.easeOutElastic(p)
                       }
                       
                       setMmUI(Button: mmTactileButton, Display: mmTactileInfo)
                       
                       mmTactileInfo.runAction(scaleAction)
                       
                       mmTactileSwitch = true
                       
                   } else {
                       
                       mmTactileButton.geometry!.firstMaterial?.transparency = 0.5
                       mmTactileInfo.removeAllActions()
                       mmTactileInfo.isHidden = true
                       mmTactileSwitch = false
                       
                       
                   }
                   
               }
                   
                   
               else if (node.name) == "mmaskAccel_Button" {
                   
                   if mmAccelSwitch == false {
                       
                       let scale: Float = 0.0007
                       
                       mmAccelInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                       
                       let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                       
                       scaleAction.timingMode = .linear
                       
                       // Use a custom timing function
                       scaleAction.timingFunction = { (p: Float) in
                           return self.easeOutElastic(p)
                       }
                       
                       setMmUI(Button: mmAccelButton, Display: mmAccelInfo)
                       
                       mmAccelInfo.runAction(scaleAction)
                       
                       mmAccelSwitch = true
                       
                       
                   } else {
                       
                       mmAccelButton.geometry!.firstMaterial?.transparency = 0.5
                       mmAccelInfo.removeAllActions()
                       mmAccelInfo.isHidden = true
                       mmAccelSwitch = false
                       
                   }
                   
               }
                   
                   
               else if (node.name) == "mmaskATS_Button" {
                   
                   if mmATSSwitch == false {
                       
                       let scale: Float = 0.0007
                       
                       mmATSInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                       
                       let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 2.2)
                       
                       scaleAction.timingMode = .linear
                       
                       // Use a custom timing function
                       scaleAction.timingFunction = { (p: Float) in
                           return self.easeOutElastic(p)
                       }
                       
                       mmATSInfo.runAction(scaleAction)
                       
                       setMmUI(Button: mmATSButton, Display: mmATSInfo)
                       
                       mmATSSwitch = true
                       
                   } else {
                       
                       mmATSButton.geometry!.firstMaterial?.transparency = 0.5
                       mmATSInfo.removeAllActions()
                       mmATSInfo.isHidden = true
                       mmATSSwitch = false
                       
                       
                   }
                   
               }
                   


            if (node.name) == "edgeLight_Button" {
                       
                       if edgeLightSwitch == false {
                           
                           
                           let scale: Float = 0.0007
                           
                           edgeLightInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                           
                           let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                           
                           scaleAction.timingMode = .linear
                           
                           // Use a custom timing function
                           scaleAction.timingFunction = { (p: Float) in
                               return self.easeOutElastic(p)
                           }
                           setEdgeUI(Button: edgeLightButton, Display: edgeLightInfo)
                        
                          edgeLightInfo.runAction(scaleAction)
                           
                           edgeLightSwitch = true
                           
                       } else {
                           
                           edgeLightButton.geometry!.firstMaterial?.transparency = 0.3
                           edgeLightInfo.removeAllActions()
                           edgeLightInfo.isHidden = true
                           edgeLightSwitch = false
                       }
                       
                   }
                       
                   else if (node.name) == "edgeAccel_Button" {
                       
                       if edgeAccelSwitch == false {
                           
                           let scale: Float = 0.0007
                           
                           edgeAccelInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                           
                           let scaleAction = SCNAction.scale(to: CGFloat(1.3), duration: 1.8)
                           scaleAction.timingMode = .linear
                           // Use a custom timing function
                           scaleAction.timingFunction = { (p: Float) in
                               return self.easeOutElastic(p)
                           }
                           
                           setEdgeUI(Button: edgeAccelButton, Display: edgeAccelInfo)
                           edgeAccelInfo.runAction(scaleAction)
                           edgeAccelSwitch = true
                           
                       } else {
                           
                           edgeAccelButton.geometry!.firstMaterial?.transparency = 0.3
                           edgeAccelInfo.removeAllActions()
                           edgeAccelInfo.isHidden = true
                           edgeAccelSwitch = false
                           
                           
                       }
                       
                   }
                       
                   else if (node.name) == "edgeFeather_Button" {
                       
                       if edgeFeatherSwitch == false {
                           
                           let scale: Float = 0.0007
                           
                           edgeFeatherInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                           
                           let scaleAction = SCNAction.scale(to: CGFloat(1.2), duration: 1.8)
                           
                           scaleAction.timingMode = .linear
                           
                           // Use a custom timing function
                           scaleAction.timingFunction = { (p: Float) in
                               return self.easeOutElastic(p)
                           }
                           
                           setEdgeUI(Button: edgeFeatherButton, Display: edgeFeatherInfo)
                           
                           edgeFeatherInfo.runAction(scaleAction)
                           
                           edgeFeatherSwitch = true
                           
                       } else {
                           
                           edgeFeatherButton.geometry!.firstMaterial?.transparency = 0.5
                           edgeFeatherInfo.removeAllActions()
                           edgeFeatherInfo.isHidden = true
                           edgeFeatherSwitch = false
                           
                           
                       }
                       
                   }
                       
                       
                   else if (node.name) == "edgeSpeaker_Button" {
                       
                       if edgeSpeakerSwitch == false {
                           
                           let scale: Float = 0.0007
                           
                           edgeSpeakerInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                           
                           let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 1.8)
                           
                           scaleAction.timingMode = .linear
                           
                           // Use a custom timing function
                           scaleAction.timingFunction = { (p: Float) in
                               return self.easeOutElastic(p)
                           }
                           
                           setEdgeUI(Button: edgeSpeakerButton, Display: edgeSpeakerInfo)
                           
                           edgeSpeakerInfo.runAction(scaleAction)
                           
                           edgeSpeakerSwitch = true
                           
                           
                       } else {
                           
                           edgeSpeakerButton.geometry!.firstMaterial?.transparency = 0.5
                           edgeSpeakerInfo.removeAllActions()
                           edgeSpeakerInfo.isHidden = true
                           edgeSpeakerSwitch = false
                           
                       }
                       
                   }
                       
                       
                   else if (node.name) == "edgeATS_Button" {
                       
                       if edgeATSSwitch == false {
                           
                           let scale: Float = 0.0007
                           
                           edgeATSInfo.scale = SCNVector3(x: scale, y: scale, z: scale)
                           
                           let scaleAction = SCNAction.scale(to: CGFloat(1.1), duration: 2.2)
                           
                           scaleAction.timingMode = .linear
                           
                           // Use a custom timing function
                           scaleAction.timingFunction = { (p: Float) in
                               return self.easeOutElastic(p)
                           }
                           
                           edgeATSInfo.runAction(scaleAction)
                           
                           setEdgeUI(Button: edgeATSButton, Display: edgeATSInfo)
                           
                           edgeATSSwitch = true
                           
                       } else {
                           
                           edgeATSButton.geometry!.firstMaterial?.transparency = 0.5
                           edgeATSInfo.removeAllActions()
                           edgeATSInfo.isHidden = true
                           edgeATSSwitch = false
                           
                           
                       }
                       
                   }
                       
        
        
    else {
        print("Nothing Detected.")
            }

        }

    }

    
}

func setCpxUI(Button: SCNNode, Display: SCNNode) {
    
    print("\(Button.name ?? "") was pressed and " + "\(Display.name ?? "") was displayed for CPX")
    
    Button.isHidden = false
    
    Button.geometry!.firstMaterial?.transparency = 0.9
    
    Display.isHidden = false
    
    CPXButtons = CPXButtons.filter { $0 != Button }
    
    CPXDisplays = CPXDisplays.filter { $0 != Display }
    
    CPXButtons.forEach { button in
        
        button.geometry!.firstMaterial?.transparency = 0.4
    }
    
    CPXDisplays.forEach { display in
        
        display.isHidden = true
        
    }
    
    CPXButtons = [ATSButton, micButton, crocButton, temperatureButton, speakButton,neoPixelButton]
    CPXDisplays = [crocInfo, speakInfo, ATSInfo, temperatureDisplay,micInfo, neoPixelInfo]
    
}

func setCPBUI(Button: SCNNode, Display: SCNNode) {
    
    print("\(Button.name ?? "") was pressed and " + "\(Display.name ?? "") was displayed for CPB")
    
    Button.isHidden = false
    
    Button.geometry!.firstMaterial?.transparency = 0.9
    
    Display.isHidden = false
    
    CPBButtons = CPBButtons.filter { $0 != Button }
    
    CPBDisplays = CPBDisplays.filter { $0 != Display }
    
    CPBButtons.forEach { button in
        
        button.geometry!.firstMaterial?.transparency = 0.4
    }
    
    CPBDisplays.forEach { display in
        
        display.isHidden = true
        
    }
    
    CPBButtons = [CPBATSButton, CPBmicButton, CPBcrocButton, CPBtemperatureButton, CPBspeakButton,CPBneopixelButton]
    CPBDisplays = [CPBcrocInfo, CPBspeakInfo, CPBATSInfo, CPBtemperatureInfo,CPBmicInfo, CPBneopixelInfo]
    
}

func setMmUI(Button: SCNNode, Display: SCNNode) {
    
    print("\(Button.name ?? "") was pressed and " + "\(Display.name ?? "") was displayed for Monster M4sk")
    
    Button.isHidden = false
    
    Button.geometry!.firstMaterial?.transparency = 0.9
    
    Display.isHidden = false
    
    mmButtons = mmButtons.filter { $0 != Button }
    
    mmDisplays = mmDisplays.filter { $0 != Display }
    
    mmButtons.forEach { button in
        
        button.geometry!.firstMaterial?.transparency = 0.4
    }
    
    mmDisplays.forEach { display in
        
        display.isHidden = true
        
    }
    
    mmButtons = [mmATSButton, mmLightButton, mmSeesawButton, mmAccelButton, mmTactileButton]
    mmDisplays = [mmATSInfo, mmLightInfo, mmSeesawInfo, mmAccelInfo, mmTactileInfo]
    
}

func setClueUI(Button: SCNNode, Display: SCNNode) {
    
    print("\(Button.name ?? "") was pressed and " + "\(Display.name ?? "") was displayed")
    
    Button.isHidden = false
    
    Button.geometry!.firstMaterial?.transparency = 0.9
    
    Display.isHidden = false
    
    clueButtons = clueButtons.filter { $0 != Button }
    
    clueDisplays = clueDisplays.filter { $0 != Display }
    
    clueButtons.forEach { button in
        
        button.geometry!.firstMaterial?.transparency = 0.3
    }
    
    clueDisplays.forEach { display in
        
        display.isHidden = true
        
    }
    
    clueButtons = [clueTFTButton, clueNeopixelButton, clueNordicButton, clueGAButton, clueSpeakerButton, clueUSBButton]
    clueDisplays = [clueTFTInfo, clueNeopixelInfo, clueNordicInfo, clueGAInfo,clueSpeakerInfo, clueUSBInfo]
    
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

func setPygamer(Button: SCNNode, Display: SCNNode) {
    
    print("\(Button.name ?? "") was pressed and " + "\(Display.name ?? "") was displayed")
    
    Button.isHidden = false
    
    Button.geometry!.firstMaterial?.transparency = 0.9
    
    Display.isHidden = false
    
    PygamerButtons = PygamerButtons.filter { $0 != Button }
    
    PygamerDisplays = PygamerDisplays.filter { $0 != Display }
    
    PygamerButtons.forEach { button in
        
        button.geometry!.firstMaterial?.transparency = 0.2
    }
    
    PygamerDisplays.forEach { display in
        
        display.isHidden = true
        
    }
    
    PygamerButtons = [pygamerATSButton, pygamerSensorButton, pygamerDAButton, pygamerSpeakerButton, pygamerAccelerometerButton, pygamerIC2Button, pygamerFeatherButton, pygamerJSTButton]
    
    PygamerDisplays = [pygamerATSInfo, pygamerSpeakerInfo, pygamerDAInfo, pygamerAccelerometerInfo, pygamerSensorInfo, pygamerFeatherInfo, pygamerIC2Info, pygamerJSTInfo]
    
}

func setFrontPygamer(Button: SCNNode, Display: SCNNode) {
    
    print("\(Button.name ?? "") was pressed and " + "\(Display.name ?? "") was displayed")
    
    Button.isHidden = false
    
    Button.geometry!.firstMaterial?.transparency = 0.9
    
    Display.isHidden = false
    
    pygamerFrontButtons = pygamerFrontButtons.filter { $0 != Button }
    
    pygamerFrontDisplays = pygamerFrontDisplays.filter { $0 != Display }
    
    pygamerFrontButtons.forEach { button in
        
        button.geometry!.firstMaterial?.transparency = 0.2
    }
    
    pygamerFrontDisplays.forEach { display in
        
        display.isHidden = true
        
    }
    
    pygamerFrontButtons = [pyButtons, TFTDisplay, analogStick, pyNeopixels]
    
    pygamerFrontDisplays = [pyButtonsDisplay, TFTDisplayInfo, analogStickDisplay, pyNeopixelsDisplay]
    
}
    
    func setEdgeUI(Button: SCNNode, Display: SCNNode) {
        
        print("\(Button.name ?? "") was pressed and " + "\(Display.name ?? "") was displayed for Edge / Py")
        
        Button.isHidden = false
        
        Button.geometry!.firstMaterial?.transparency = 0.9
        
        Display.isHidden = false
        
        edgeButtons = edgeButtons.filter { $0 != Button }
        
        edgeDisplays = edgeDisplays.filter { $0 != Display }
        
        edgeButtons.forEach { button in
            
            button.geometry!.firstMaterial?.transparency = 0.4
        }
        
        edgeDisplays.forEach { display in
            
            display.isHidden = true
            
        }
        
        edgeButtons = [edgeATSButton, edgeLightButton, edgeAccelButton, edgeSpeakerButton, edgeFeatherButton]
        edgeDisplays = [edgeATSInfo, edgeLightInfo, edgeAccelInfo, edgeSpeakerInfo, edgeFeatherInfo]
        
    }
    
}

