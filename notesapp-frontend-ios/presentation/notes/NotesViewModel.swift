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
        let cellSelection: Driver<IndexPath>
    }
    struct Output {
        let presentableNotes: Driver<[NoteUio]>
        let transitionToUpdateNote: Driver<Note>
    }

    func transform(input: Input) -> Output {
        let notes = input.viewWillAppear
            .flatMapLatest {
                return self.dependencies
                    .microserviceClient
                    .execute(NotesRequest.Get())
                    .asDriver(onErrorJustReturn: [])
            }
        let presentableNotes = notes
            .map { $0.map { NoteFactory.userInterfaceObject(from: $0) } }
        let transitionToUpdateNote = input
            .cellSelection
            .withLatestFrom(notes) { (indexPath, notes) -> Note in
                return notes[indexPath.row] }
            .do(onNext: {
                self.dependencies
                    .coordinator
                    .transition(to: .noteUpdate(note: $0),
                                transitionType: .push,
                                injector: self.injector)
            })

        return Output(presentableNotes: presentableNotes,
                      transitionToUpdateNote: transitionToUpdateNote)
    }
}

extension NotesViewModel: TableViewDecoratable {
    var cellConfigs: [CellConfig] {
        let config = CellConfig(cellClass: NoteTableViewCell.self,
                                isNib: false)

        return [config]
    }
}
