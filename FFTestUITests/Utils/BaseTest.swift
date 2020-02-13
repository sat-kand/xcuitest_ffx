//
//  BaseTest.swift
//  FFTestUITests
//

import XCTest

protocol BaseApp {
    var app: XCUIApplication { get }
}

class BaseTest: XCTestCase, IndexScreen, FullArticle {
    let app = XCUIApplication()
}
