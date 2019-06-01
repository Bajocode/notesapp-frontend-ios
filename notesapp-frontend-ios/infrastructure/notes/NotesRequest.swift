//
//  NoteRequest.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Moya

enum NotesRequest {
    struct Get: NotesTargetType {
        typealias ResponseType = [Note]

        var path: String {
            return "/\(domainName)"
        }

        var method: Method {
            return .get
        }

        var task: Task {
            return .requestPlain
        }
    }

    struct Post: NotesTargetType {
        typealias ResponseType = Note
        private let noteDto: NoteDto

        init(noteDto: NoteDto) {
            self.noteDto = noteDto
        }

        var path: String {
            return "/\(domainName)"
        }

        var method: Method {
            return .post
        }

        var task: Task {
            return .requestJSONEncodable(noteDto)
        }
    }

    struct Put: NotesTargetType {
        typealias ResponseType = Note
        private let noteDto: NoteDto

        init(noteDto: NoteDto) {
            self.noteDto = noteDto
        }

        var path: String {
            return "/\(domainName)/\(noteDto.id)"
        }

        var method: Method {
            return .put
        }

        var task: Task {
            return .requestJSONEncodable(noteDto)
        }
    }

    struct Delete: NotesTargetType {
        typealias ResponseType = Note
        private let id: String

        init(id: String) {
            self.id = id
        }

        var path: String {
            return "/\(domainName)/\(id)"
        }

        var method: Method {
            return .delete
        }

        var task: Task {
            return .requestPlain
        }
    }
}
