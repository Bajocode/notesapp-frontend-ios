//
//  SceneCoordinator.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 28/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

final class SceneCoordinator {
    private let window: UIWindow
    private var currentViewController: UIViewController!

    init(window: UIWindow) {
        self.window = window
    }

    func transition(to scene: SceneType,
                    transitionType: SceneTransitionType,
                    injector: Injector) {
        let viewController = injector.inject(scene)

        switch transitionType {
        case .entry: handleEntryTransition(for: viewController)
        case .push: handlePushTransition(for: viewController)
        case .modal: handleModalTransition(for: viewController)
        }
    }

    private func handleEntryTransition(for viewController: UIViewController) {
        currentViewController = viewController as? UINavigationController
        window.rootViewController = viewController

        self.window.makeKeyAndVisible()
    }

    private func handlePushTransition(for viewController: UIViewController) {
        (currentViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
    }

    private func handleModalTransition(for viewController: UIViewController) {
        currentViewController.present(viewController, animated: true, completion: nil)
    }
}
