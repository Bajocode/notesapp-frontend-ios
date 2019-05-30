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
    private let provider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(verbose: true)])

    func execute<T: MicroserviceTargetType>(_ request: T) -> Single<T.ResponseType> {
        return provider
            .rx
            .request(MultiTarget(request))
            .map(T.ResponseType.self)
    }
}
