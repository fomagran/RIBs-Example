//
//  RootComponent + LoggedOut.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/18.
//

import RIBs

protocol RootDependencyLoggedOut: Dependency {
}

extension RootComponent: LoggedOutDependency {
}
