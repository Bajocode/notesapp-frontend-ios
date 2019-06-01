//
//  Injector.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 29/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

final class Injector {
    let dependencyContainer: DependencyContainer

    init(dependencyContainer: DependencyContainer) {
        self.dependencyContainer = dependencyContainer
    }

    func inject(_ scene: SceneType) -> UIViewController {
        switch scene {
        case .notes:
            return notesScene()
        case .noteUpdate(let updatingNote):
            return noteUpdateScene(updatingNote: updatingNote)
        case .noteCreate:
            return noteCreateScene()
        }
    }
}
