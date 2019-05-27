//
//  NoteFactory.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

struct NoteFactory {
    static func generatePresentableNote(with note: Note) -> NoteUio {
        return NoteUio(id: note.id, title: note.title)
    }

    static func generateTransferrableNote(with note: Note) -> NoteDto {
        return NoteDto(id: note.id, title: note.title)
    }
}
