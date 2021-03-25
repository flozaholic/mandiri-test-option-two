//
//  MainFactory.swift
//  mandiri-online-test
//
//  Created by Hedy on 21/09/20.
//

import Foundation

protocol MainFactory {
    func makeListCategoryView() -> ListCategoryView
    func makeListSourceView() -> ListSourceView
    func makeListArticleView() -> ListArticleView
    func makeArticleView() -> ArticleView
}
