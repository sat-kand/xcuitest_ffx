//
//  FFTestTests.swift
//  FFTestTests

/*
    This test class is used to test if the NewsViewModel
    1. Can be initialised properly
    2. The "getNews" method functions properly
*/

import XCTest
import SwiftyJSON
@testable import FFTest

class FFTestNewsViewModelTests: XCTestCase {
    
    var newsViewModel: NewsViewModel?
    
    override func setUp() {
        super.setUp()
        self.newsViewModel = NewsViewModel(apiRequestManager: MockApiRequestManager())
    }
    
    func testSetUp() {
        XCTAssertNotNil(self.newsViewModel, "ViewModel to be tested is nil")
    }
    
    func testGetNewsApiResponseParsing() {
        self.newsViewModel?.getNews(completion: { (error) in
            XCTAssertEqual(self.newsViewModel?.newsArray.count, 19, "Total asset count is not 19")
        })
    }
    
    override func tearDown() {
        self.newsViewModel = nil
        super.tearDown()
    }
    
    class MockApiRequestManager: FFTApiRequestManager {
        
        init() {
            super.init(timeout: 5)
        }
        
        override func getNews(completion: @escaping ([FFTAsset]?, Error?) -> Void) {
            let json = self.newsJsonResponse()
            let assetArray = super.sortedAssetArray(fromJson: json)
            
            completion(assetArray, nil)
        }
        
        private func newsJsonResponse() -> JSON {
            let testBundle = Bundle(for: type(of: self))
            if let newsJsonFileURL = testBundle.url(forResource: "NewsApiResponse", withExtension: "json") {
                do {
                    let jsonData = try Data(contentsOf: newsJsonFileURL)
                    let json = try JSON(data: jsonData)
                    return json
                } catch (let e) {
                    NSLog("Failed when parsing JSON from file, \(e.localizedDescription)")
                }
                
            }
            
            return JSON.null
        }
    }
    
}
