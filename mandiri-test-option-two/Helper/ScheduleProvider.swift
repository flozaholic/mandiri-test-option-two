//
//  ScheduleProvider.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import RxSwift

class ScheduleProvider {
    
    static let shared: ScheduleProvider = ScheduleProvider()
    
    public let main = MainScheduler.instance
    public let background = ConcurrentDispatchQueueScheduler(qos: DispatchQoS.background)
}
