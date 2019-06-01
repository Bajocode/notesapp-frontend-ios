//
//  NoteCreateViewModel.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 30/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift
import RxCocoa

struct NoteViewModel: ViewModelType {
    typealias Dependencies = MicroServiceClientInjectable

    private let dependencies: Dependencies
    private let injector: Injector
    private let presentationMode: PresentationMode
    private let note: Note

    init(dependencies: Dependencies,
         injector: Injector,
         presentationMode: PresentationMode,
         note: Note) {
        self.dependencies = dependencies
        self.injector = injector
        self.presentationMode = presentationMode
        self.note = note
    }
}

extension NoteViewModel {
    enum PresentationMode {
        case create, update
    }
}

extension NoteViewModel: ReactiveTransforming {
    struct Input {
        let doneButtonTap: Driver<Void>
        let deleteButtonTap: Driver<Void>
        let titleTextFieldText: Driver<String>
        let bodyTextFieldText: Driver<String>
    }

    struct Output {
        let initialNoteUio: Driver<NoteUio>
        let noteCreation: Driver<Void>
        let noteDeletion: Driver<Void>
    }

    func transform(input: Input) -> Output {
        let initialNoteUio = Driver.just(NoteFactory.userInterfaceObject(from: self.note))

        return NoteViewModel.Output(initialNoteUio: initialNoteUio,
                                    noteCreation: noteCreationOutput(from: input),
                                    noteDeletion: noteDeletionOutput(from: input))
    }

    private func noteDeletionOutput(from input: Input) -> Driver<Void> {
        return input.deleteButtonTap
            .flatMapLatest {
                return self.dependencies
                    .microserviceClient
                    .execute(NotesRequest.Delete(id: self.note.id))
                    .map { _ in }
                    .asDriver(onErrorJustReturn: ())
        }
    }

    private func noteCreationOutput(from input: Input) -> Driver<Void> {
        return input.doneButtonTap
            .withLatestFrom(extractNoteDtoFromUi(with: input))
            .flatMapLatest { return self.request(dto: $0) }
    }

    private func extractNoteDtoFromUi(with input: Input) -> Driver<NoteDto> {
        return Driver.combineLatest(input.titleTextFieldText, input.bodyTextFieldText)
            .map { NoteFactory.appObject(from: self.note.id, title: $0.0, body: $0.1) }
            .map { NoteFactory.dataTransferObject(from: $0) }
    }

    private func request(dto: NoteDto) -> Driver<Void> {
        if presentationMode == .create {
            return self.dependencies.microserviceClient
                .execute(NotesRequest.Post(noteDto: dto))
                .map { _ in }
                .asDriver(onErrorJustReturn: ())
        } else {
            return self.dependencies.microserviceClient
                .execute(NotesRequest.Put(noteDto: dto))
                .map { _ in }
                .asDriver(onErrorJustReturn: ())
        }
    }
}
