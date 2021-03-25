//
//  SourceBody.swift
//  mandiri-online-test
//
//  Created by Hedy on 21/09/20.
//

import Foundation

struct SourceBody: Codable {
    var apiKey: String = HTTPAuth.shared.apiKey
}
