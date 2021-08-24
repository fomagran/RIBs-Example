//
//  MemoInteractor.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import RIBs
import RxSwift
import RxCocoa

protocol MemoRouting: ViewableRouting {
}

protocol MemoPresentable: Presentable {
    var listener: MemoPresentableListener? { get set }
}

protocol MemoListener: AnyObject {
}

final class MemoInteractor: PresentableInteractor<MemoPresentable>, MemoInteractable {
    
    weak var router: MemoRouting?
    weak var listener: MemoListener?
    var memos: BehaviorRelay<[Memo]> = BehaviorRelay.init(value: [])

    override init(presenter: MemoPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        memos.accept(getMemoData())
    }

    override func willResignActive() {
        super.willResignActive()
    }
    
    private func getMemoData() -> [Memo] {
        return MEMO_DATA
    }
}

// MARK: MemosPresentableListener
extension MemoInteractor: MemoPresentableListener {
    
    func deleteMemo(_ index:Int) {
        var newMemos = memos.value
        newMemos.remove(at: index)
        memos.accept(newMemos)
    }
    
    func plusMemo(_ index: Int) {
        var newMemos = memos.value
        newMemos[index] = Memo(title: String(Int(newMemos[index].title)! + 1))
        memos.accept(newMemos)
    }
    
    func moveToAddMemoButtonDidTap() {
        
    }
    
    func logOutButtonDidTap() {
        
    }
}
