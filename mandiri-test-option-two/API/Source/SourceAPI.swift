//
//  SourceAPI.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import RxSwift

protocol SourceAPI: ClientAPI {
    func request(parameters: [String: Any]) -> Single<SourceResponse>
}
