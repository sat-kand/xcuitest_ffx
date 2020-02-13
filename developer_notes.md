* Code was built with XCode 11.3
* Dependencies were injected by Cocoapods 1.8.4
* Thrd Party Libraries used: Alamofire, SDWebImage, SwiftyJSON
* Downloaded dependencies in Pod directory are not cleared, thus the project can run straight away
* The project uses MVVM design pattern with the following major elements,
        - Views
            -- NewsViewController (View for the main news tableview)
            -- WebViewController (View for loading MKWebView)
        - View Model
            -- NewsViewModel (View Model for the main news tableview)
        - Models
            -- FFTAsset (Data model for each asset in the api response)
            -- FFTImageInfo (Data model for each image FFTAsset)
        - Network Layer
            -- FFTApiRequestManager (Network layer responsible for api call)
* Unit test details are explained in each of the test classes as comments.
* Addiitonal features: Error pop-up on "Home View" when api call fails and provides reload option
