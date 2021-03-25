//
//  ListArticleRepository.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import RxSwift

protocol ListArticleRepository {
    func requestArticle(keyword: String?, sources: String) -> Single<[HeadlineResponseDetail]>
}
