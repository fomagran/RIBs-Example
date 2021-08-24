//
//  MemoTableViewCell.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import UIKit
import RxSwift
import RxCocoa

class MemoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var title: UILabel!
    
    override func prepareForReuse() {
        disposeBag = DisposeBag()
    }
    
    var index:Int = 0
    var disposeBag:DisposeBag = DisposeBag()
    
    var deleteTap : Observable<Void>{
        return self.deleteButton.rx.tap.asObservable()
    }
    
    var addTap : Observable<Void>{
        return self.addButton.rx.tap.asObservable()
    }
}
