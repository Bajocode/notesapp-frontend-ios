//
//  MicroserviceTargetType.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation
import Moya

protocol MicroserviceTargetType: TargetType {
    associatedtype ResponseType: Codable
}

extension MicroserviceTargetType {
    private var fqdn: String {
        return ""
    }
}
