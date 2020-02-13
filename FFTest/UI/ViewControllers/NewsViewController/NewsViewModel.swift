//
//  NewsViewModel.swift
//  FFTest
//

import Foundation

class NewsViewModel {
    private let apiRequestManager: FFTApiRequestManager
    var newsArray: [FFTAsset] = [FFTAsset]()
    
    let newsTableViewCellIdentifier: String = "newsTableViewCell"
    
    init(apiRequestManager: FFTApiRequestManager) {
        self.apiRequestManager = apiRequestManager
    }

    // Function to call api to get tableview content
    func getNews(completion: @escaping (Error?) -> Void) {
        self.apiRequestManager.getNews { [weak self] (newsArray, error) in
            self?.newsArray = newsArray ?? [FFTAsset]()
            completion(error)
        }
    }
}
