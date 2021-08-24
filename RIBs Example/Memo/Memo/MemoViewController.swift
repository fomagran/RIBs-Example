//
//  MemoViewController.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import RIBs
import UIKit
import RxCocoa
import RxSwift

protocol MemoPresentableListener: AnyObject {
    var memos: BehaviorRelay<[Memo]> { get }
    func deleteMemo(_ index:Int)
    func plusMemo(_ index: Int)
    func moveToAddMemoButtonDidTap()
    func logOutButtonDidTap()
}

final class MemoViewController: UIViewController, MemoPresentable {
        
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    @IBOutlet weak var table: UITableView!
    
    weak var listener: MemoPresentableListener?
    var memos:[Memo] = [Memo(title: "하이"),Memo(title: "헬로"),Memo(title: "영훈")]
    let disposeBag:DisposeBag = DisposeBag()
    
    static func instantiate() -> Self {
        return Storyboard.MemoViewController.instantiate(self)
    }
    
    override func viewDidLoad() {
        configure()
        bind()
    }
    
    private func configure() {
        self.title = "Memo"
    }
    
    private func bind() {
        listener?.memos.bind(to: table.rx.items(cellIdentifier: "MemoTableViewCell"))  { [weak self] (index, memo, cell) in
            if let cell = cell as? MemoTableViewCell {
                cell.title.text = memo.title
                cell.deleteTap
                    .subscribe(onNext:{
                        self?.listener?.deleteMemo(index)
                    })
                    .disposed(by: cell.disposeBag)
                
                cell.plusTap
                    .subscribe(onNext:{
                        self?.listener?.plusMemo(index)
                    })
                    .disposed(by: cell.disposeBag)
            }
        }.disposed(by: disposeBag)
        
        table.rx.setDelegate(self).disposed(by: disposeBag)
        
        addButton.rx.tap.subscribe(onNext: { [weak self] _ in
                    self?.listener?.moveToAddMemoButtonDidTap()
                }).disposed(by: disposeBag)

        logoutButton.rx.tap.subscribe(onNext: { [weak self] _ in
                    self?.listener?.logOutButtonDidTap()
                }).disposed(by: disposeBag)
    }
}

//MARK:- UITableViewDelegate

extension MemoViewController:UITableViewDelegate {
    
}

// MARK: MemoViewControllable

  extension MemoViewController: MemoViewControllable {
      func push(viewController: ViewControllable) {
          self.navigationController?.pushViewController(viewController.uiviewController, animated: true)
      }
  }

