//
//  NoteFactory.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

struct NoteFactory {
    static func generatePresentableNote(with note: Note) -> PresentableNote {
        return PresentableNote(id: note.id, title: note.title)
    }
}
