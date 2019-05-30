//
//  NoteFactory.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

struct NoteFactory {
    static func appObject(from title: String, body: String) -> Note {
        return Note(title: title, body: body)
    }

    static func userInterfaceObject(from note: Note) -> NoteUio {
        return NoteUio(id: note.id, title: note.title, body: note.body)
    }

    static func dataTransferObject(from note: Note) -> NoteDto {
        return NoteDto(id: note.id, title: note.title, body: note.body)
    }
}
