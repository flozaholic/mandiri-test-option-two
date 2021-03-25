//
//  HeadlineAPI.swift
//  mandiri-online-test
//
//  Created by TMLI IT Dev on 05/11/20.
//

import Foundation
import RxSwift

protocol HeadlineAPI: ClientAPI {
    func request(parameters: [String: Any]) -> Single<HeadlineResponse>
}
