//
//  LoginWebViewController.swift
//  SharonovAntonVK
//
//  Created by Anton Sharonov on 18/05/2020.
//  Copyright © 2020 AntonSharonov. All rights reserved.
//

import UIKit
import WebKit

class LoginWebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
        {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7472271"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.103")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
//        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
//            decisionHandler(.allow)
//            return
//        }
//
//        let params = fragment
//            .components(separatedBy: "&")
//            .map { $0.components(separatedBy: "=") }
//            .reduce([String: String]()) { result, param in
//                var dict = result
//                let key = param[0]
//                let value = param[1]
//                dict[key] = value
//                return dict
//        }
//
//        Session.instance.token = params["access_token"]!
//        Session.instance.userId = Int(params["user_id"]!)!
//
//        print("token: \(params["access_token"]!), user: \(params["user_id"]!)")
//
//        decisionHandler(.cancel)
    }
}


