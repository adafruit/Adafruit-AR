//
//  QRViewController+Video.swift
//  Adafruit AR
//
//  Created by Trevor B on 4/24/19.
//  Copyright © 2019 Vanguard Logic LLC. All rights reserved.
//

import AVFoundation
import SpriteKit

extension QRViewController {

    
    // Video for HalloWing eyeball animation
    func halloWingEyeVideo() {
        //This is the video for HalloWing's Eye Ball animation
        
        // flip video upside down
        playerNode.yScale = -1
        playerNode.name = "playerNode"
        
        // create SKScene and set player node on it
        spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
        
        spriteKitScene.scaleMode = .aspectFill
        
        playerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        
        playerNode.size = spriteKitScene.size
        
        spriteKitScene.addChild(playerNode)
        
        
        videoPlane.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        videoPlane.geometry?.firstMaterial?.isDoubleSided = true
        
        playerNode.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil)
        { notification in
            
            self.player.seek(to: kCMTimeZero)
            
            self.player.play()
            
            print("reset Video")
            
        }
    }
    
    //For Promo Video Playback
    func playCrickitVideo() {
        
        crickitPlayer = AVPlayer(url: crickitVideoURL!)
        crickitPlayerNode = SKVideoNode(avPlayer: crickitPlayer)
        
        // flip video upside down
        crickitPlayerNode.yScale = -1
        crickitPlayerNode.name = "CrickitplayerNode"
        
        // create SKScene and set player node on it
        spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
        
        spriteKitScene.scaleMode = .aspectFill
        
        crickitPlayerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        
        crickitPlayerNode.size = spriteKitScene.size
        
        spriteKitScene.addChild(crickitPlayerNode)
        
        
        crickitVideo.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        crickitVideo.geometry?.firstMaterial?.isDoubleSided = true
        
        crickitPlayerNode.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: crickitPlayer.currentItem, queue: nil)
        { notification in
            
            self.crickitPlayer.seek(to: kCMTimeZero)
            self.crickitPlayer.play()
        }
    }
    
    func playHallowingVideo() {
        
        halloWingPlayer = AVPlayer(url: hallowingVideoURL!)
        halloWingPlayerNode = SKVideoNode(avPlayer: halloWingPlayer)
        
        // flip video upside down
        halloWingPlayerNode.yScale = -1
        halloWingPlayerNode.name = "HallowingplayerNode"
        
        // create SKScene and set player node on it
        spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
        
        spriteKitScene.scaleMode = .aspectFill
        
        halloWingPlayerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        
        halloWingPlayerNode.size = spriteKitScene.size
        
        spriteKitScene.addChild(halloWingPlayerNode)
        
        
        halloWingVideo.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        halloWingVideo.geometry?.firstMaterial?.isDoubleSided = true
        
        halloWingPlayerNode.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: halloWingPlayer.currentItem, queue: nil)
        { notification in
            
            self.halloWingPlayer.seek(to: kCMTimeZero)
            self.halloWingPlayer.play()
        }
    }
    
    func playCPXVideo() {
        
        cpxPlayer = AVPlayer(url: cpxVidURL!)
        cpxPlayerNode = SKVideoNode(avPlayer: cpxPlayer)
        
        // flip video upside down
        cpxPlayerNode.yScale = -1
        cpxPlayerNode.name = "CPXplayerNode"
        
        // create SKScene and set player node on it
        spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
        
        spriteKitScene.scaleMode = .aspectFill
        
        cpxPlayerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        
        cpxPlayerNode.size = spriteKitScene.size
        
        spriteKitScene.addChild(cpxPlayerNode)
        
        
        cpxVideo.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        cpxVideo.geometry?.firstMaterial?.isDoubleSided = true
        
        cpxPlayerNode.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: cpxPlayer.currentItem, queue: nil)
        { notification in
            
            self.cpxPlayer.seek(to: kCMTimeZero)
            self.cpxPlayer.play()
        }
    }
    
    func playPyVideo() {
        
        pyPlayer = AVPlayer(url: pyVidURL!)
        pyPlayerNode = SKVideoNode(avPlayer: pyPlayer)
        
        // flip video upside down
        pyPlayerNode.yScale = -1
        pyPlayerNode.name = "PyplayerNode"
        
        // create SKScene and set player node on it
        spriteKitScene = SKScene(size: CGSize(width: AspectRatio.width + 300, height: AspectRatio.height + 300))
        
        spriteKitScene.scaleMode = .aspectFill
        
        pyPlayerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        
        pyPlayerNode.size = spriteKitScene.size
        
        spriteKitScene.addChild(pyPlayerNode)
        
        
        pyVideo.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        pyVideo.geometry?.firstMaterial?.isDoubleSided = true
        
        pyPlayerNode.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: pyPlayer.currentItem, queue: nil)
        { notification in
            
            self.pyPlayer.seek(to: kCMTimeZero)
            self.pyPlayer.play()
        }
    }
    
    
}
