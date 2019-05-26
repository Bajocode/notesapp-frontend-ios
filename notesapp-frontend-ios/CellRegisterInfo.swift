//
//  CellRegisterInfo.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import Foundation

struct CellRegisterInfo {
    let cellClass: AnyClass
    let reuseId: String
    let isXib: Bool

    init(cellClass: AnyClass, isXib: Bool) {
        self.cellClass = cellClass
        self.isXib = isXib
        self.reuseId = String(describing: cellClass)
    }
}
