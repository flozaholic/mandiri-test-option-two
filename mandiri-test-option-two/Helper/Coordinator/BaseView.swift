//
//  BaseView.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation

protocol BaseView: NSObjectProtocol, Presentable, Bindable { }
protocol Bindable {
    func bindViewModel()
}
