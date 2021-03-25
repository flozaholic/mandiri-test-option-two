//
//  ListSourceVC.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import UIKit
import RxSwift
import RxCocoa
import JGProgressHUD

class ListSourceVC: UIViewController, ListSourceView {
    
    var viewModel: ListSourceVM!
    var model: [SourceResponseDetail]! {
        didSet {
            self.modelRelay.accept(self.model)
        }
    }
    var onSourceTapped: ((String) -> Void)?
    
    private var sources = [SourceResponseDetail]()
    
    private let hud = JGProgressHUD(style: .dark)
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private let modelRelay = BehaviorRelay<[SourceResponseDetail]>(value: [])
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.setupNavigation()
    }
    
    private func setupNavigation() {
        self.setupTitleForNavigation(title: "News Sources")
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func setupUI() {
        self.setupLoading()
        self.setupTableView()
    }
    
    private func setupLoading() {
        hud.vibrancyEnabled = true
        hud.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        hud.textLabel.text = "Loading"
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func bindViewModel() {
        let input = ListSourceVM.Input(initialData: self.modelRelay.asObservable(),
                                       keyword: self.searchBar.rx.text.orEmpty.asObservable())
        let output = self.viewModel.transform(input)
        output.sources.drive { (responses) in
            self.sources = responses
            self.tableView.reloadData()
        }.disposed(by: self.disposeBag)
    }

}

extension ListSourceVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let target = self.sources[indexPath.row]
        cell.textLabel?.text = target.name
        cell.textLabel?.textColor = .greenText
        cell.detailTextLabel?.text = target.description
        return cell
    }
}

extension ListSourceVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeMoveUpWithFade(rowHeight: cell.frame.height, duration: 0.5, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let target = self.sources[indexPath.row]
        guard let sourceId = target.id else { return }
        self.onSourceTapped?(sourceId)
    }
}
