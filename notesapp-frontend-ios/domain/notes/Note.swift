//
//  Note.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

struct Note: NoteType {
    let id: String
    let title: String
    let body: String
}

extension Note: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id, title, body
    }

    init(from decoder: Decoder) throws {
        let dto = try decoder.container(keyedBy: CodingKeys.self)
        id = try dto.decode(String.self, forKey: .id)
        title = try dto.decode(String.self, forKey: .title)
        body = try dto.decode(String.self, forKey: .body)
    }
}
