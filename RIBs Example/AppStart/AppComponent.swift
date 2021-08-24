//
//  AppComponent.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/18.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    init() {
        super.init(dependency: EmptyComponent())
    }
}
