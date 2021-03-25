//
//  HeadlineAPIImpl.swift
//  mandiri-online-test
//
//  Created by TMLI IT Dev on 05/11/20.
//

import Foundation
import RxSwift

class HeadlineAPIImpl: HeadlineAPI {
    
    private class GetHeadlines: HTTPRequest {
        var method = HTTPMethod.GET
        var path = "/top-headlines"
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
    
    func request(parameters: [String: Any]) -> Single<HeadlineResponse> {
        return httpClient.send(request: GetHeadlines(parameters: parameters))
    }
}
