//
//  ViewController.swift
//  webview-test
//
//  Created by AV on 08/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var webView: WKWebView!
    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        container.addSubview(webView)
    }

    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, container.bounds.width, container.bounds.height)
        webView.frame = frame
    }
    
    func loadRequest(urlStr: String!) {
        let url = NSURL(string: urlStr)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }

    @IBAction func loadTheWeb(btn: UIButton!) {
        
        if btn.tag == 0 {
            loadRequest("https://developer.apple.com/swift/blog/")
        }else if btn.tag == 1 {
            loadRequest("https://www.playstation.com/en-us/explore/games/ps4-games/")
        }else {
            loadRequest("http://kblog.lunchboxbunch.com")
        }
    }
    
}

