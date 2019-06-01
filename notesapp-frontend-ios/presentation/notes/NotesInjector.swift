//
//  NotesInjector.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 29/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

protocol NotesInjectorType {
    func notesScene() -> UIViewController
    func noteCreateScene() -> UIViewController
    func noteUpdateScene(updatingNote: Note) -> UIViewController
}

extension Injector: NotesInjectorType {
    func notesScene() -> UIViewController {
        let viewModel = NotesViewModel(dependencies: dependencyContainer, injector: self)
        let viewController = NotesViewController(viewModel: viewModel)

        return viewController.embedInNav()
    }

    func noteCreateScene() -> UIViewController {
        let newNote = NoteFactory.empty()
        let viewModel = NoteViewModel(dependencies: dependencyContainer,
                                      injector: self,
                                      presentationMode: .create,
                                      note: newNote)
        let viewController = NoteViewController(viewModel: viewModel)

        return viewController.embedInNav()
    }

    func noteUpdateScene(updatingNote: Note) -> UIViewController {
        let viewModel = NoteViewModel(dependencies: dependencyContainer,
                                      injector: self,
                                      presentationMode: .update,
                                      note: updatingNote)
        let viewController = NoteViewController(viewModel: viewModel)

        return viewController
    }
}
