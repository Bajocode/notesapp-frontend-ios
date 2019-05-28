//
//  NotesViewModel.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift
import RxCocoa

struct NotesViewModel {
    typealias Dependencies = CoordinatorDepending

    let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}

extension NotesViewModel: ReactiveTransforming {
    struct Input {
        let viewWillAppear: Driver<Void>
        let cellSelection: Driver<IndexPath>
    }
    struct Output {
        let presentableNotes: Driver<[NoteUio]>
    }

    func transform(input: Input) -> Output {
        let notes = input.viewWillAppear
            .flatMapLatest {
                return MicroserviceClient
                    .execute(NotesRequest.Get())
                    .asDriver(onErrorJustReturn: [])
            }
        let presentableNotes = notes
            .map { $0.map { NoteFactory.userInterfaceObject(from: $0) } }

        return Output(presentableNotes: presentableNotes)
    }
}

extension NotesViewModel: TableViewDecoratable {
    var cellConfigs: [CellConfig] {
        let config = CellConfig(cellClass: NoteTableViewCell.self, isNib: false)

        return [config]
    }
}
