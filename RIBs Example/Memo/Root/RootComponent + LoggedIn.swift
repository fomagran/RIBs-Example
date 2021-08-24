//
//  RootComponent + LoggedIn.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import RIBs

protocol RootDependencyLoggedIn: Dependency {
}

extension RootComponent: LoggedInDependency {
    var LoggedInViewController: LoggedInViewControllable {
        return rootViewController
    }
}
