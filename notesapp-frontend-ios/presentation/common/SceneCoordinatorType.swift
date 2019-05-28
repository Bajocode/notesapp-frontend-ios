//
//  SceneCoordinatorType.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 28/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

protocol SceneCoordinatorType {
    func transition(to scene: Scene, transitionType: SceneTransitionType)
    func revert(animated: Bool)
}
