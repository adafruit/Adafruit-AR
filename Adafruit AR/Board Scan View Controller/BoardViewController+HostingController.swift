//
//  BoardViewController+HostingControllers.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 12/12/20.
//  Copyright © 2020 Vanguard Logic LLC. All rights reserved.
//

import ARKit
import SwiftUI

@available(iOS 13.0, *)
extension BoardViewController {
    
    
    // Fool*
    @available(iOS 13.0, *)
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




    @available(iOS 13.0, *)
    func arPICOHostingController(for node: SCNNode) {
        // create a hosting controller with SwiftUI view
        let arVC = UIHostingController(rootView: PICOBoardOverlay())

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
            self.showOverlay(hostingVC: arVC, on: node)
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

    
    
}
