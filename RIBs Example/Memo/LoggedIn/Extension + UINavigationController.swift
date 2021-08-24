//
//  Extension + UINavigationController.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import RIBs

extension UINavigationController: ViewControllable {
    public var uiviewController: UIViewController {
        return self
    }
    
    convenience init(root: ViewControllable) {
        self.init(rootViewController: root.uiviewController)
    }
}
