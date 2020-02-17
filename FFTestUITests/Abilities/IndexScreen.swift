//
//  IndexScreen.swift
//  FFTestUITests
//

import XCTest

protocol IndexScreen: BaseApp { }

//All the elements in Index Screen

extension IndexScreen {
    private var storyImage: XCUIElementQuery {
        return app.images.matching(identifier: "index-story-image")
    }
    private var storyHeadline: XCUIElementQuery {
        return app.tables.staticTexts.matching(identifier: "index-story-headline")
    }
    private var storyAbstract: XCUIElement {
        return app.tables.staticTexts["index-story-abstract"]
    }
    private var storyByLine: XCUIElement {
        return app.tables.staticTexts["index-story-byLine"]
    }
    private var newsButton: XCUIElement {
        return app.navigationBars["FFTest.WebView"].buttons["News"]
    }
    private var indexScreenTitle: XCUIElement {
        return app.navigationBars["News"].staticTexts["News"]
    }
    
    func thenIShouldSeeStoryDetails() {
        
        XCTAssertTrue(storyImage.element.exists, "Image not present in Index screen")
        XCTAssertTrue(storyHeadline.element.exists, "Headline not present in Index screen")
        XCTAssertTrue(storyAbstract.exists, "Abstract not present in Index screen")
        XCTAssertTrue(storyByLine.exists, "ByLine not present in Index screen")
    }
    
    func givenIOpenAStory() {
        storyHeadline.firstMatch.tap()
    }
    
    func whenICloseArticle() {
        newsButton.tap()
    }
    
    func thenIShouldSeeIndexScreenTitle() {
        XCTAssertTrue(indexScreenTitle.exists, "Index screen headline not shown")
    }
    
    func givenITapAnyWhereInList() {
        storyByLine.firstMatch.tap()
    }
    
    func givenIOpenLastArticle() {
        storyHeadline.element(boundBy: 9).tap()
    }
    
    func verifyArticleCountis(_ count: Int) {
        let articlesCount = storyImage.count
        XCTAssertEqual(articlesCount, count)
    }
}
