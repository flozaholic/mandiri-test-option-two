//
//  ListArticleView.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

protocol ListArticleView: BaseView {
    var viewModel: ListArticleVM! { get set }
    var model: String! { get set }
    var onArticleTapped: ((WebviewResourceType) -> Void)? { get set }
}
