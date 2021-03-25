//
//  SourceAPIImpl.swift
//  mandiri-online-test
//
//  Created by Hedy on 21/09/20.
//

import Foundation
import RxSwift

class SourceAPIImpl: SourceAPI {
    
    private class GetSources: HTTPRequest {
        var method = HTTPMethod.GET
        var path = "/sources"
        var apiVersion = ApiVersion.v2
        var parameters: [String: Any]
        var authentication = HTTPAuth.tokenType.basic
        var header = HeaderType.basic
        
        init(parameters: [String: Any]) {
            self.parameters = parameters
        }
    }
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func request(parameters: [String: Any]) -> Single<SourceResponse> {
        return httpClient.send(request: GetSources(parameters: parameters))
    }
}
