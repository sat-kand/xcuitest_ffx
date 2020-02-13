//
//  FFTestUITests.swift
//  FFTestUITests
//

class FFTestUITests: BaseTest {

    override func setUp() {

        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    //Test to verify, stories has image, headline, theAbstract and byLine on index screen
    func test_Index_Story() {

        thenIShouldSeeStoryDetails()
    }

    //Test to verify index screen has no more than 10 articles
    func test_Stories_Count() {

       verifyArticleCountis(10)
    }

    //Test to verify tapping a story should take user to full article
    func test_read_Full_Article() {

        givenIOpenAStory()
        thenIShouldSeeFullArticle()
    }

    //Test to verify closing article opens index screen
    func test_Close_Article() {

        givenIOpenAStory()
        whenICloseArticle()
        thenIShouldSeeStoryDetails()
    }

    //Test to scroll to last article and open it
    func test_Scroll_To_Last_Article() {

        givenIOpenLastArticle()
        thenIShouldSeeFullArticle()
    }

    //Test to verify the index screen title
    func test_Index_Screen_Title() {

        thenIShouldSeeIndexScreenTitle()
    }

    //Test to verify that tapping anywhere in the list opens the article
    func test_Tapping_list_Opens_Article() {

        givenITapAnyWhereInList()
        thenIShouldSeeFullArticle()
    }
}
