//
//  NotesCoordinator.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 27/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import RxSwift

enum NotesScene: Scene {
    case notes(NotesViewModel)
    case noteCreate
    case noteUpdate
}

extension NotesScene {
    func builtViewController() -> UIViewController {
        switch self {
        case .notes(let viewModel):
            return buildNotesScene(viewModel: viewModel)
        default: return UIViewController()
        }
    }

    func buildNotesScene(viewModel: NotesViewModel) -> UIViewController {
        let viewController = NotesViewController(viewModel: viewModel)
        let nav = UINavigationController(rootViewController: viewController)

        return nav
    }
}

final class NotesCoordinator: SceneCoordinatorType {
    private let window: UIWindow
    private var currentViewController: UIViewController

    init(window: UIWindow) {
        self.window = window

        guard let viewController = window.rootViewController else {
            fatalError("The window has no rootViewController")
        }

        currentViewController = viewController
    }

    func transition(to scene: Scene, transitionType: SceneTransitionType) {
        let viewController = scene.builtViewController()

        switch transitionType {
        case .entry:
            currentViewController = viewController
                .extractFromNavigationController()
            window.rootViewController = viewController
        case .push:
            guard let nav = currentViewController.navigationController else {
                fatalError("Can't push a view controller without a current navigation controller")
            }

            nav.pushViewController(viewController, animated: true)

            currentViewController = viewController.extractFromNavigationController()
        default: break
        }
    }

    func revert(animated: Bool) {}
}

protocol Scene {
    func builtViewController() -> UIViewController
}

enum SceneTransitionType {
    case entry
    case push
    case modal(UIModalTransitionStyle)
}

protocol SceneCoordinatorType {
    func transition(to scene: Scene, transitionType: SceneTransitionType)
    func revert(animated: Bool)
}
