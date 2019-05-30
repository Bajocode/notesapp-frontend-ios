//
//  DependencyContainer.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 28/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

protocol MicroServiceClientInjectable {
    var microserviceClient: MicroserviceClient { get }
}

protocol SceneCoordinatorInjectable {
    var coordinator: SceneCoordinator { get }
}

struct DependencyContainer: MicroServiceClientInjectable, SceneCoordinatorInjectable {
    let microserviceClient: MicroserviceClient
    let coordinator: SceneCoordinator

    init(microserviceClient: MicroserviceClient, coordinator: SceneCoordinator) {
        self.microserviceClient = microserviceClient
        self.coordinator = coordinator
    }
}
