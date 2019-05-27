//
//  NotesViewModel.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift
import RxCocoa

struct NotesViewModel {}

extension NotesViewModel: ReactiveTransforming {
    struct Input {
        let cellSelection: Driver<IndexPath>
    }
    struct Output {
        let generateColor: Driver<UIColor>
    }

    func transform(input: Input) -> Output {
        let generateColor = input
            .cellSelection
            .map { _ in UIColor.blue }

        return Output(generateColor: generateColor)
    }
}

extension NotesViewModel: TableViewDecoratable {
    var cellConfigs: [CellConfig] {
        let config = CellConfig(cellClass: NoteTableViewCell.self, isNib: false)

        return [config]
    }

//    var isStylePlain: Bool {
//        return false
//    }
}
