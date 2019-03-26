//
//  Adafruit_QR_Tests.swift
//  Adafruit QR Tests
//
//  Created by Trevor Beaton on 3/4/19.
//  Copyright © 2019 Vanguard Logic LLC. All rights reserved.
//

import XCTest
@testable import Adafruit_AR


class Adafruit_QR_Tests: XCTestCase {
    var qrCodeLink: QRViewController!
    
    
    
    
    override func setUp() {
     qrCodeLink = QRViewController()
     qrCodeLink.functionToTest()
    }

    override func tearDown() {
        
        qrCodeLink = nil
        
        
    }


    func videoIsTested() {
        
    XCTAssertEqual(qrCodeLink.productsLoaded, 2, "Test")
        
        
    }


}
