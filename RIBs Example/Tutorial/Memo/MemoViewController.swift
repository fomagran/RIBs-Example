//
//  MemoViewController.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/23.
//

import RIBs
import RxSwift
import UIKit

protocol MemoPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MemoViewController: UIViewController, MemoPresentable, MemoViewControllable {
    
    weak var listener: MemoPresentableListener?
    
    static func instantiate() -> Self {
        return Storyboard.MemoViewController.instantiate(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
}
