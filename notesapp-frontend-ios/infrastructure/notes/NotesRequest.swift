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
        private let requestBody: NoteDto

        init(requestBody: NoteDto) {
            self.requestBody = requestBody
        }

        var path: String {
            return "/\(domainName)"
        }

        var method: Method {
            return .post
        }

        var task: Task {
            return .requestJSONEncodable(requestBody)
        }
    }
}
