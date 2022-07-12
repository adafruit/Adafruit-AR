//
//  PICOBoardOverlay.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 1/26/21.
//  Copyright © 2021 Vanguard Logic LLC. All rights reserved.
//

import SwiftUI



struct Data: Identifiable {
let id = UUID()
let value: String
let prefix: String
let fgColor: Color
let bgcolor: Color
let prefix2: String
let bgColor2: Color
let prefix3: String
let bgColor3: Color
let prefix4: String
let bgColor4: Color
let prefix5: String
let bgColor5: Color

}




struct PICOBoardOverlay: View {


  @State private var viewY = 0

  @State private var debugY = 0

    var body: some View {




        
            ZStack{
            //Border
              RoundedRectangle(cornerRadius: 1, style: .continuous)
                .fill(Color.clear)
                .frame(width: 167, height: 272)
                .border(Color.clear, width: 2)
                .position(x: 250, y: CGFloat(viewY))
//.position(x: 250, y: 250)

//                pintOutDEBUGStruct()
//                  .position(x: 250, y: CGFloat(debugY))



                HStack{

                    VStack {
                        Image("PicoPinoutFinal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 600, height: 395, alignment: .center)
                        
                    }
                    
                    
//                    VStack(alignment: .leading) {
//                        ForEach(data) { (pinout) in
//                            pintOutStruct(value: pinout.value, prefix: pinout.prefix, fgcolor: pinout.fgColor, bgcolor: pinout.bgcolor, prefix2: pinout.prefix2, bgColor2: pinout.bgColor2, prefix3: pinout.prefix3, bgColor3: pinout.bgColor3, prefix4: pinout.prefix4, bgColor4: pinout.bgColor4, prefix5: pinout.prefix5, bgColor5: pinout.bgColor5)
//                            }
//                        .frame(width: 170, height: 13.5, alignment: .leading)
//                    }
//
//                    .position(x: 418, y: CGFloat(viewY))
//                    //.offset(x: 245, y: 23.8)
//
//                    VStack(alignment: .trailing) {
//                        ForEach(data2) { (pinout) in
//                            pintOutStruct2(value: pinout.value, prefix: pinout.prefix, fgcolor: pinout.fgColor, bgcolor: pinout.bgcolor, prefix2: pinout.prefix2, bgColor2: pinout.bgColor2, prefix3: pinout.prefix3, bgColor3: pinout.bgColor3, prefix4: pinout.prefix4, bgColor4: pinout.bgColor4, prefix5: pinout.prefix5, bgColor5: pinout.bgColor5)
//                            }
//                        .frame(width: 150, height: 1, alignment: .trailing)
//
//                    }
//                    .position(x: -161, y: CGFloat(viewY))
//                    //.offset(x: -245, y: 25)
                }
            }
            .onAppear(perform: {

              if UIDevice.current.userInterfaceIdiom == .phone {
                //iPhone
                viewY = 217
                debugY = 370
              }else {
                //iPad
                viewY = 250
                debugY = 400
              }


               })
            .rotationEffect(.degrees(-180))


    }

}



struct pintOutDEBUGStruct: View {


var body: some View {

    VStack(alignment: .trailing){
        Text("SWCLK")
            .font(.system(size: 7))
            .fontWeight(.black)
            .foregroundColor(.black)
            .background(Color.gray)
            .padding(0.2)

        Text("GND")
              .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(Color.white)
            .background(Color.black)
            .padding(0.2)


        Text("SWDI0")
            .font(.system(size: 7))
            .fontWeight(.black)
            .foregroundColor(Color.black)
            .background(Color.gray)
            .padding(0.2)
    }

    .rotationEffect(.degrees(-90))

}

}



struct pintOutStruct: View {

let value: String
let prefix: String
let fgcolor: Color
let bgcolor: Color
let prefix2: String
let bgColor2: Color
let prefix3: String
let bgColor3: Color
let prefix4: String
let bgColor4: Color
let prefix5: String
let bgColor5: Color



var body: some View {

    HStack(spacing: 4.0){
        Text(value)
            .font(.system(size: 8))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .multilineTextAlignment(.trailing)
            .background(Color.gray)

        Text(prefix)
              .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(fgcolor)
            .background(bgcolor)
          //  .font(.custom("Helvetica Neue", size: 10))

        Text(prefix2)
              .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(fgcolor)
            .background(bgColor2)
          //  .font(.custom("Helvetica Neue", size: 10))

        Text(prefix3)
              .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(fgcolor)
            .background(bgColor3)


        Text(prefix4)
              .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(fgcolor)
            .background(bgColor4)

        Text(prefix5)
              .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(fgcolor)
            .background(bgColor5)

    }

}
}



struct pintOutStruct2: View {

let value: String
let prefix: String
let fgcolor: Color
let bgcolor: Color
let prefix2: String
let bgColor2: Color
let prefix3: String
let bgColor3: Color
let prefix4: String
let bgColor4: Color
let prefix5: String
let bgColor5: Color



var body: some View {

    HStack(spacing: 4.0){
        Text(prefix5)
            .font(.system(size: 8))
            .fontWeight(.black)
          .foregroundColor(fgcolor)
          .background(bgColor5)
      

        Text(prefix4)
            .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(fgcolor)
            .background(bgColor4)
            .cornerRadius(25)

        Text(prefix3)
              .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(fgcolor)
            .background(bgColor3)

        Text(prefix2)
              .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(fgcolor)
            .background(bgColor2)

        Text(prefix)
              .font(.system(size: 8))
            .fontWeight(.black)
            .foregroundColor(fgcolor)
            .background(bgcolor)

        Text(value)
            .font(.system(size: 8))
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .multilineTextAlignment(.trailing)
            .foregroundColor(.black)
            .background(Color.gray)
    }

}

}



struct PICOBoardOverlay_Previews: PreviewProvider {


static var previews: some View {
    PICOBoardOverlay()
    .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (2nd generation)"))
    .previewDisplayName("iPhone 11 Max")
}
}
