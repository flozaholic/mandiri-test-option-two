//
//  VMModuleFactoryImpl.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

extension ModuleFactoryImpl: VMModuleFactory {
    
    func makeListCategoryVM() -> ListCategoryVM {
        return ListCategoryVM(repository: makeListCategoryRepo())
    }
    
    func makeListSourceVM() -> ListSourceVM {
        return ListSourceVM()
    }
    
    func makeListArticleVM() -> ListArticleVM {
        return ListArticleVM(repository: makeListArticlesRepo())
    }
    
}
