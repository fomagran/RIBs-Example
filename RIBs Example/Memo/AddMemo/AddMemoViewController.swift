//
//  AddMemoViewController.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import RIBs
import RxSwift
import UIKit
import RxCocoa

protocol AddMemoPresentableListener: AnyObject {
    func navigationBackDidTap()
    func addMemo(number:Int)
}

final class AddMemoViewController: UIViewController, AddMemoPresentable, AddMemoViewControllable {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var numberTF: UITextField!
    
    weak var listener: AddMemoPresentableListener?
    private let disposeBag:DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        configure()
        bind()
    }
    
    static func instantiate() -> Self {
        return Storyboard.AddMemoViewController.instantiate(self)
    }
    
    private func configure() {
        self.view.backgroundColor = .white
        self.title = "메모 추가하기"
    }
    
    private func bind() {
        addButton.rx.controlEvent(.touchUpInside)
            .subscribe{ [weak self] _ in
                self?.listener?.addMemo(number: Int(self?.numberTF.text ?? "0") ?? 0)
            }.disposed(by: disposeBag)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if isMovingFromParent {
            listener?.navigationBackDidTap()
        }
    }
}
