//
//  DataModuleFactoryImpl.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

class ModuleFactoryImpl: DataModuleFactory {
    
    func makeBaseIdentifier() -> HTTPIdentifier {
        return BaseIdentifier()
    }
    
    func makeHTTPClient() -> HTTPClient {
        return HTTPClientImpl(identifier: makeBaseIdentifier())
    }
    
    func makeSourceAPI() -> SourceAPI {
        return SourceAPIImpl(httpClient: makeHTTPClient())
    }
    
    func makeHeadlineAPI() -> HeadlineAPI {
        HeadlineAPIImpl(httpClient: makeHTTPClient())
    }
    
}
