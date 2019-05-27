//
//  NotesViewModel.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift

struct NotesViewModel {}

extension NotesViewModel: ReactiveTransforming {
    struct Input {

    }
    struct Output {

    }

    func transform(input: Input) -> Output {
        return Output()
    }
}

extension NotesViewModel: TableViewDecoratable {
    var cellConfigs: [CellConfig] {
        let config = CellConfig(cellClass: NoteTableViewCell.self, isNib: false)

        return [config]
    }
}
