//
//  Coordinator.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 28/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

final class Coordinator: SceneCoordinatorType {
    private let window: UIWindow
    private var currentViewController = UIViewController()

    init(window: UIWindow) {
        self.window = window
    }

    func transition(to scene: Scene, transitionType: SceneTransitionType) {
        let viewController = scene.builtViewController()

        switch transitionType {
        case .entry:
            currentViewController = viewController
                .extractFromNav()
            window.rootViewController = viewController
            currentViewController = viewController

            self.window.makeKeyAndVisible()
        case .push:
            guard let nav = currentViewController.navigationController else {
                fatalError("Can't push a view controller without a current navigation controller")
            }

            nav.pushViewController(viewController, animated: true)

            currentViewController = viewController.extractFromNav()
        default: break
        }
    }

    func revert(animated: Bool) {}
}
