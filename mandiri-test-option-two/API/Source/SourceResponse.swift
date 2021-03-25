//
//  SourceResponse.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

struct SourceResponse: Codable {
    let status: String?
    let sources: [SourceResponseDetail]
    let code: String?
    let message: String?
}

struct SourceResponseDetail: Codable {
    let id: String?
    let name: String?
    let description: String?
    let url: String?
    let category: String?
}

enum BasicUIState {
    case close
    case loading
    case success(String)
    case failure(String)
    case warning(String)
}
