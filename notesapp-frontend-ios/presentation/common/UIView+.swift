//
//  UIView+.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

extension UIView {
    static var id: String {
        return String(describing: self)
    }

    func constrainAllEdgesToSuperView(insets: UIEdgeInsets = .zero) {
        guard let superView = self.superview else {
            return
        }

        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -insets.right).isActive = true
        topAnchor.constraint(equalTo: superView.topAnchor, constant: insets.top).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: insets.bottom).isActive = true
    }
}
