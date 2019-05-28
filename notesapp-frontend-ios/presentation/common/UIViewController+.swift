//
//  UIViewController+.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 28/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

extension UIViewController {
    func extractFromNav() -> UIViewController {
        if let nav = self as? UINavigationController {
            return nav.viewControllers.first!
        } else {
            return self
        }
    }

    func embedInNav() -> UIViewController {
        return UINavigationController(rootViewController: self)
    }
}
