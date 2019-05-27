//
//  ViewModelBindable.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift

protocol ViewModelBindable {
    associatedtype ViewModelType

    func bind(to viewModel: ViewModelType)
}
