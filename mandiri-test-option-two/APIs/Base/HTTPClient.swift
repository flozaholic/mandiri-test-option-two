//
//  HTTPClient.swift
//  mandiri-online-test
//
//  Created by Hedy on 21/09/20.
//

import Foundation
import RxSwift

protocol ClientAPI {
    var httpClient: HTTPClient { get }
}

protocol HTTPClient {
    func send<T: Codable>(request apiRequest: HTTPRequest) -> Single<T>
}

protocol HTTPIdentifier {
    var baseUrl: URL { get }
}

class BaseIdentifier: HTTPIdentifier {
    #if DEBUG
        var baseUrl = URL(string: "https://newsapi.org/")!
    #else
        var baseUrl = URL(string: "https://newsapi.org/")!
    #endif
}
