//
//  RootWireframe .swift
//  VIPERDemo
//
//  Created by Yahia MacBookPro on 4/3/19.
//  Copyright © 2019 Yahia Mosaad. All rights reserved.
//

import UIKit

class RootWireframe {
    var usersWireframe: UsersWireframe!
    func rootNavigationController() -> UINavigationController {
        if usersWireframe == nil {
            usersWireframe = UsersWireframe()
        }
        return usersWireframe.moduleNavigationController
    }
}
