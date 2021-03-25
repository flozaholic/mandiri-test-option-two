//
//  VMModuleFactory.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

protocol VMModuleFactory {
    // MARK: - Main
    func makeListCategoryVM() -> ListCategoryVM
    func makeListSourceVM() -> ListSourceVM
    func makeListArticleVM() -> ListArticleVM
}
