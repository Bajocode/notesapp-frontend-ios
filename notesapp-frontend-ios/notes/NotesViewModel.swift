//
//  NotesViewModel.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

struct NoteViewModel {}

extension NoteViewModel: ReactiveTransforming {
    func transform(input: Note) -> Note {
        return Note(id: "", name: "")
    }
}
