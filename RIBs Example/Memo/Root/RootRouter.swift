//
//  RootRouter.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/18.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener,LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController:ViewControllable)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuildable,
         loggedInBuilder:LoggedInBuildable) {
        
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        routeToLoggedOut()
    }
    
    // MARK: - Private
    
    private let loggedOutBuilder: LoggedOutBuildable
    
    private let loggedInBuilder:LoggedInBuildable
    
    private var loggedOutRouting: ViewableRouting?
    
    private var loggedInRouting: LoggedInRouting?
    
    func routeToLoggedOut() {
        if let loggedInRouting = loggedInRouting {
            detachChild(loggedInRouting)
            self.loggedInRouting = nil
        }
        
        let loggedOutRouting = loggedOutBuilder.build(withListener: interactor)
        self.loggedOutRouting = loggedOutRouting
        attachChild(loggedOutRouting)
        let navigationController = UINavigationController(root: loggedOutRouting.viewControllable)
        viewController.present(viewController: navigationController)
    }
    
    func routeToLoggedIn() {
        if let loggedOutRouting = loggedOutRouting {
            detachChild(loggedOutRouting)
            if let navigationController = loggedOutRouting.viewControllable.uiviewController.navigationController {
                           viewController.dismiss(viewController: navigationController)
                       } else {
                           viewController.dismiss(viewController: loggedOutRouting.viewControllable)
                       }
            self.loggedOutRouting = nil
        }
        let loggedInRouting = loggedInBuilder.build(withListener: interactor)
        self.loggedInRouting = loggedInRouting
        attachChild(loggedInRouting)
    }
}
