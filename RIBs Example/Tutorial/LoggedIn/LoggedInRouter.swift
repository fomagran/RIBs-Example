//
//  LoggedInRouter.swift
//  LoggedIn
//
//  Created by Fomagran on 2021/08/19.
//

import RIBs

protocol LoggedInInteractable: Interactable,MemoListener{
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
    func present(viewController: ViewControllable)
    func dismiss(viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {
    
    private let memoBuilder: MemoBuildable
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         memoBuilder: MemoBuildable) {
        self.memoBuilder = memoBuilder
        self.viewController = viewController
        super.init(interactor: interactor)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        let memoRouting = memoBuilder.build(withListener: interactor)
        attachChild(memoRouting)
        let navigationController = UINavigationController(root: memoRouting.viewControllable)
              viewController.present(viewController: navigationController)
    }
    
    func cleanupViews() {
        if let currentChild = currentChild {
            viewController.dismiss(viewController: currentChild.viewControllable)
        }
    }

    // MARK: - Private
    
    private let viewController: LoggedInViewControllable
    private var currentChild: ViewableRouting?
    
    
    private func detachCurrentChild() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.dismiss(viewController: currentChild.viewControllable)
        }
    }
}

extension UINavigationController: ViewControllable {
        public var uiviewController: UIViewController {
            return self
        }
        
        convenience init(root: ViewControllable) {
            self.init(rootViewController: root.uiviewController)
        }
    }
