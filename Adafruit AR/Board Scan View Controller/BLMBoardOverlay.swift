//
//  BLMBoardOverlay.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 2/24/21.
//  Copyright © 2021 Vanguard Logic LLC. All rights reserved.
//

import SwiftUI

struct BLMBoardOverlay: View {

@State private var ZAxisRotation = false

  var foreverAnimation: Animation {
          Animation.linear(duration: 5.0)
              .repeatForever(autoreverses: false)
      }

  var body: some View {
    ZStack{
      CircleText(radius: 100, text: " BLACK  L IVES M ATTER             BLACK  L IVES M ATTER ", kerning: 0)
    }
//    .rotation3DEffect(Angle.degrees(ZAxisRotation ? -180 : 0), axis: (x: 0, y: 0, z: 1))
//    .animation(ZAxisRotation ? foreverAnimation : .default)
//    .onAppear(){
//              self.ZAxisRotation.toggle()
//          }


//    .rotationEffect(.degrees(ZAxisRotation ? 360: 0))
//    .animation(ZAxisRotation ? foreverAnimation : .default)
//        .onAppear(){
//          self.ZAxisRotation.toggle()
//        }


//    .rotationEffect(Angle(degrees: ZAxisRotation ? 360 : 0))
//    .animation(ZAxisRotation ? foreverAnimation : .none)
//    .onAppear(){
//      self.ZAxisRotation.toggle()
//    }

  }

}


struct BLMBoardOverlay_Previews: PreviewProvider {
    static var previews: some View {
        BLMBoardOverlay()
    }
}
