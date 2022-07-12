//
//  BoardViewController+HostingControllers.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 12/12/20.
//  Copyright © 2020 Vanguard Logic LLC. All rights reserved.
//

import ARKit
import SwiftUI


extension BoardViewController {
    
    

    func arHostingController(for node: SCNNode, textForDialogue: [String]) {
        // create a hosting controller with SwiftUI view
        let arVC = UIHostingController(rootView: SwiftUITarotCardView(minervaDialogue: textForDialogue))
        
        // Do this on the main thread
        DispatchQueue.main.async {
            arVC.willMove(toParent: self)
            // make the hosting VC a child to the main view controller
            self.addChildViewController(arVC)
            
            // set the pixel size of the Card View
            arVC.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
            
            // add the ar card view as a subview to the main view
            self.view.addSubview(arVC.view)
            
            // render the view on the plane geometry as a material
            self.show(hostingVC: arVC, on: node)


        }

    }
    
    func show(hostingVC: UIHostingController<SwiftUITarotCardView>, on node: SCNNode) {
        // create a new material
        let material = SCNMaterial()
        
        // this allows the card to render transparent parts the right way
        hostingVC.view.isOpaque = false
        
        // set the diffuse of the material to the view of the Hosting View Controller
        material.diffuse.contents = hostingVC.view
        material.lightingModel = .constant
        // Set the material to the geometry of the node (plane geometry)
        node.geometry?.materials = [material]
        
        hostingVC.view.backgroundColor = UIColor.clear
    }




    
    func arPICOHostingController(for node: SCNNode) {
        // Do this on the main thread
      DispatchQueue.main.async {

            // make the hosting VC a child to the main view controller
         // self.addChildViewController(self.arVC)

            // set the pixel size of the Card View
          self.arVC.view.frame = CGRect(x: 0, y: -13, width: 510, height: 500)

            // add the ar card view as a subview to the main view
          self.view.addSubview(self.arVC.view)

            // render the view on the plane geometry as a material
          self.showOverlay(hostingVC: self.arVC, on: node)

         // self.arVC.willMove(toParent: self)
          self.arVC.didMove(toParent: self)
        }

    }


    func showOverlay(hostingVC: UIHostingController<PICOBoardOverlay>, on node: SCNNode) {
        // create a new material
        let material = SCNMaterial()

        // this allows the card to render transparent parts the right way
        hostingVC.view.isOpaque = false

        // set the diffuse of the material to the view of the Hosting View Controller
        material.diffuse.contents = hostingVC.view
        material.lightingModel = .constant
        // Set the material to the geometry of the node (plane geometry)
        node.geometry?.materials = [material]

        hostingVC.view.backgroundColor = UIColor.clear
    }



  func arBLMHostingController(for node: SCNNode) {
      // Do this on the main thread
    DispatchQueue.main.async {

          // make the hosting VC a child to the main view controller
       // self.addChildViewController(self.arVC)

          // set the pixel size of the Card View
        self.blmVC.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)

          // add the ar card view as a subview to the main view
        self.view.addSubview(self.blmVC.view)

          // render the view on the plane geometry as a material
        self.showBLMOverlay(hostingVC: self.blmVC, on: node)

       // self.arVC.willMove(toParent: self)
        self.blmVC.didMove(toParent: self)
      }

  }


  func showBLMOverlay(hostingVC: UIHostingController<BLMBoardOverlay>, on node: SCNNode) {
      // create a new material
      let material = SCNMaterial()

      // this allows the card to render transparent parts the right way
      hostingVC.view.isOpaque = false

      // set the diffuse of the material to the view of the Hosting View Controller
      material.diffuse.contents = hostingVC.view
      material.lightingModel = .constant
      // Set the material to the geometry of the node (plane geometry)
      node.geometry?.materials = [material]

      hostingVC.view.backgroundColor = UIColor.clear
  }

    
  func arTeensy41HostingController(for node: SCNNode) {
    print(#function)
    // Do this on the main thread
    DispatchQueue.main.async {

          // make the hosting VC a child to the main view controller
       // self.addChildViewController(self.arVC)

          // set the pixel size of the Card View
        self.teensyVC.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)

          // add the ar card view as a subview to the main view
        self.view.addSubview(self.teensyVC.view)

          // render the view on the plane geometry as a material
        self.showTeensyOverlay(hostingVC: self.teensyVC, on: node)

       // self.arVC.willMove(toParent: self)
        self.teensyVC.didMove(toParent: self)
      }

  }


  func showTeensyOverlay(hostingVC: UIHostingController<Teensy41BoardOverlay>, on node: SCNNode) {
    print(#function)
    DispatchQueue.main.async {
    // create a new material
      let material = SCNMaterial()

      // this allows the card to render transparent parts the right way
      hostingVC.view.isOpaque = false

      // set the diffuse of the material to the view of the Hosting View Controller
      material.diffuse.contents = hostingVC.view
      material.lightingModel = .constant
      // Set the material to the geometry of the node (plane geometry)
      node.geometry?.materials = [material]

      hostingVC.view.backgroundColor = UIColor.clear
    }
  }



  func arpi400HostingController(for node: SCNNode) {
      // Do this on the main thread
    DispatchQueue.main.async {

          // make the hosting VC a child to the main view controller
       // self.addChildViewController(self.arVC)

          // set the pixel size of the Card View
        self.pi400VC.view.frame = CGRect(x: 0, y: 0, width: 1000, height: 500)

          // add the ar card view as a subview to the main view
        self.view.addSubview(self.pi400VC.view)

          // render the view on the plane geometry as a material
        self.showpi400Overlay(hostingVC: self.pi400VC, on: node)

       // self.arVC.willMove(toParent: self)
        self.pi400VC.didMove(toParent: self)
      }

  }


  func showpi400Overlay(hostingVC: UIHostingController<Pi400Overlay>, on node: SCNNode) {
      // create a new material
      let material = SCNMaterial()

      // this allows the card to render transparent parts the right way
      hostingVC.view.isOpaque = false

      // set the diffuse of the material to the view of the Hosting View Controller
      material.diffuse.contents = hostingVC.view
      material.lightingModel = .constant
      // Set the material to the geometry of the node (plane geometry)
      node.geometry?.materials = [material]

      hostingVC.view.backgroundColor = UIColor.clear

  }



}
