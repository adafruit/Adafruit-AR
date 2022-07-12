//
//  PicoWOverlay.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 7/11/22.
//  Copyright © 2022 Vanguard Logic LLC. All rights reserved.
//

import SwiftUI

struct PicoWOverlay: View {
    var body: some View {
        VStack {
            Image("PicoWPinout")
                .resizable()
                .scaledToFit()
                .frame(width: 600, height: 357, alignment: .center)
            
        }
        .rotationEffect(.degrees(-180))
    }
}

struct PicoWOverlay_Previews: PreviewProvider {
    static var previews: some View {
        PicoWOverlay()
    }
}
