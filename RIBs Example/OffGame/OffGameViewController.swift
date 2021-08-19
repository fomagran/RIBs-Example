//
//  OffGameViewController.swift
//  OffGame
//
//  Created by Fomagran on 2021/08/19.
//

import RIBs
import RxSwift
import UIKit

protocol OffGamePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {

    @IBOutlet weak var startButton: UIButton!
    
    weak var listener: OffGamePresentableListener?
    
    @IBAction func tapStartButton(_ sender: Any) {
        
    }
}
