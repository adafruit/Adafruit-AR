//
//  CurvedText.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 2/24/21.
//  Copyright © 2021 Vanguard Logic LLC. All rights reserved.
//

import SwiftUI

struct CurvedText: View {
    var body: some View {

      RoundedRectangle(cornerRadius: 1, style: .continuous)
        .fill(Color.clear)
        .frame(width: 200, height: 200)
        .border(Color.gray, width: 2)
          .position(x: 250, y: 250)
    }
}

struct CurvedText_Previews: PreviewProvider {
    static var previews: some View {
        CurvedText()
    }
}
