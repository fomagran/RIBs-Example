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
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var number: UILabel!
    
    
    override func prepareForReuse() {
        disposeBag = DisposeBag()
    }
    
    var disposeBag:DisposeBag = DisposeBag()
    
    var deleteTap : Observable<Void>{
        return self.deleteButton.rx.tap.asObservable()
    }
    
    var plusTap : Observable<Void>{
        return self.plusButton.rx.tap.asObservable()
    }
}
