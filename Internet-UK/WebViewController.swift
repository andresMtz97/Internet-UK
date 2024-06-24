//
//  WebViewController.swift
//  Internet-UK
//
//  Created by DISMOV on 14/06/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var actI: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        
        actI = UIActivityIndicatorView()
        actI.center = view.center
        self.view.addSubview(actI)
        actI.hidesWhenStopped = true
        actI.style = .large
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let urlStr = "https://www.unam.mx"
        if let url = URL(string: urlStr) {
            actI.startAnimating()
            let request = URLRequest(url: url)
            webView.load(request)
            
            
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        actI.stopAnimating()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
