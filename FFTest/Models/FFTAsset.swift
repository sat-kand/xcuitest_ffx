//
//  FFTAsset.swift
//  FFTest
//

import Foundation
import SwiftyJSON

class FFTAsset: NSObject {
    var url: String
    var headline: String
    var theAbstract: String
    var byLine: String
    var postedDate: Date
    var imageArray: [FFTImageInfo]
    
    convenience override init() {
        self.init(json: JSON([]))
    }
    
     init(json: JSON) {
        self.url = json["url"].stringValue
        self.headline = json["headline"].stringValue
        self.theAbstract = json["theAbstract"].stringValue
        self.byLine = json["byLine"].stringValue
        self.postedDate = Date(timeIntervalSince1970: json["timeStamp"].doubleValue / 1000)
        
        self.imageArray = [FFTImageInfo]()
        for imageInfoJSON in json["relatedImages"].arrayValue {
            self.imageArray.append(FFTImageInfo(json: imageInfoJSON))
        }
        
        super.init()
    }
    
    // Get the smallest image in the related image list
    func smallestImage() -> FFTImageInfo? {
        let minImageInfo =  self.imageArray.min { (imageInfo1, imageInfo2) -> Bool in
            if (imageInfo1.imageSize() == 0) {
                return false
            }
            if(imageInfo2.imageSize() == 0) {
                return true
            }
            return imageInfo1.imageSize() < imageInfo2.imageSize()
        }
        
        return minImageInfo
    }
}
