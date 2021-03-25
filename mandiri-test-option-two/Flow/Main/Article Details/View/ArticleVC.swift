//
//  ArticleVC.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import UIKit
import WebKit

class ArticleVC: UIViewController, ArticleView, WKUIDelegate {
    
    @IBOutlet weak var webViewFrame: UIView!

    var webView: WKWebView!
    
    var model: WebviewResourceType!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.loadWebview()

    }

    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigation()
    }

    private func setupNavigation() {
        self.setupTitleForNavigation(title: "Article")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeTapped))
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.backgroundColor = .primary
    }
    
    @objc private func closeTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupUI() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: self.webViewFrame.bounds, configuration: webConfiguration)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.uiDelegate = self
        self.webViewFrame.addSubview(webView)
    }

    func loadWebview() {
        if let resource = model {
            webView.load(resource)
        } else {
            fatalError("please set resourceType variable!")
        }
    }

    func bindViewModel() { }

}
