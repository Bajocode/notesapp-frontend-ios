//
//  UITableView+.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 26/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

extension UITableView {
    convenience init(decorator: TableViewDecoratable,
                     frame: CGRect,
                     dataSource: UITableViewDataSource? = nil,
                     delegate: UITableViewDelegate? = nil) {
        self.init(frame: frame, style: decorator.isStylePlain ? .plain : .grouped)

        decorator.cellConfigs.forEach { registerCell(with: $0) }

        rowHeight = decorator.rowHeight
        sectionHeaderHeight = decorator.sectionHeaderHeight ?? sectionFooterHeight
        sectionFooterHeight = decorator.sectionFooterHeight ?? sectionFooterHeight
        self.dataSource = dataSource
        self.delegate = delegate
    }

    private func registerCell(with config: CellConfig) {
        if config.isNib {
            let nib = UINib(nibName: config.cellId, bundle: nil)

            register(nib, forCellReuseIdentifier: config.cellId)
        } else {
            register(config.cellClass, forCellReuseIdentifier: config.cellId)
        }
    }
}
