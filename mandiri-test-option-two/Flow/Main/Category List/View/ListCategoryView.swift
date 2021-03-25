//
//  ListCategoryView.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

protocol ListCategoryView: BaseView {
    var viewModel: ListCategoryVM! { get set }
    var onCategoryTapped: (([SourceResponseDetail]) -> Void)? { get set }
}
