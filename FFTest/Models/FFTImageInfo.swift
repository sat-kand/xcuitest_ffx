//
//  FFTImageInfo.swift
//  FFTest
//

import Foundation
import SwiftyJSON

struct FFTImageInfo {
    
    var url: String
    var width: Int
    var height: Int
    
    init(json: JSON) {
        self.url = json["url"].stringValue
        self.width = json["width"].intValue
        self.height = json["height"].intValue
    }
    
    func imageSize() -> Int {
        return self.width * self.height
    }
}
