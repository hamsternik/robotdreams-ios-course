//
//  ViewController.swift
//  lecture17-project
//
//  Created by hamsternik on 12.04.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet private var progressLabel: UILabel!
    @IBOutlet private var webView: WKWebView!

    private lazy var networkController: NetworkController = {
        let controller = NetworkController(
            handleClientError: handleClientError,
            handleServerError: handleServerError
        )
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        networkController.startLoad { (string, url) in
            DispatchQueue.main.async {
                self.webView.loadHTMLString(string, baseURL: url)
                self.progressLabel.text = "Loaded 🎉"
            }
        }
    }

    private func handleClientError(err: Error) {
        print("client error: \(err.localizedDescription)")
    }

    private func handleServerError(response: URLResponse?) {
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Fatal: is not an HTTP protocol")
            return
        }
        print("server code error: \(httpResponse.statusCode)")
    }
}

