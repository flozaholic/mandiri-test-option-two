//
//  HeadlineBody.swift
//  mandiri-online-test
//
//  Created by TMLI IT Dev on 05/11/20.
//

import Foundation

struct HeadlineBody: Codable {
    let q: String?
    let sources: String
    var apiKey: String = HTTPAuth.shared.apiKey
}
