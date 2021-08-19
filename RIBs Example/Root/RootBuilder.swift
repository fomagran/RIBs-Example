//
//  RootBuilder.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/18.
//

import RIBs

protocol RootDependency: Dependency {
}

final class RootComponent: Component<RootDependency> {
    let rootViewController: RootViewController

        init(dependency: RootDependency,
             rootViewController: RootViewController) {
            self.rootViewController = rootViewController
            super.init(dependency: dependency)
        }
}

// MARK: - Builder
protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
           let viewController = RootViewController()
           let component = RootComponent(dependency: dependency,
                                         rootViewController: viewController)
           let interactor = RootInteractor(presenter: viewController)

           let loggedOutBuilder = LoggedOutBuilder(dependency: component)
           let loggedInBuilder = LoggedInBuilder(dependency: component)
        
           return RootRouter(interactor: interactor,
                             viewController: viewController,
                             loggedOutBuilder: loggedOutBuilder
                             , loggedInBuilder: loggedInBuilder)
       }
}
