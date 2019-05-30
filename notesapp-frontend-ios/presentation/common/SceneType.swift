//
//  SceneType.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 29/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

enum SceneType {
    case notes
    case noteUpdate(note: Note)
    case noteCreate
}
