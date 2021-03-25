//
//  SourceBody.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

struct SourceBody: Codable {
    var apiKey: String = HTTPAuth.shared.apiKey
}
