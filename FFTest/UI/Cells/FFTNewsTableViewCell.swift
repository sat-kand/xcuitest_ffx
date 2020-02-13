//
//  FFTNewsTableViewCell.swift
//  FFTest
//

import UIKit
import SDWebImage

class FFTNewsTableViewCell: UITableViewCell {

    var currentNews: FFTAsset?
    @IBOutlet weak var relatedImageView: UIImageView!
    @IBOutlet weak var imageAspectRatio: NSLayoutConstraint!
    @IBOutlet weak var imageSpinner: UIActivityIndicatorView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupContent(news: FFTAsset) {
        
        if (self.currentNews != news) {
            self.currentNews = news
            
            if let smallestImage = news.smallestImage(), let url = URL(string: smallestImage.url) {
                self.imageSpinner.startAnimating()
                self.relatedImageView.sd_setImage(with: url, placeholderImage: nil, completed: { (image, error, cacheType, url) in
                    self.imageSpinner.stopAnimating()
                })
            }

            //Ids added for testability
            self.relatedImageView.accessibilityIdentifier = "index-story-image"
            self.headlineLabel.text = news.headline
            self.headlineLabel.accessibilityIdentifier = "index-story-headline"
            self.abstractLabel.text = news.theAbstract
            self.abstractLabel.accessibilityIdentifier = "index-story-abstract"
            self.byLineLabel.text = news.byLine
            self.byLineLabel.accessibilityIdentifier = "index-story-byLine"
        }
    }
}
