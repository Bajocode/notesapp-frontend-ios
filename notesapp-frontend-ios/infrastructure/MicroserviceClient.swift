//
//  Microservice.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Moya
import RxSwift

struct MicroserviceClient {
    static let environment: Environment = .staging
    private static let provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])

    static func execute<T: MicroserviceTargetType>(_ endpoint: T) -> Single<T.ResponseType> {
        return provider
            .rx
            .request(MultiTarget(endpoint))
            .map(T.ResponseType.self)
    }
}
