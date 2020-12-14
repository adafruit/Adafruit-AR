//
//  BoardViewController+Audio.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 12/12/20.
//  Copyright © 2020 Vanguard Logic LLC. All rights reserved.
//

import AVFoundation
@available(iOS 13.0, *)

extension BoardViewController {

    
    func playTemperanceAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/a good gauge.wav", ofType:nil)!
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

    
    
    func playStarAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/today why is more.wav", ofType:nil)!
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
    
    
    func playDeathAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/use great caution.wav", ofType:nil)!
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
    
    
    
    func playWOFAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/a good gauge.wav", ofType:nil)!
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
    
    
    func playJudgementAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/if the spectrum is.wav", ofType: nil)!
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
    
    
    func playHermitAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/a good gauge.wav", ofType:nil)!
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
    
    
    func playFourOfCoinAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/a good gauge.wav", ofType:nil)!
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
    
    
    
    
    
    
    
    
    
    
}
