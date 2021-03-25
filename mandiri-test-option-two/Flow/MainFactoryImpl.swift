//
//  MainFactoryImpl.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

extension ModuleFactoryImpl: MainFactory {
    
    func makeListCategoryView() -> ListCategoryView {
        let vc = ListCategoryVC()
        vc.viewModel = makeListCategoryVM()
        return vc
    }
    
    func makeListSourceView() -> ListSourceView {
        let vc = ListSourceVC()
        vc.viewModel = makeListSourceVM()
        return vc
    }
    
    func makeListArticleView() -> ListArticleView {
        let vc = ListArticleVC()
        vc.viewModel = makeListArticleVM()
        return vc
    }
    
    func makeArticleView() -> ArticleView {
        return ArticleVC()
    }
    
}
