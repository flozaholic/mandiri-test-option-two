//
//  ListArticleVM.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import RxSwift
import RxCocoa

class ListArticleVM: BaseViewModel {
    
    private let repository: ListArticleRepository
    private let disposeBag = DisposeBag()
    private let articlesRelay = BehaviorRelay<[HeadlineResponseDetail]>(value: [])
    private let stateRelay = BehaviorRelay<BasicUIState>(value: .loading)
    
    struct Input {
        let searchRelay: Observable<String?>
        let sourceRelay: Observable<String?>
    }
    
    struct Output {
        let articles: Driver<[HeadlineResponseDetail]>
        let state: Driver<BasicUIState>
    }
    
    init(repository: ListArticleRepository) {
        self.repository = repository
    }
    
    func transform(_ input: Input) -> Output {
        self.makeRequestArticles(input)
        return Output(articles: self.articlesRelay.asDriver().skip(1),
                      state: self.stateRelay.asDriver().skip(1))
    }
    
    private func makeRequestArticles(_ input: Input) {
        let combine = Observable.combineLatest(input.searchRelay, input.sourceRelay).debug()
        
        combine
            .debounce(.milliseconds(300), scheduler: ScheduleProvider.shared.main)
            .subscribe(onNext: { (param) in
                guard let sources = param.1 else { return }
                self.stateRelay.accept(.loading)
                self.requestArticles(keyword: param.0, sources: sources)
            }).disposed(by: self.disposeBag)
    }
    
    private func requestArticles(keyword: String?, sources: String) {
        self.repository
            .requestArticle(keyword: keyword, sources: sources)
            .subscribe { (result) in
                self.stateRelay.accept(.close)
                self.articlesRelay.accept(result)
            } onError: { (error) in
                self.stateRelay.accept(.failure(error.readableError))
            }.disposed(by: self.disposeBag)
    }
}
