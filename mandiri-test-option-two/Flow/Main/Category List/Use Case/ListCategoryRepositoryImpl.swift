//
//  ListCategoryRepositoryImpl.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import RxSwift

class ListCategoryRepositoryImpl: ListCategoryRepository {
    
    private let sourceAPI: SourceAPI
    private let disposeBag = DisposeBag()
    
    init(sourceAPI: SourceAPI) {
        self.sourceAPI = sourceAPI
    }
    
    func requestSource() -> Single<([SourceResponseDetail], [String])> {
        return Single.create { (observer) in
            let body = SourceBody()
            
            self.sourceAPI
                .request(parameters: body.dictionary ?? [String: Any]())
                .map { self.outputTransformModel($0) }
                .subscribe { (result) in
                    switch result {
                    case .success(let model):
                        let categories = self.extractUniqueCategory(responses: model)
                        let result = (model, categories)
                        observer(.success(result))
                    case .failure(let error):
                        observer(.error(error))
                    }
                } onError: { (error) in
                    observer(.error(error))
                }.disposed(by: self.disposeBag)
            
            return Disposables.create()
        }
    }
    
    private func outputTransformModel(_ response: SourceResponse) -> Result<[SourceResponseDetail], HTTPError> {
        if let status = response.status {
            if status == "ok" {
                return .success(response.sources)
            }
            return .failure(HTTPError.custom(response.message ?? "Internal Server Error!"))
        }
        return .failure(HTTPError.internalError)
    }
    
    private func extractUniqueCategory(responses: [SourceResponseDetail]) -> [String] {
        let categories = responses.map { $0.category }.compactMap { $0 }
        let uniqueness = Array(Set(categories)).sorted()
        return uniqueness
    }
}
