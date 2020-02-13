//
//  FullArticle.swift
//  FFTestUITests
//

import XCTest

protocol FullArticle: BaseApp { }

extension FullArticle {

    private var afrLink: XCUIElement {
        return app.links["Australian Financial Review"]
    }

    func thenIShouldSeeFullArticle() {
        XCTAssertTrue(afrLink.waitForExistence(timeout: 5), "Full article not opened")
    }
}
