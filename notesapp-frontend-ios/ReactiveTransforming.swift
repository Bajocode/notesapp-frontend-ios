//
//  ReactiveTransforming.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

protocol ReactiveTransforming {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
