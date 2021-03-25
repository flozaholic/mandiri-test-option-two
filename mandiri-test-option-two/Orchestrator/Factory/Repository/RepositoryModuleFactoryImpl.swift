//
//  RepositoryModuleFactoryImpl.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

extension ModuleFactoryImpl: RepositoryModuleFactory {
    
    func makeListCategoryRepo() -> ListCategoryRepository {
        return ListCategoryRepositoryImpl(sourceAPI: makeSourceAPI())
    }
    
    func makeListArticlesRepo() -> ListArticleRepository {
        return ListArticleRepositoryImpl(headlineAPI: makeHeadlineAPI())
    }
}
