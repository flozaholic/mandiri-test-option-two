//
//  MainFactory.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

protocol MainFactory {
    func makeListCategoryView() -> ListCategoryView
    func makeListSourceView() -> ListSourceView
    func makeListArticleView() -> ListArticleView
    func makeArticleView() -> ArticleView
}
