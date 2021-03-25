//
//  ListSourceView.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

protocol ListSourceView: BaseView {
    var viewModel: ListSourceVM! { get set }
    var model: [SourceResponseDetail]! { get set }
    var onSourceTapped: ((String) -> Void)? { get set }
}
