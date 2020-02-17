//
//  FullArticle.swift
//  FFTestUITests
//

import XCTest

protocol FullArticle: BaseApp { }

//All the elements in Full Screen Article

extension FullArticle {

    private var afrLink: XCUIElement {
        return app.links["Australian Financial Review"]
    }

    func thenIShouldSeeFullArticle() {
        XCTAssertTrue(afrLink.waitForExistence(timeout: 5), "Full article not opened")
    }
}
