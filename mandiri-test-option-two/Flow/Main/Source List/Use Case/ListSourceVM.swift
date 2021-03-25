//
//  ListSourceVM.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import RxSwift
import RxCocoa

class ListSourceVM: BaseViewModel {
    
    private let disposeBag = DisposeBag()
    private let sourcesRelay = BehaviorRelay<[SourceResponseDetail]>(value: [])
    
    private var sourceResponse = [SourceResponseDetail]()
    
    struct Input {
        let initialData: Observable<[SourceResponseDetail]>
        let keyword: Observable<String>
    }
    
    struct Output {
        let sources: Driver<[SourceResponseDetail]>
    }
    
    func transform(_ input: Input) -> Output {
        self.makePersistInitialData(input)
        self.makeSearchSources(input)
        return Output(sources: self.sourcesRelay.asDriver().skip(1))
    }
    
    private func makePersistInitialData(_ input: Input) {
        input
            .initialData
            .subscribe(onNext: { (data) in
                self.sourceResponse = data
                self.sourcesRelay.accept(data)
            }).disposed(by: self.disposeBag)
    }
    
    private func makeSearchSources(_ input: Input) {
        input
            .keyword
            .debounce(.milliseconds(300), scheduler: ScheduleProvider.shared.main)
            .subscribe(onNext: { (keyword) in
                if keyword.count > 2 {
                    self.searchSources(keyword: keyword)
                } else {
                    self.sourcesRelay.accept(self.sourceResponse)
                }
            }).disposed(by: self.disposeBag)
    }
    
    private func searchSources(keyword: String) {
        let sourcesFiltered = self.sourceResponse.filter { (source) in
            if let name = source.name {
                let filter = NSPredicate(format: "%@ CONTAINS[c] %@", name, keyword)
                return filter.evaluate(with: nil)
            }
            return false
        }
        self.sourcesRelay.accept(sourcesFiltered)
    }
}
