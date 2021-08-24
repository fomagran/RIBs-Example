//
//  LoggedOutViewController.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/18.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    func handleLogin()
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {
    
    @IBOutlet weak var loginButton: UIButton!

    weak var listener: LoggedOutPresentableListener?
    
    @IBAction func tapLoginButton(_ sender: Any) {
        listener?.handleLogin()
    }
}
