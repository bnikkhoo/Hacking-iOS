//
//  DetailViewController.swift
//  project 7
//
//  Created by Babak Nikkhoo on 11/4/17.
//  Copyright © 2017 Babak Nikkhoo. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var webView: WKWebView!
    var detailItem: [String: String]!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard detailItem != nil else { return }

        if let body = detailItem["body"] {
            var html = "<html>"
            html += "<head>"
            html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
            html += "<style> body { font-size: 150%; } </style>"
            html += "</head>"
            html += "<body>"
            html += "<h4><center>" + detailItem["title"]! + "</center></h4>"
            html += body
            html += "</body>"
            html += "</html>"
            webView.loadHTMLString(html, baseURL: nil)
        }
    }
}
