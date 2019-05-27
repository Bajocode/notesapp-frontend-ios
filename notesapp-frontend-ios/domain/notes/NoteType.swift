//
//  Note.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

protocol NoteType {
    var id: String { get }
    var title: String { get }
    var body: String { get }
}
