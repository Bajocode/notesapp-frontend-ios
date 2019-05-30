//
//  PresentableNote.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

struct NoteDto: NoteType {
    let id: String
    let title: String
    let body: String
}

extension NoteDto: Encodable {
    private enum CodingKeys: String, CodingKey {
        case title, body
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(body, forKey: .body)
    }
}
