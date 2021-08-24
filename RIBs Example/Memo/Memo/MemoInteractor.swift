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
    func moveToAddMemo()
    func backFromAddMemo()
}

protocol MemoPresentable: Presentable {
    var listener: MemoPresentableListener? { get set }
}

protocol MemoListener: AnyObject {
    func logout()
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
        getMemoData()
            .bind(to: memos)
            .disposeOnDeactivate(interactor: self)
    }
    
    override func willResignActive() {
        super.willResignActive()
    }
    
    func getMemoData() -> Observable<[Memo]> {
        return Observable<[Memo]>.create { observer in
            observer.onNext(MEMO_DATA)
            return Disposables.create()
        }
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
        router?.moveToAddMemo()
    }
    
    func logOutButtonDidTap() {
        listener?.logout()
    }
    
    func navigationBack() {
        router?.backFromAddMemo()
    }
}
