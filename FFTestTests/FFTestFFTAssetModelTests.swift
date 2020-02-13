//
//  FFTestFFTAssetModelTests.swift
//  FFTestTests
//

/*
 This test class is used to test if the FFTAsset Model
 1. Can be initialised properly
 2. The "smallestImage" method functions properly
 */

import XCTest
import SwiftyJSON
@testable import FFTest

class FFTestFFTAssetModelTests: XCTestCase {
    
    var asset: FFTAsset?
    
    override func setUp() {
        super.setUp()
        
        let testBundle = Bundle(for: type(of: self))
        if let newsJsonFileURL = testBundle.url(forResource: "NewsAssetSample", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: newsJsonFileURL)
                let json = try JSON(data: jsonData)
                self.asset = FFTAsset(json: json)
            } catch (let e) {
                NSLog("Failed when parsing JSON from file, \(e.localizedDescription)")
            }
        }
    }
    
    func testSetUp() {
        XCTAssertNotNil(self.asset, "Asset to be tested is nil")
    }
    
    func testSmallestImage() {
        if let smallestImage = self.asset?.smallestImage() {
            XCTAssertEqual(smallestImage.imageSize(), 19600, "Smallest iamge size is not 19600")
        } else {
            XCTFail("Smallest image is nil")
        }
    }
    
    override func tearDown() {
        self.asset = nil
        super.tearDown()
    }
}
