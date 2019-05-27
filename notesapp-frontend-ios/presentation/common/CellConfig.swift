//
//  CellRegisterInfo.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

struct CellConfig {
    let cellId: String
    let cellClass: AnyClass
    let isNib: Bool

    init(cellClass: AnyClass, isNib: Bool) {
        self.cellId = String(describing: cellClass)
        self.cellClass = cellClass
        self.isNib = isNib
    }
}
