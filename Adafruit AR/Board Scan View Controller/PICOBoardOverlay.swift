//
//  PICOBoardOverlay.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 1/26/21.
//  Copyright © 2021 Vanguard Logic LLC. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
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

@available(iOS 13.0, *)
struct PICOBoardOverlay: View {

    var body: some View {

        let data = [Data(value: "40",prefix:"VBUS", fgColor: .white, bgcolor: .red, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "39", prefix: "VSYS", fgColor: .white, bgcolor: .red,prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "38", prefix: "GND", fgColor: .white, bgcolor: .black,prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "37", prefix: "3V3_EN", fgColor: .black, bgcolor: .gray, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "36", prefix: "3V3", fgColor: .white, bgcolor: .red, prefix2: "300 mA Max", bgColor2: .black, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "35", prefix: "ADC_VREF", fgColor: .black, bgcolor: .orange, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "34", prefix: "GP28", fgColor: .black, bgcolor: .yellow, prefix2: "PWM6A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "DI1", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "GP28_A2", bgColor5: .orange),

                    Data(value: "33", prefix: "GND", fgColor: .white, bgcolor: .black, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "32", prefix: "GP27",fgColor: .black, bgcolor: .yellow, prefix2: "PWM5B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "D01", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCL1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "GP26_A0", bgColor5: .orange),

                    Data(value: "31", prefix: "GP26", fgColor: .black, bgcolor: .yellow,  prefix2: "PWM5A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "SCK1", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "GP27_A0", bgColor5: .orange),

                    Data(value: "30", prefix: "RUN/RESET", fgColor: .black, bgcolor: .gray, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "29", prefix: "GP22", fgColor: .black, bgcolor: .yellow, prefix2: "PWM3A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "SCK0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "28", prefix: "GND", fgColor: .white, bgcolor: .black, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "27", prefix: "GP21", fgColor: .black, bgcolor: .yellow, prefix2: "PWM2B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "CS0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCL0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "RX1", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "26", prefix: "GP20", fgColor: .black, bgcolor: .yellow, prefix2: "PWM2A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "DI0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "TX1", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "25", prefix: "GP19",  fgColor: .black, bgcolor: .yellow, prefix2: "PWM1B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "D00", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "24", prefix: "GP18", fgColor: .black, bgcolor: .yellow, prefix2: "PWM1A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "SCK0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "23", prefix: "GND", fgColor: .white, bgcolor: .black, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "22", prefix: "GP17", fgColor: .black, bgcolor: .yellow, prefix2: "PWM0B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "CS0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "21", prefix: "GP16", fgColor: .black, bgcolor: .yellow, prefix2: "PWM0A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "DI0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "TX0", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
        ]






        let data2 = [Data(value: "1",prefix:"GP0", fgColor: .black, bgcolor: .yellow, prefix2: "PWM0A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "DI0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "TX0", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                     Data(value: "2",prefix:"GP1", fgColor: .black, bgcolor: .yellow, prefix2: "PWM0B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "CS0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCL0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "RX0", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "3", prefix: "GND", fgColor: .white, bgcolor: .black,prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "4",prefix:"GP2", fgColor: .black, bgcolor: .yellow, prefix2: "PWM1A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "SCK0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCA1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "5",prefix:"GP3", fgColor: .black, bgcolor: .yellow, prefix2: "PWM1B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "D00", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCL1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "6",prefix:"GP4", fgColor: .black, bgcolor: .yellow, prefix2: "PWM2A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "DI0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCA0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "TX1", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "7", prefix: "GP5", fgColor: .black, bgcolor: .yellow, prefix2: "PWM2B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "CS0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCL0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "RX1", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "8",prefix:"GND", fgColor: .white, bgcolor: .black, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear ,prefix5: "", bgColor5: .clear),

                    Data(value: "9",prefix:"GP6", fgColor: .black, bgcolor: .yellow, prefix2: "PWM3A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "SCK0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "10", prefix: "GP7", fgColor: .black, bgcolor: .yellow,  prefix2: "PWM5B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "D00", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDL1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "11", prefix: "GP8", fgColor: .black, bgcolor: .yellow, prefix2: "PWM4A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "DI1", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "TX1", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "12", prefix: "GP9", fgColor: .black, bgcolor: .yellow, prefix2: "PWM4B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "CS1", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCL0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "RX1", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "13", prefix: "GND", fgColor: .white, bgcolor: .black,prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "14", prefix: "GP10", fgColor: .black, bgcolor: .yellow, prefix2: "PWM5A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "SCK1", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "15", prefix: "GP11", fgColor: .black, bgcolor: .yellow, prefix2: "PWM2A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "DI0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "TX1", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "16", prefix: "GP12",  fgColor: .black, bgcolor: .yellow, prefix2: "PWM5B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "D01", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCL1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "TX0", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "17", prefix: "GP13", fgColor: .black, bgcolor: .yellow, prefix2: "PWM6B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "CS1", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SCL0", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "RX0", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "18", prefix: "GND", fgColor: .white, bgcolor: .black, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "19", prefix: "GP14", fgColor: .black, bgcolor: .yellow, prefix2: "PWM7A", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "CS0", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "SDA1", bgColor4: Color(#colorLiteral(red: 0.8072112728, green: 0.6713793157, blue: 0.9686274529, alpha: 1)),prefix5: "", bgColor5: Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))),

                    Data(value: "20", prefix: "GP15", fgColor: .black, bgcolor: .yellow, prefix2: "PWM7B", bgColor2: Color(#colorLiteral(red: 0.3326305836, green: 0.9686274529, blue: 0.6167510894, alpha: 1)), prefix3: "", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear)
        ]



        if #available(iOS 14.0, *) {
            ZStack{
            //Border
                RoundedRectangle(cornerRadius: 3, style: .circular)
                .fill(Color.clear)
                .frame(width: 162, height: 270)
                .border(Color.gray, width: 2)
                .offset(x: 0, y:25)

                pintOutDEBUGStruct()
                    .offset(x: 0, y: 260)


                HStack{

                    VStack(alignment: .leading) {
                        ForEach(data) { (pinout) in
                            pintOutStruct(value: pinout.value, prefix: pinout.prefix, fgcolor: pinout.fgColor, bgcolor: pinout.bgcolor, prefix2: pinout.prefix2, bgColor2: pinout.bgColor2, prefix3: pinout.prefix3, bgColor3: pinout.bgColor3, prefix4: pinout.prefix4, bgColor4: pinout.bgColor4, prefix5: pinout.prefix5, bgColor5: pinout.bgColor5)
                            }
                        .frame(width: 170, height: 13.5, alignment: .leading)
                    }
                    .offset(x: 245, y: 23.8)

                    VStack(alignment: .trailing) {
                        ForEach(data2) { (pinout) in
                            pintOutStruct2(value: pinout.value, prefix: pinout.prefix, fgcolor: pinout.fgColor, bgcolor: pinout.bgcolor, prefix2: pinout.prefix2, bgColor2: pinout.bgColor2, prefix3: pinout.prefix3, bgColor3: pinout.bgColor3, prefix4: pinout.prefix4, bgColor4: pinout.bgColor4, prefix5: pinout.prefix5, bgColor5: pinout.bgColor5)
                            }
                        .frame(width: 150, height: 13.5, alignment: .trailing)
                    }
                    .offset(x: -245, y: 25)
                }
            }
            .rotationEffect(.degrees(-180))
        }

    }

}


@available(iOS 13.0, *)
struct pintOutDEBUGStruct: View {


var body: some View {

    VStack(alignment: .trailing){
        Text("SWCLK")
            .font(.system(size: 7))
            .fontWeight(.black)
            .foregroundColor(.black)

            .background(Color.gray)
            .padding(0.1)

        Text("GND")
              .font(.system(size: 7))
            .fontWeight(.black)
            .foregroundColor(Color.white)
            .background(Color.black)
            .padding(0.1)


        Text("SWDI0")
            .font(.system(size: 7))
            .fontWeight(.black)
            .foregroundColor(Color.black)
            .background(Color.gray)

    }

    .offset(x: 85, y: 0)
    .rotationEffect(.degrees(-90))

}

}


@available(iOS 13.0, *)
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


@available(iOS 13.0, *)
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

@available(iOS 13.0, *)
static var previews: some View {
    PICOBoardOverlay()
    .previewDevice(PreviewDevice(rawValue: "iPhone 11 Max"))
    .previewDisplayName("iPhone 11 Max")
}
}
