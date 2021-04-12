//
//  NetworkController.swift
//  lecture17-project
//
//  Created by hamsternik on 12.04.2021.
//

import Foundation

final class NetworkController {

    let handleClientError: (Error) -> Void
    let handleServerError: (URLResponse?) -> Void

    init(
        handleClientError: @escaping (Error) -> Void,
        handleServerError: @escaping (URLResponse?) -> Void
    ) {
        self.handleClientError = handleClientError
        self.handleServerError = handleServerError
    }

    func startLoad(showWebViewCompletion: @escaping (String, URL) -> Void) {
        let url = URL(string: "https://www.google.com/")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.handleClientError(error)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                self.handleServerError(response)
                return
            }
            if let mimeType = httpResponse.mimeType, mimeType == "text/html",
                let data = data,
                let string = String(data: data, encoding: .utf8) {
                showWebViewCompletion(string, url)
            }
        }
        task.resume()
    }
}
