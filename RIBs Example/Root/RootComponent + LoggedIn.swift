//
//  RootComponent + LoggedIn.swift
//  RootComponent + LoggedIn
//
//  Created by Fomagran on 2021/08/19.
//

import RIBs

/// The dependencies needed from the parent scope of Root to provide for the LoggedIn scope.
// TODO: Update RootDependency protocol to inherit this protocol.
protocol RootDependencyLoggedIn: Dependency {

    // TODO: Declare dependencies needed from the parent scope of Root to provide dependencies
    // for the LoggedIn scope.
}

extension RootComponent: LoggedInDependency {

    var loggedInViewController: LoggedInViewControllable {
        return rootViewController
    }
}
