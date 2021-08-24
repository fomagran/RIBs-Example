//
//  LoggedOutBuilder.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/18.
//

import RIBs

protocol LoggedOutDependency: Dependency {
}

final class LoggedOutComponent: Component<LoggedOutDependency> {
}

// MARK: - Builder

protocol LoggedOutBuildable: Buildable {
    func build(withListener listener: LoggedOutListener) -> LoggedOutRouting
}

final class LoggedOutBuilder: Builder<LoggedOutDependency>, LoggedOutBuildable {

    override init(dependency: LoggedOutDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedOutListener) -> LoggedOutRouting {
        _ = LoggedOutComponent(dependency: dependency)
               let vcName = "LoggedOutViewController"
               let vc = UIStoryboard(
                   name: vcName,
                   bundle: nil
               ).instantiateViewController(
                   withIdentifier: vcName
               ) as! LoggedOutViewController
               let interactor = LoggedOutInteractor(presenter: vc)
        interactor.listener = listener
        return LoggedOutRouter(interactor: interactor, viewController: vc)
    }
}
