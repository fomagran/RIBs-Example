//
//  RootViewController.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/18.
//

import RIBs
import UIKit

protocol RootPresentableListener: AnyObject {
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {
    
    let rootLabel:UILabel = UILabel()
    
    weak var listener: RootPresentableListener?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    func layout() {
        self.view.backgroundColor = .white
        rootLabel.text = "여기는 루트립입니다."
        view.addSubview(rootLabel)
        rootLabel.translatesAutoresizingMaskIntoConstraints = false
        rootLabel.centerXAnchor.constraint(equalTo:view.centerXAnchor)
                    .isActive = true
        rootLabel.centerYAnchor.constraint(equalTo:view.centerYAnchor)
                    .isActive = true
    }


    // MARK: - RootViewControllable
    
    func present(viewController: ViewControllable) {
        let vc = viewController.uiviewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func dismiss(viewController: ViewControllable) {
        if presentedViewController === viewController.uiviewController {
            dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: LoggedInViewControllable

extension RootViewController: LoggedInViewControllable {
}
