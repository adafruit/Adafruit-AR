//
//  PICOBoardOverlay.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 1/26/21.
//  Copyright © 2021 Vanguard Logic LLC. All rights reserved.
//

import SwiftUI

struct pi400Data: Identifiable {
  let id = UUID()
  let pinOutLabel: String
  let pinOutBGcolor: Color
  let pinOutFGcolor: Color

  let pinOutLabel2: String
  let pinOutBGcolor2: Color
  let pinOutFGcolor2: Color

  let GPIONumber: String

  let circleColor: Color
}

struct Pi400Overlay: View {

  @State private var viewY = 0

  @State private var debugY = 0

    var body: some View {

        let pi400DataFirstRow = [

          pi400Data(pinOutLabel: "5V", pinOutBGcolor: Color(#colorLiteral(red: 1, green: 0.3383003439, blue: 0.348613691, alpha: 1)), pinOutFGcolor: .white, pinOutLabel2: "Power", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "", circleColor: .red),

          pi400Data(pinOutLabel: "5V", pinOutBGcolor: Color(#colorLiteral(red: 1, green: 0.3383003439, blue: 0.348613691, alpha: 1)), pinOutFGcolor: .white, pinOutLabel2: "Power", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "", circleColor: .red),

          pi400Data(pinOutLabel: "Ground", pinOutBGcolor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "11", circleColor: .black),

          pi400Data(pinOutLabel: "GPIO 14", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(TXD)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "8", circleColor: .yellow),


          pi400Data(pinOutLabel: "GPIO 15", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(RXD)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "10", circleColor: .yellow),


          pi400Data(pinOutLabel: "GPIO 18", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "PCM_CLK", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "12", circleColor: .yellow),


          pi400Data(pinOutLabel: "Ground", pinOutBGcolor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "11", circleColor: .black),


          pi400Data(pinOutLabel: "GPIO 23", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "16", circleColor: .yellow),


          pi400Data(pinOutLabel: "GPIO 24", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "18", circleColor: .yellow),


          pi400Data(pinOutLabel: "Ground", pinOutBGcolor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "11", circleColor: .black),


          pi400Data(pinOutLabel: "GPIO 25", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "22", circleColor: .yellow),


          pi400Data(pinOutLabel: "GPIO 8", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(CE0)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "24", circleColor: .yellow),


          pi400Data(pinOutLabel: "GPIO 7", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(CE1)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "26", circleColor: .yellow),


          pi400Data(pinOutLabel: "GPIO 1", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(ID_SC)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "28", circleColor: .yellow),


          pi400Data(pinOutLabel: "Ground", pinOutBGcolor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "11", circleColor: .black),

          pi400Data(pinOutLabel: "GPIO 12", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(PWM0)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "32", circleColor: .yellow),

          pi400Data(pinOutLabel: "Ground", pinOutBGcolor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "11", circleColor: .black),


          pi400Data(pinOutLabel: "GPIO 16", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "36", circleColor: .yellow),

          pi400Data(pinOutLabel: "GPIO 20", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "PCM_DIN", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "38", circleColor: .yellow),

          pi400Data(pinOutLabel: "GPIO 21", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "PCM_OUT", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "40", circleColor: .yellow),

        ]



      let pi400DataSecondRow = [

        pi400Data(pinOutLabel: "3V3", pinOutBGcolor: Color(#colorLiteral(red: 1, green: 0.3383003439, blue: 0.348613691, alpha: 1)), pinOutFGcolor: .white, pinOutLabel2: "Power", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "", circleColor: .red),

        pi400Data(pinOutLabel: "GPIO 2", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(SDA)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "3", circleColor: .yellow),

        pi400Data(pinOutLabel: "GPIO 3", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(SCL)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "5", circleColor: .yellow),

        pi400Data(pinOutLabel: "GPIO 4", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(GPCLK0)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "7", circleColor: .yellow),


        pi400Data(pinOutLabel: "Ground", pinOutBGcolor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "", circleColor: .black),


        pi400Data(pinOutLabel: "GPIO 17", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "11", circleColor: .yellow),


        pi400Data(pinOutLabel: "GPIO 27", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "13", circleColor: .yellow),


        pi400Data(pinOutLabel: "GPIO 22", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "15", circleColor: .yellow),


        pi400Data(pinOutLabel: "3V3", pinOutBGcolor: Color(#colorLiteral(red: 1, green: 0.3383003439, blue: 0.348613691, alpha: 1)), pinOutFGcolor: .white, pinOutLabel2: "Power", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "", circleColor: .red),


        pi400Data(pinOutLabel: "GPIO 10", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(MOSI)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "19", circleColor: .yellow),


        pi400Data(pinOutLabel: "GPIO 9", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(MISO)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "21", circleColor: .yellow),


        pi400Data(pinOutLabel: "GPIO 11", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(SCLK)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "23", circleColor: .yellow),


        pi400Data(pinOutLabel: "Ground", pinOutBGcolor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "", circleColor: .black),


        pi400Data(pinOutLabel: "GPIO 0", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(ID_SC)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "27", circleColor: .yellow),


        pi400Data(pinOutLabel: "GPIO 5", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "29", circleColor: .yellow),

        pi400Data(pinOutLabel: "GPIO 6", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "31", circleColor: .yellow),

        pi400Data(pinOutLabel: "GPIO 13", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "(PWM1)", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "33", circleColor: .yellow),


        pi400Data(pinOutLabel: "GPIO 19", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "PCM_FS", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "35", circleColor: .yellow),

        pi400Data(pinOutLabel: "GPIO 26", pinOutBGcolor: Color(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "37", circleColor: .yellow),

        pi400Data(pinOutLabel: "Ground", pinOutBGcolor: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), pinOutFGcolor: .black, pinOutLabel2: "", pinOutBGcolor2: .clear, pinOutFGcolor2: .blue, GPIONumber: "", circleColor: .black)

      ]

      VStack{

            HStack() {
                ForEach(pi400DataFirstRow) { (pinout) in
                  pi400GPIOUpperRow(pinOutLabel: pinout.pinOutLabel, pinOutBGcolor: pinout.pinOutBGcolor, pinOutFGcolor: pinout.pinOutFGcolor, pinOutLabel2: pinout.pinOutLabel2, pinOutBGcolor2: pinout.pinOutBGcolor2, pinOutFGcolor2: pinout.pinOutFGcolor2, GPIONumber: pinout.GPIONumber, circleColor: pinout.circleColor)
                    }
                .frame(width: 12, height: 40)
            }
           .position(x: 0, y: -50)

        HStack() {
            ForEach(pi400DataSecondRow) { (pinout) in
              pi400GPIOLowerRow(pinOutLabel: pinout.pinOutLabel, pinOutBGcolor: pinout.pinOutBGcolor, pinOutFGcolor: pinout.pinOutFGcolor, pinOutLabel2: pinout.pinOutLabel2, pinOutBGcolor2: pinout.pinOutBGcolor2, pinOutFGcolor2: pinout.pinOutFGcolor2, GPIONumber: pinout.GPIONumber, circleColor: pinout.circleColor)
                }
            .frame(width: 12, height: 40)
        }
        .position(x: 0, y: 25)

      }

            .onAppear(perform: {

              if UIDevice.current.userInterfaceIdiom == .phone {
                //iPhone
                viewY = 220
              }else {
                //iPad
                viewY = 255
              }

            })
            .fixedSize(horizontal: true, vertical: true)
           // .rotationEffect(.degrees(-90))


    }




struct pi400GPIOUpperRow: View {

let pinOutLabel: String
let pinOutBGcolor: Color
let pinOutFGcolor: Color

let pinOutLabel2: String
let pinOutBGcolor2: Color
let pinOutFGcolor2: Color

let GPIONumber: String
let circleColor: Color

var body: some View {

  VStack{

    VStack{

      Text(pinOutLabel)
        .foregroundColor(pinOutFGcolor)
        .font(.system(size: 8))
        .fontWeight(.bold)
        .frame(width: 35, height: 10)
        .background(pinOutBGcolor)

      Text(pinOutLabel2)
        .foregroundColor(pinOutFGcolor)
        .font(.system(size: 6))
        .fontWeight(.medium)
        .frame(width: 35, height: 10)
        .background(pinOutBGcolor)

    }
    .rotationEffect(.degrees(-90))

    //Circle Group
    ZStack {
      //Circle
      Circle()
        .foregroundColor(circleColor)
      //Text within the circle
      Text(GPIONumber)
        .font(.system(size: 10))
        .fontWeight(.regular)
    }
    .frame(width: 15, height: 15)
    .padding(.top, 5)
//    Rectangle()
//      .frame(width: 2, height: 70)
    }
  }
}

  struct pi400GPIOLowerRow: View {

  let pinOutLabel: String
  let pinOutBGcolor: Color
  let pinOutFGcolor: Color

  let pinOutLabel2: String
  let pinOutBGcolor2: Color
  let pinOutFGcolor2: Color

  let GPIONumber: String
  let circleColor: Color

  var body: some View {

    VStack{
      //Circle Group
      ZStack {
        //Circle
        Circle()
          .foregroundColor(circleColor)
        //Text within the circle
        Text(GPIONumber)
          .font(.system(size: 10))
          .fontWeight(.medium)
      }

      .frame(width: 15, height: 15)
      .padding(.bottom, 5)

      VStack{

        Text(pinOutLabel)
          .foregroundColor(pinOutFGcolor)
          .font(.system(size: 8))
          .fontWeight(.bold)
          .frame(width: 35, height: 10)
          .background(pinOutBGcolor)

        Text(pinOutLabel2)
          .foregroundColor(pinOutFGcolor)
          .font(.system(size: 6))
          .fontWeight(.medium)
          .frame(width: 35, height: 10)
          .background(pinOutBGcolor)

      }
      .rotationEffect(.degrees(-90))
    }
  }
}









struct Pi400Overlay_Previews: PreviewProvider {


static var previews: some View {
    Pi400Overlay()
    .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (2nd generation)"))
    .previewDisplayName("iPad Pro (11-inch) (2nd generation)")
}
}

}


