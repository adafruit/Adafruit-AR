//
//  ViewController + Audio.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 7/18/18.
//  Copyright © 2018 Adafruit. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

extension ViewController {


  //Mark:- Audio -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
  func playAndLoadIntro() {
    //Create sound file URL and add to audio player
    let path = Bundle.main.path(forResource: "art.scnassets/m4a/Adaot VOs 0.m4a", ofType:nil)!
    let url = URL(fileURLWithPath: path)
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.isMeteringEnabled = true
    }
    catch {
      print("ERROR: Could not load audio player")
    }
  }
  
  
  func playIntro() {
    let path = Bundle.main.path(forResource: "art.scnassets/m4a/Adaot VOs 0.m4a", ofType:nil)!
    let url = URL(fileURLWithPath: path)
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.isMeteringEnabled = true
      guard let audioPlayer = audioPlayer else { return }
      
      audioPlayer.prepareToPlay()
      audioPlayer.play()
      
    } catch let error as NSError {
      print(error.description)
    }
  }
  
 
  func playOutro() {
    let path = Bundle.main.path(forResource: "art.scnassets/m4a/Adabot VO - goodbye.m4a", ofType:nil)!
    let url = URL(fileURLWithPath: path)
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.isMeteringEnabled = true
      guard let audioPlayer = audioPlayer else { return }
      
      audioPlayer.prepareToPlay()
      audioPlayer.play()
      
    } catch let error as NSError {
      print(error.description)
    }
  }
  

  func playOtherSoundClips() {
    let path1 = Bundle.main.path(forResource: "art.scnassets/m4a/Adaot VOs \(storedVarible).m4a", ofType: nil)!
    let url = URL(fileURLWithPath: path1)
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: url)
      audioPlayer?.isMeteringEnabled = true
    }
    catch {
      print("ERROR: Could not load audio player")
    }
    audioPlayer?.play()
  }
  
  
  @objc func updateTeeth(){
    
    if (audioPlayer?.isPlaying)! {
      audioPlayer?.updateMeters()
      
      let power = (audioPlayer?.averagePower(forChannel: 0))! + (audioPlayer?.averagePower(forChannel: 1))! / 2.0
      if power >= -30.0 {
        teethMaterial.diffuse.contents = speakingTeethColor
      }
      else {
        teethMaterial.diffuse.contents = UIColor.white
      }
    }
  }
  
}

