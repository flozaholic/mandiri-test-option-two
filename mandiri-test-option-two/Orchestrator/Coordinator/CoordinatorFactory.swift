//
//  CoordinatorFactory.swift
//  mandiri-test-option-two
//
//  Created by Admin on 24/3/21.
//

import Foundation
import UIKit

protocol CoordinatorFactory {
    // MARK: - Main
    func makeMainCoordinator(router: Router) -> Coordinator & MainCoordinatorOutput
}
