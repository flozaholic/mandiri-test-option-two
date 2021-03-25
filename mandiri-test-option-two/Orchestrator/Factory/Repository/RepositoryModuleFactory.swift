//
//  RepositoryModuleFactory.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

protocol RepositoryModuleFactory {
    // MARK: - Main
    func makeListCategoryRepo() -> ListCategoryRepository
    func makeListArticlesRepo() -> ListArticleRepository
}
