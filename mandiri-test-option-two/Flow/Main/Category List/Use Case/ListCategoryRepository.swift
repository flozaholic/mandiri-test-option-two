//
//  ListCategoryRepository.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import RxSwift

protocol ListCategoryRepository {
    func requestSource() -> Single<([SourceResponseDetail], [String])>
}
