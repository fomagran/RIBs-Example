//
//  MemoRouter.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import RIBs

protocol MemoInteractable: Interactable ,AddMemoListener{
    var router: MemoRouting? { get set }
    var listener: MemoListener? { get set }
}

protocol MemoViewControllable: ViewControllable {
    func push(viewController: ViewControllable)
}

final class MemoRouter: ViewableRouter<MemoInteractable, MemoViewControllable>, MemoRouting {
    
    private let addMemoBuilder: AddMemoBuildable
    private var addMemoRouting: AddMemoRouting?
    
    init(interactor: MemoInteractable, viewController: MemoViewControllable,
         addMemoBuilder:AddMemoBuildable) {
        self.addMemoBuilder = addMemoBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func moveToAddMemo() {
        let addMemoRouting = addMemoBuilder.build(withListener: interactor)
        attachChild(addMemoRouting)
        viewController.push(viewController: addMemoRouting.viewControllable)
    }
    
    func backFromAddMemo() {
        guard let addMemoRouting = addMemoRouting else { return }
        detachChild(addMemoRouting)
        self.addMemoRouting = nil
    }
}
