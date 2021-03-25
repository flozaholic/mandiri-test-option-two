//
//  SourceAPI.swift
//  mandiri-online-test
//
//  Created by Hedy on 21/09/20.
//

import Foundation
import RxSwift

protocol SourceAPI: ClientAPI {
    func request(parameters: [String: Any]) -> Single<SourceResponse>
}
