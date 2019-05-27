//
//  TableViewConfigurable.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

protocol TableCellDecoratable {
    var rowHeight: CGFloat { get }
    var cellConfigs: [CellConfig] { get }
}

protocol TableHeaderFooterDecoratable {
    var sectionHeaderHeight: CGFloat? { get }
    var sectionFooterHeight: CGFloat? { get }
}

protocol TableViewDecoratable: TableCellDecoratable & TableHeaderFooterDecoratable {
    var isStylePlain: Bool { get }
}

extension TableViewDecoratable {
    var rowHeight: CGFloat { return 44.0 }
    var sectionHeaderHeight: CGFloat? { return nil }
    var sectionFooterHeight: CGFloat? { return nil }
    var isStylePlain: Bool { return true }
}
