//
//  MemoTableViewCell.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import UIKit
import RxSwift
import RxCocoa

protocol MemoTableViewCellDelegate:AnyObject {
    func tapDeleteButton(index:Int)
    func tapPlusButton(index:Int)
}

class MemoTableViewCell: UITableViewCell {
    
    weak var delegate:MemoTableViewCellDelegate?
    var index:Int = 0

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var title: UILabel!

    @IBAction func tapDeleteButton(_ sender: Any) {
        delegate?.tapDeleteButton(index:index)
    }
    @IBAction func tapPlusButton(_ sender: Any) {
        delegate?.tapPlusButton(index:index)
    }
    
}
