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
     let path = Bundle.main.path(forResource: "art.scnassets/wav/when things are easy.wav", ofType:nil)!
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
     let path = Bundle.main.path(forResource: "art.scnassets/wav/filtering out noise.wav", ofType:nil)!
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
     let path = Bundle.main.path(forResource: "art.scnassets/wav/the best listeners.wav", ofType:nil)!
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
    
    func playthmAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/footprints.wav", ofType: nil)!
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
    
    
    func playtowerAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/misinformation.wav", ofType: nil)!
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
    
    
    func playloversAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/just because there is.wav", ofType: nil)!
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
    
    func playsunAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/make a megaphone.wav", ofType: nil)!
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
    
    
    
    func playmoonAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/motion is noise.wav", ofType: nil)!
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
    
    
    
    func playjusticeAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/not every container.wav", ofType: nil)!
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
    
    func playworldAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/power to change.wav", ofType: nil)!
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
    
    
    func playdevilAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/you've got the power.wav", ofType: nil)!
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
    
    func playfoolAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/the process is more.wav", ofType: nil)!
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
    
    
    func playpriestessAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/sometimes building a mistake.wav", ofType: nil)!
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
    
    
    
    func playstrengthAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/showing up on time.wav", ofType: nil)!
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
    
    
    
    func playmagicianAudio() {
     let path = Bundle.main.path(forResource: "art.scnassets/wav/sometimes its not going.wav", ofType: nil)!
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
