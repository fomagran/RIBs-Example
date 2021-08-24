//
//  AddMemoViewController.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import RIBs
import RxSwift
import UIKit

protocol AddMemoPresentableListener: AnyObject {
    func navigationBackDidTap()
}

final class AddMemoViewController: UIViewController, AddMemoPresentable, AddMemoViewControllable {
    
    weak var listener: AddMemoPresentableListener?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.title = "메모 추가하기"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if isMovingFromParent {
            listener?.navigationBackDidTap()
        }
    }
}
