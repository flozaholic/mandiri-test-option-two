//
//  ListArticleRepositoryImpl.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import RxSwift

class ListArticleRepositoryImpl: ListArticleRepository {
    
    private let headlineAPI: HeadlineAPI
    private let disposeBag = DisposeBag()
    
    init(headlineAPI: HeadlineAPI) {
        self.headlineAPI = headlineAPI
    }
    
    func requestArticle(keyword: String?, sources: String) -> Single<[HeadlineResponseDetail]> {
        return Single.create { (observer) in
            let body = HeadlineBody(q: keyword, sources: sources)
            
            self.headlineAPI
                .request(parameters: body.dictionary ?? [String: Any]())
                .map { self.outputTransformModel($0) }
                .subscribe { (result) in
                    switch result {
                    case .success(let model):
                        observer(.success(model))
                    case .failure(let error):
                        observer(.error(error))
                    }
                } onError: { (error) in
                    observer(.error(error))
                }.disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
    
    private func outputTransformModel(_ response: HeadlineResponse) -> Result<[HeadlineResponseDetail], HTTPError> {
        if let status = response.status {
            if status == "ok" {
                return .success(response.articles)
            }
            return .failure(HTTPError.custom(response.message ?? "Internal Server Error!"))
        }
        return .failure(HTTPError.internalError)
    }
}
