//
//  NotesViewModel.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift
import RxCocoa

struct NotesViewModel: ViewModelType {
    typealias Dependencies = MicroServiceClientInjectable & SceneCoordinatorInjectable

    private let dependencies: Dependencies
    private let injector: Injector

    init(dependencies: Dependencies, injector: Injector) {
        self.dependencies = dependencies
        self.injector = injector
    }
}

extension NotesViewModel: ReactiveTransforming {
    struct Input {
        let viewWillAppear: Driver<Void>
        let createButtonTap: Driver<Void>
        let cellSelection: Driver<IndexPath>
    }
    struct Output {
        let notesUio: Driver<[NoteUio]>
        let transitionToCreateNote: Driver<Void>
        let transitionToUpdateNote: Driver<Note>
    }

    func transform(input: Input) -> Output {
        let notes = notesFetchingOutput(from: input)

        return Output(notesUio: notesUioOutput(from: notes),
                      transitionToCreateNote: transitionToCreateOutput(from: input),
                      transitionToUpdateNote: transitionToUpdateOutput(from: input,
                                                                       notes: notes))
    }

    private func notesUioOutput(from notes: Driver<[Note]>) -> Driver<[NoteUio]> {
        return notes.map { $0.map { NoteFactory.userInterfaceObject(from: $0) } }
    }

    private func notesFetchingOutput(from input: Input) -> Driver<[Note]> {
        return input.viewWillAppear
            .flatMapLatest {
                return self.dependencies.microserviceClient
                    .execute(NotesRequest.Get())
                    .asDriver(onErrorJustReturn: [])}
    }

    private func transitionToCreateOutput(from input: Input) -> Driver<Void> {
        return input.createButtonTap
            .do(onNext: {
                self.dependencies.coordinator
                    .transition(to: .noteCreate,
                                transitionType: .modal,
                                injector: self.injector)})
    }

    private func transitionToUpdateOutput(from input: Input,
                                          notes: Driver<[Note]>) -> Driver<Note> {
        return input.cellSelection
            .withLatestFrom(notes) { (indexPath, notes) -> Note in
                return notes[indexPath.row] }
            .do(onNext: {
                self.dependencies.coordinator
                    .transition(to: .noteUpdate(note: $0),
                                transitionType: .push,
                                injector: self.injector)})
    }
}

extension NotesViewModel: TableViewDecoratable {
    var cellConfigs: [CellConfig] {
        let config = CellConfig(cellClass: NoteTableViewCell.self,
                                isNib: false)

        return [config]
    }
}
