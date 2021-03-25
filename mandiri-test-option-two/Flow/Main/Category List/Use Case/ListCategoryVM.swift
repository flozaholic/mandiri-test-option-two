//
//  ListCategoryVM.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import RxSwift
import RxCocoa

class ListCategoryVM: BaseViewModel {
    
    private let repository: ListCategoryRepository
    private let disposeBag = DisposeBag()
    private let categoriesRelay = BehaviorRelay<[String]>(value: [])
    private let sourcesRelay = BehaviorRelay<[SourceResponseDetail]>(value: [])
    private let stateRelay = BehaviorRelay<BasicUIState>(value: .loading)
    
    private var sourceResponse = [SourceResponseDetail]()
    
    struct Input {
        let viewDidLoadRelay: Observable<Void>
        let categoryTapped: Observable<String?>
    }
    
    struct Output {
        let categories: Driver<[String]>
        let selectedSources: Driver<[SourceResponseDetail]>
        let state: Driver<BasicUIState>
    }
    
    init(repository: ListCategoryRepository) {
        self.repository = repository
    }
    
    func transform(_ input: Input) -> Output {
        self.makeRequestCategories(input)
        self.makeFilterSources(input)
        return Output(categories: self.categoriesRelay.asDriver().skip(1),
                      selectedSources: self.sourcesRelay.asDriver().skip(1),
                      state: self.stateRelay.asDriver().skip(1))
    }
    
    private func makeRequestCategories(_ input: Input) {
        input
            .viewDidLoadRelay
            .subscribe { (_) in
                self.stateRelay.accept(.loading)
                self.requestCategories()
            }.disposed(by: self.disposeBag)
    }
    
    private func requestCategories() {
        self.repository
            .requestSource()
            .subscribe { (result) in
                self.stateRelay.accept(.close)
                self.categoriesRelay.accept(result.1)
                self.sourceResponse = result.0
            } onError: { (error) in
                self.stateRelay.accept(.failure(error.readableError))
            }.disposed(by: self.disposeBag)
    }
    
    private func makeFilterSources(_ input: Input) {
        input
            .categoryTapped
            .compactMap { $0 }
            .subscribe { (category) in
                self.filterSources(category: category)
            } onError: { (error) in
                self.stateRelay.accept(.failure(error.readableError))
            }.disposed(by: self.disposeBag)
    }
    
    private func filterSources(category: String) {
        let sourcesFiltered = self.sourceResponse.filter { $0.category == category }
        self.sourcesRelay.accept(sourcesFiltered)
    }
}
