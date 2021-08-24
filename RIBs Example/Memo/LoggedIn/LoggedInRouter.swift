//
//  LoggedInRouter.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import RIBs

protocol LoggedInInteractable: Interactable,MemoListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {

    private let memoBuilder:MemoBuildable
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LoggedInInteractable, viewController: LoggedInViewControllable,memoBuilder:MemoBuildable) {
        self.viewController = viewController
        self.memoBuilder = memoBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }

    func cleanupViews() {
        // TODO: Since this router does not own its view, it needs to cleanup the views
        // it may have added to the view hierarchy, when its interactor is deactivated.
    }
    
    override func didLoad() {
        super.didLoad()
        let memoRouting = memoBuilder.build(withListener: interactor)
        attachChild(memoRouting)
        let navigationController = UINavigationController(root: memoRouting.viewControllable)
        viewController.present(viewController: navigationController)
    }
    
    // MARK: - Private
    
    private let viewController: LoggedInViewControllable
}
