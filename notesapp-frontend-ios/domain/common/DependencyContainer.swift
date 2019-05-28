//
//  DependencyContainer.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 28/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

protocol CoordinatorDepending {
    var coordinator: Coordinator { get }
}

struct DependencyContainer: CoordinatorDepending {
    let coordinator: Coordinator

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
