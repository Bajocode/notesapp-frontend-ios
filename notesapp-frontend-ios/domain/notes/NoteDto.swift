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
}

extension NoteDto: Codable {
    private enum CodingKeys: String, CodingKey {
        case id, title
    }

    init(from decoder: Decoder) throws {
        let dto = try decoder.container(keyedBy: CodingKeys.self)
        id = try dto.decode(String.self, forKey: .id)
        title = try dto.decode(String.self, forKey: .title)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
    }
}
