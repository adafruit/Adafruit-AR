//
//  PICOBoardOverlay.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 1/26/21.
//  Copyright © 2021 Vanguard Logic LLC. All rights reserved.
//

import SwiftUI






struct Teensy41BoardOverlay: View {

  @State private var viewY = 0

  @State private var debugY = 0

    var body: some View {

        let data = [

                    Data(value: "",prefix:"Vin (3.6 to 5.5 Volts)", fgColor: .white, bgcolor: .red, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "",prefix:"GND", fgColor: .white, bgcolor: .black,prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "",prefix:"3.3V (250 mA max)", fgColor: .white, bgcolor: .red, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "23", prefix: "A9", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "CRX1", bgColor2: Color(#colorLiteral(red: 1, green: 0.6997302593, blue: 0.8755037922, alpha: 1)), prefix3: "MCLK1", bgColor3: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "22", prefix: "A8", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "CTX1", bgColor2: Color(#colorLiteral(red: 1, green: 0.6997302593, blue: 0.8755037922, alpha: 1)), prefix3: "     ", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "21", prefix: "A7", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "RX5", bgColor2: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix3: "BCLK1", bgColor3: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "20", prefix: "A6", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "TX5", bgColor2: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix3: "LRCLK1", bgColor3: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "19", prefix: "A5", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "         ", bgColor2: .clear, prefix3: "SCL", bgColor3: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "18", prefix: "A4", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "         ", bgColor2: .clear, prefix3: "SDA", bgColor3: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "17", prefix: "A3", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "TX4", bgColor2: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix3: "SDA1", bgColor3: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "16", prefix: "A2", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "RX4", bgColor2: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix3: "SCL1", bgColor3: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "15", prefix: "A1", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "RX3", bgColor2: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix3: "S/PDIF IN", bgColor3: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "14", prefix: "A0", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "TX3", bgColor2: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix3: "S/PDIF OUT", bgColor3: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "13", prefix: "(LED)", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix2: "SCK", bgColor2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix3: "       ", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "",prefix:"GND", fgColor: .white, bgcolor: .black,prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

          Data(value: "41",prefix:"A17", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "", bgColor2:.clear, prefix3: "", bgColor3: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix4: "", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "", bgColor5:  Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "40",prefix:"A16", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "", bgColor2:.clear, prefix3: "", bgColor3: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix4: "", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "", bgColor5:  Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "39", prefix: "A15", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "MISO1", bgColor2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix3: "OUT1A", bgColor3: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

          Data(value: "38", prefix: "A14", fgColor: .black, bgcolor: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)), prefix2: "CS1", bgColor2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix3: "IN1", bgColor3: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

          Data(value: "37", prefix: "                  ", fgColor: .black, bgcolor: .clear, prefix2: "CS", bgColor2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "36", prefix: "                  ", fgColor: .black, bgcolor: .clear, prefix2: "CS", bgColor2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

          Data(value: "35", prefix: "TX8", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

          Data(value: "34", prefix: "RX8", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: Color(#colorLiteral(red: 0.8178200382, green: 0.6525374868, blue: 1, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

          Data(value: "33", prefix: "             ", fgColor: .black, bgcolor: .clear, prefix2: "", bgColor2: .clear, prefix3: "MCLK2", bgColor3: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), prefix4: "", bgColor4: .clear,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)))
        ]






        let data2 = [
                    Data(value: "",prefix:"GND", fgColor: .white, bgcolor: .black,prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                     Data(value: "0",prefix:"RX1", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix2: "CS1", bgColor2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix3: "CRX2", bgColor3: Color(#colorLiteral(red: 1, green: 0.7170018578, blue: 0.7933105978, alpha: 1)), prefix4: "PWM", bgColor4: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)),prefix5: "", bgColor5: .clear),

                     Data(value: "1",prefix:"TX1", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix2: "MISO1", bgColor2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix3: "CTX2", bgColor3: Color(#colorLiteral(red: 1, green: 0.7170018578, blue: 0.7933105978, alpha: 1)), prefix4: "PWM", bgColor4: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "2",prefix:"   ", fgColor: .black, bgcolor: .clear, prefix2: "              ", bgColor2: .clear, prefix3: "   ", bgColor3: .clear, prefix4: "OUT2", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5:  Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "3",prefix:"   ", fgColor: .black, bgcolor: .clear, prefix2: "              ", bgColor2: .clear, prefix3: "   ", bgColor3: .clear, prefix4: "LRCLK2", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "4",prefix:"   ", fgColor: .black, bgcolor: .clear, prefix2: "              ", bgColor2: .clear, prefix3: "   ", bgColor3: .clear, prefix4: "BCLK2", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "5",prefix:"   ", fgColor: .black, bgcolor: .clear, prefix2: "              ", bgColor2: .clear, prefix3: "   ", bgColor3: .clear, prefix4: "IN2", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5:  Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "6",prefix:"   ", fgColor: .black, bgcolor: .clear, prefix2: "              ", bgColor2: .clear, prefix3: "   ", bgColor3: .clear, prefix4: "OUT1D", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "7",prefix:"RX2", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix2: "         ", bgColor2: .clear, prefix3: "   ", bgColor3: .clear, prefix4: "OUT1A", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "8",prefix:"TX2", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix2: "         ", bgColor2: .clear, prefix3: "   ", bgColor3: .clear, prefix4: "IN1", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5:  Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "9",prefix:"   ", fgColor: .black, bgcolor: .clear, prefix2: "              ", bgColor2: .clear, prefix3: "   ", bgColor3: .clear, prefix4: "OUT1C", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "10",prefix:"      ", fgColor: .black, bgcolor: .clear, prefix2: "", bgColor2:.clear, prefix3: "CS", bgColor3: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix4: "OUT1D", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                Data(value: "11",prefix:"      ", fgColor: .black, bgcolor: .clear, prefix2: "", bgColor2:.clear, prefix3: "MOSI", bgColor3: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix4: "CTX1", bgColor4:  Color(#colorLiteral(red: 1, green: 0.7170018578, blue: 0.7933105978, alpha: 1)) ,prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "12",prefix:"      ", fgColor: .black, bgcolor: .clear, prefix2: "", bgColor2:.clear, prefix3: "MISO", bgColor3: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix4: "MQSL", bgColor4: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)),prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "",prefix:"3.3V",fgColor: .white, bgcolor: .red, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "", bgColor5: .clear),

                    Data(value: "24", prefix: "A10", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), prefix2: "TX6", bgColor2: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix3: "SCL2", bgColor3: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix4: "PWM", bgColor4: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "25", prefix: "A11", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), prefix2: "RX6", bgColor2: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix3: "SDA2", bgColor3: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix4: "PWM", bgColor4: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "26", prefix: "A12", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), prefix2: "MOSI1", bgColor2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix3: "", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "", bgColor4: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),prefix5: "", bgColor5: .clear),

                    Data(value: "27", prefix: "A13", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)), prefix2: "SCK1", bgColor2: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), prefix3: "", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "", bgColor4: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)),prefix5: "", bgColor5: .clear),


                Data(value: "28", prefix: "RX7", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix2: "             ", bgColor2: .clear, prefix3: "", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "", bgColor4: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)),prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                Data(value: "29", prefix: "TX7", fgColor: .black, bgcolor: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)), prefix2: "             ", bgColor2: .clear, prefix3: "", bgColor3: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)), prefix4: "", bgColor4: Color(#colorLiteral(red: 0.7311126544, green: 0.6819911648, blue: 0.9686274529, alpha: 1)),prefix5: "PWM", bgColor5: Color(#colorLiteral(red: 1, green: 0.7205477193, blue: 0.5445609691, alpha: 1))),

                    Data(value: "30", prefix: "       ", fgColor: .black, bgcolor: .clear, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "CRX3", bgColor5: Color(#colorLiteral(red: 1, green: 0.7170018578, blue: 0.7933105978, alpha: 1))),

                    Data(value: "31", prefix: "       ", fgColor: .black, bgcolor: .clear, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "CTX3", bgColor5: Color(#colorLiteral(red: 1, green: 0.7170018578, blue: 0.7933105978, alpha: 1))),

                    Data(value: "32", prefix: "       ", fgColor: .black, bgcolor: .clear, prefix2: "", bgColor2: .clear, prefix3: "", bgColor3: .clear, prefix4: "", bgColor4: .clear,prefix5: "OUT1B", bgColor5: Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)))
        ]




            ZStack{
            //Border
              RoundedRectangle(cornerRadius: 1, style: .continuous)
                .fill(Color.clear)
                .frame(width: 140, height: 282.5)
                .border(Color.gray, width: 2)
                .position(x: 250, y: CGFloat(viewY))



                HStack{

                    VStack(alignment: .leading) {
                        ForEach(data) { (pinout) in
                            pintOutStruct(value: pinout.value, prefix: pinout.prefix, fgcolor: pinout.fgColor, bgcolor: pinout.bgcolor, prefix2: pinout.prefix2, bgColor2: pinout.bgColor2, prefix3: pinout.prefix3, bgColor3: pinout.bgColor3, prefix4: pinout.prefix4, bgColor4: pinout.bgColor4, prefix5: pinout.prefix5, bgColor5: pinout.bgColor5)
                            }
                        .frame(width: 150, height: 11.8, alignment: .leading)
                    }

                    .position(x: 395, y: CGFloat(viewY))

                    VStack(alignment: .trailing) {
                        ForEach(data2) { (pinout) in
                            pintOutStruct2(value: pinout.value, prefix: pinout.prefix, fgcolor: pinout.fgColor, bgcolor: pinout.bgcolor, prefix2: pinout.prefix2, bgColor2: pinout.bgColor2, prefix3: pinout.prefix3, bgColor3: pinout.bgColor3, prefix4: pinout.prefix4, bgColor4: pinout.bgColor4, prefix5: pinout.prefix5, bgColor5: pinout.bgColor5)
                            }
                        .frame(width: 150, height: 11.8, alignment: .trailing)
                    }

                    .position(x: -148, y: CGFloat(viewY))

                }
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
            .rotationEffect(.degrees(-180))


    }

}



struct Teensy41BoardOverlay_Previews: PreviewProvider {


static var previews: some View {
    Teensy41BoardOverlay()
    .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    .previewDisplayName("iPhone 12 Pro Max")
}
}

