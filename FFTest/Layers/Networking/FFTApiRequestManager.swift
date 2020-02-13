//
//  FFTApiRequestManager.swift
//  FFTest
//

import Foundation
import Alamofire
import SwiftyJSON

protocol FFTApiRequestProtocol {
    func getNews(completion: @escaping ([FFTAsset]?, Error?) -> Void)
}

class FFTApiRequestManager {
    
    var sessionManager: SessionManager
    let testFault_maxNewsCount = 10
    
    init(timeout: Int) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 5
        self.sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func getNews(completion: @escaping ([FFTAsset]?, Error?) -> Void) {
        self.sessionManager.request(ApiEndPoint.testNews, method: .get).validate().responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let assetArray = self.sortedAssetArray(fromJson: json)
                if self.testFault_maxNewsCount != 0 { // 0 indicates all articles
                    completion(Array(assetArray[0..<self.testFault_maxNewsCount]), nil)
                }
                else {
                    completion(assetArray, nil)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func sortedAssetArray(fromJson json: JSON) -> [FFTAsset] {
        let assetsJSON: [JSON] = json["assets"].arrayValue
        
        var assetArray: [FFTAsset] = [FFTAsset]()
        for assetJSON in assetsJSON {
            assetArray.append(FFTAsset(json: assetJSON))
        }
        assetArray.sort(by: { (news1, news2) -> Bool in
            news1.postedDate.compare(news2.postedDate) == .orderedDescending
        })
        
        return assetArray
    }
}
