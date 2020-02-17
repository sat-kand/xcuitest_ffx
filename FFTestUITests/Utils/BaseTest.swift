//
//  BaseTest.swift
//  FFTestUITests
//

import XCTest

protocol BaseApp {
    var app: XCUIApplication { get }
}

class BaseTest: XCTestCase, IndexScreen, FullArticle {

    //To avoid recreating XCUIApplication every time in the tests.
    let app = XCUIApplication()
}
