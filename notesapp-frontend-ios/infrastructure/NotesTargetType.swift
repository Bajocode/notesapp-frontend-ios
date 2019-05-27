//
//  NotesTargetType.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

protocol NotesTargeType: MicroserviceTargetType {}

extension NotesTargeType {
    var subDomain: String {
        return "notes"
    }
}
