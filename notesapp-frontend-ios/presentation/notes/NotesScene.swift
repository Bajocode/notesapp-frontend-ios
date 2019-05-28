//
//  NotesCoordinator.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

enum NotesScene: Scene {
    case notes(NotesViewModel)
    case noteCreate
    case noteUpdate
}

extension NotesScene {
    func builtViewController() -> UIViewController {
        switch self {
        case .notes(let viewModel):
            return buildNotesScene(viewModel: viewModel)
        default: return UIViewController()
        }
    }

    private func buildNotesScene(viewModel: NotesViewModel) -> UIViewController {
        return NotesViewController(viewModel: viewModel)
            .embedInNav()
    }
}
