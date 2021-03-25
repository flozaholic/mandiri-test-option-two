//
//  HeadlineBody.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

struct HeadlineBody: Codable {
    let q: String?
    let sources: String
    var apiKey: String = HTTPAuth.shared.apiKey
}
