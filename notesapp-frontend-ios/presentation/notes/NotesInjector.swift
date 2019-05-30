//
//  NotesInjector.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 29/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

extension Injector {
    func notesScene() -> UIViewController {
        let viewModel = NotesViewModel(dependencies: dependencyContainer, injector: self)
        let viewController = NotesViewController(viewModel: viewModel)

        return viewController.embedInNav()
    }

    func noteUpdateScene(updatingNote: Note) -> UIViewController {
        let viewModel = NoteViewModel(dependencies: dependencyContainer,
                                      injector: self,
                                      updatingNote: updatingNote)
        let viewController = NoteViewController(viewModel: viewModel)

        return viewController
    }
}
