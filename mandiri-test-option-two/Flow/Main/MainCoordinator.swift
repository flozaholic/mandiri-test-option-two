//
//  MainCoordinator.swift
//  mandiri-online-test
//
//  Created by Hedy on 21/09/20.
//

import Foundation

class MainCoordinator: BaseCoordinator, MainCoordinatorOutput {
    
    private let router: Router
    private let factory: MainFactory
    
    init(router: Router, factory: MainFactory) {
        self.router = router
        self.factory = factory
    }
    
    override func start() {
        self.showList()
    }
    
    private func showList() {
        let view = factory.makeListCategoryView()
        view.onCategoryTapped = { [weak self] (sources) in
            guard let self = self else { return }
            self.showDetail(sources: sources)
        }
        router.setRootModule(view, hideBar: false, animation: .bottomUp)
    }
    
    private func showDetail(sources: [SourceResponseDetail]) {
        let view = factory.makeListSourceView()
        view.model = sources
        view.onSourceTapped = { [weak self] (sourceId) in
            guard let self = self else { return }
            self.showArticles(sourceId: sourceId)
        }
        router.push(view)
    }
    
    private func showArticles(sourceId: String) {
        let view = factory.makeListArticleView()
        view.model = sourceId
        view.onArticleTapped = { [weak self] (url) in
            guard let self = self else { return }
            self.showArticle(url: url)
        }
        router.push(view)
    }
    
    private func showArticle(url: WebviewResourceType) {
        let view = factory.makeArticleView()
        view.model = url
        router.present(view, animated: true, mode: .basic, isWrapNavigation: true)
    }
}
