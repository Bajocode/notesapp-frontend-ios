//
//  ViewModelType.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 30/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

protocol ViewModelType: ReactiveTransforming {
    associatedtype Dependencies
}
