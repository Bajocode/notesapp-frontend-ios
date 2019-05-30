//
//  NoteViewModel.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 29/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift
import RxCocoa

struct NoteViewModel: ViewModelType {
    typealias Dependencies = MicroServiceClientInjectable

    private let dependencies: Dependencies
    private let injector: Injector
    private let updatingNote: Note

    init(dependencies: Dependencies,
         injector: Injector,
         updatingNote: Note) {
        self.dependencies = dependencies
        self.injector = injector
        self.updatingNote = updatingNote
    }
}

protocol NoteUpdateViewModel: ReactiveTransforming {
    var updatingNote: Note { get }
    
}

extension NoteViewModel: ReactiveTransforming {
    struct Input {
        let doneButtonTap: Driver<Void>
        let deleteButtonTap: Driver<Void>
        let titleTextFieldText: Driver<String>
        let bodyTextFieldText: Driver<String>
    }

    struct Output {
        let noteUio: Driver<NoteUio>
        let noteCreation: Driver<Void>
        let noteDeletion: Driver<Void>
    }

    func transform(input: Input) -> Output {
        let updatingNoteDriver = Driver.just(updatingNote)
        let creatingNoteDriver = Driver.combineLatest(
            input.titleTextFieldText,
            input.bodyTextFieldText)
            .map { NoteFactory.appObject(from: $0.0, body: $0.1) }
        let mergedNoteDriver = Driver.merge(updatingNoteDriver,
                                            creatingNoteDriver)

        return NoteViewModel.Output(noteUio: Driver.empty(),
                                    noteCreation: Driver.empty(),
                                    noteDeletion: Driver.empty())
    }
}
