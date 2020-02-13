//
//  WebViewController.swift
//  FFTest
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var url: URL? //The initial url that the webview loads, please make sure this variable is set before this VC is rendered.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = self.url {
            let request = URLRequest(url: url)
            
            self.webView.load(request)
        }
    }
}
