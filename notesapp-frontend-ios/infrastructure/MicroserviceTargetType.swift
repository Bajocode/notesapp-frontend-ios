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
    associatedtype ResponseType: Decodable

    var domainName: String { get }
}

extension MicroserviceTargetType {
    private var baseUrlString: String {
        switch MicroserviceClient.environment {
        case .staging,
             .production: return "http://\(domainName).bajo-k8s.online:30001"
        }
    }

    var baseURL: URL {
        guard let baseUrl = URL(string: baseUrlString) else {
            fatalError("base URL could not be formed with string: \(baseUrlString)")
        }

        return baseUrl
    }

    var sampleData: Data {
        return Data()
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
