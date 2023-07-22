//
//  ARImageModel.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 5/29/23.
//  Copyright © 2023 Vanguard Logic LLC. All rights reserved.
//

import ARKit

struct ARImage {
    let name: String
    var referenceImage: ARReferenceImage?
}

class ARImageLoadingService {
    func loadReferenceImage(named name: String) -> ARReferenceImage? {
        guard let image = UIImage(named: name),
              let cgImage = image.cgImage else {
            return nil
        }

        let referenceImage = ARReferenceImage(cgImage, orientation: .up, physicalWidth: 0.1)
        return referenceImage
    }
}
