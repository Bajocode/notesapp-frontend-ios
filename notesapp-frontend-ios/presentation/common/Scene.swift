//
//  Scene.swift
//  notesapp-frontend-ios
//
//  Created by Fabijan Bajo on 28/05/2019.
//  Copyright © 2019 Fabijan Bajo. All rights reserved.
//

import UIKit

protocol Scene {
    func builtViewController() -> UIViewController
}

enum SceneTransitionType {
    case entry
    case push
    case modal(UIModalTransitionStyle)
}
