//
//  ListOfTexts.swift
//  Adafruit AR
//
//  Created by Trevor Beaton on 1/9/21.
//  Copyright © 2021 Vanguard Logic LLC. All rights reserved.
//

import Foundation


struct MetroM7 {
    static func getAttributedString() -> NSAttributedString {
        let url = URL(string: "https://www.apple.com")!
        
        let attributedString = NSMutableAttributedString(string: "Installing the Bootloader page")
        attributedString.addAttribute(.link, value: url, range: NSMakeRange(5, 10))
        
        return attributedString
    }
    
    static let overview = """
Our fastest Metro ever - the NXP i.MX RT1011 microcontroller powers this board with a 500 MHz ARM Cortex M7 processor. There's 4 MB of execute-in-place QSPI for firmware + disk storage and 128KB of SRAM in-chip.

Currently there we have support for using this board with CircuitPython. There is no Arduino support at this time.
"""
    
    static let debugInterface = "If you'd like to do more advanced development, trace-debugging, or not use the bootloader, we have the SWD interface exposed. You can use any 2x5 0.05 pitch SWD interface to connect. We suggest a J-Link."
    
    static let bootModeSwitches = """
The boot mode switches (labeled BOOT SEL on the board silk) are used to get into the ROM bootloader. The switch has two individual switches: B0 and B1. The photo shows both switches in the OFF position, but for normal operation B0 should be OFF and B1 should be ON.

The individual switches are set to ON (or 1) when they are moved next to the ON text on the switch housing and OFF (or 0) when they are moved next to their labels on the board silk. You can find more information on entering the bootloader with these switches on the Installing the Bootloader page in this guide.
"""
    
    static let stemmaQT = """
This JST SH 4-pin STEMMA QT connector breaks out I2C (SCL, SDA, 3.3V, GND). It allows you to connect to various breakouts and sensors with STEMMA QT connectors or to other things using assorted associated accessories. It works great with any STEMMA QT or Qwiic sensor/device. You can also use it with Grove I2C devices thanks to this handy cable.

In CircuitPython, this port can be accessed with board.STEMMA_I2C().
"""
    
    static let iMXRT1011Processor = """
The Metro M7 1011 is powered by the NXP i.MX RT1011 processor. This is an ARM Cortex M7 processor running at 500 MHz. It has 128KB of SRAM in-chip, along with high speed USB.
"""
    static let usbcport = """
This is used for both powering and programming the board. You can power it with any USB C cable. When USB is plugged in it will charge the Lipoly battery.

The following pins are related to power on the Metro M7 1011:

3.3V - this is the output from the 3.3V regulator, it can supply 500mA peak.

5V - this is the output from the 5V regulator (when DC jack is used), or from USB. It can supply ~500mA peak from USB and ~800mA peak from DC.

GND - this is the common ground for all power and logic.

VIN - this is the higher of the DC jack or USB voltage. So if the DC jack is plugged in and 9V, Vin is 9V. If only USB connected, this will be 5V.
"""
    static let esp32 = """
The WiFi capability uses an Espressif ESP32 Wi-Fi coprocessor, aka the AirLift, with TLS/SSL support built-in. Communication is over SPI and it has CircuitPython library support ready to go for fast wireless integration with the following pins:

- MOSI pin (board.ESP_MOSI)
- MISO pin (board.ESP_MISO)
- SCK pin (board.ESP_SCK)
- CS pin (board.ESP_CS)
- Ready/Busy pin (board.ESP_BUSY)
- Reset pin (board.ESP_RESET)
- ESP RX/TX pins (board.ESP_RX and board.ESP_TX) are shared with the M7 RX/TX pins. There's a resistor between the M7's RX line and the ESP32 module so that a device connected on the RX pin will override the communication from the ESP32 module.
- You can also connect to the ESP32 RTS pin (used in some serial contexts) on board.ESP_RTS
- The ESP32 GPIO0 pin for bootloader enable is connected to board.ESP_GPIO0
"""
    static let dcJack = """
The DC Jack is a 5.5mm/2.1mm center-positive DC connector, which is the most common available. Provide about 6V-12V here to power the Metro M7 1011.

The following pins are related to power on the Metro M7 1011:

3.3V - this is the output from the 3.3V regulator, it can supply 500mA peak.

5V - this is the output from the 5V regulator (when DC jack is used), or from USB. It can supply ~500mA peak from USB and ~800mA peak from DC.

GND - this is the common ground for all power and logic.

VIN - this is the higher of the DC jack or USB voltage. So if the DC jack is plugged in and 9V, Vin is 9V. If only USB connected, this will be 5V.
"""
    
}

struct MetroM7NXP {
    static func getAttributedString() -> NSAttributedString {
        let url = URL(string: "https://www.apple.com")!
        
        let attributedString = NSMutableAttributedString(string: "Installing the Bootloader page")
        attributedString.addAttribute(.link, value: url, range: NSMakeRange(5, 10))
        
        return attributedString
    }
    
    static let overview = """
Our fastest Metro ever - For this new product, DigiKey, NXP and Adafruit all contributed the stuff the stuff they know best: shipping parts fast (DigiKey), designing microcontrollers (NXP) and crafting great products with tutorials (that's us, Adafruit!)
"""
    
    static let debugInterface = "If you'd like to do more advanced development, trace-debugging, or not use the bootloader, we have the SWD interface exposed. You can use any 2x5 0.05 pitch SWD interface to connect. We suggest a J-Link."
    
    static let bootModeSwitches = """
The boot mode switches (labeled BOOT SEL on the board silk) are used to get into the ROM bootloader. The switch has two individual switches: B0 and B1. The photo shows both switches in the OFF position, but for normal operation B0 should be OFF and B1 should be ON.

The individual switches are set to ON (or 1) when they are moved next to the ON text on the switch housing and OFF (or 0) when they are moved next to their labels on the board silk. You can find more information on entering the bootloader with these switches on the Installing the Bootloader page in this guide.
"""
    
    static let stemmaQT = """
This JST SH 4-pin STEMMA QT connector breaks out I2C (SCL, SDA, 3.3V, GND). It allows you to connect to various breakouts and sensors with STEMMA QT connectors or to other things using assorted associated accessories.

It works great with any STEMMA QT or Qwiic sensor/device. You can also use it with Grove I2C devices thanks to this handy cable.

In CircuitPython, this port can be accessed with board.STEMMA_I2C().
"""
    
    static let iMXRT1011Processor = """
This Metro M7 is powered by the NXP i.MX RT1011 processor. This is an ARM Cortex M7 processor running at 500 MHz. It has 128KB of SRAM in-chip, along with high speed USB.
"""
    static let usbcport = """
This is used for both powering and programming the board. You can power it with any USB-C cable. When USB is plugged in it will charge the Lipoly battery.

The following pins are related to power on this Metro M7 with microSD:

3.3V - this is the output from the 3.3V regulator, it can supply 500mA peak.

5V - this is the output from the 5V regulator (when DC jack is used), or from USB. It can supply ~500mA peak from USB and ~800mA peak from DC.

GND - this is the common ground for all power and logic.

VIN - this is the higher of the DC jack or USB voltage. So if the DC jack is plugged in and 9V, Vin is 9V. If only USB connected, this will be 5V.
"""
    static let microSDCardSlot = """
For audio files, images, scripts, or data logging. Uses SPI port and a chip select pin.
"""
    static let dcJack = """
The DC Jack is a 5.5mm/2.1mm center-positive DC connector, which is the most common available. Provide about 6V-12V here to power this Metro M7.

The following pins are related to power on this Metro M7:

3.3V - this is the output from the 3.3V regulator, it can supply 500mA peak.

5V - this is the output from the 5V regulator (when DC jack is used), or from USB. It can supply ~500mA peak from USB and ~800mA peak from DC.

GND - this is the common ground for all power and logic.

VIN - this is the higher of the DC jack or USB voltage. So if the DC jack is plugged in and 9V, Vin is 9V. If only USB connected, this will be 5V.
"""
}
