//
//  Enum + Storyboard.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/23.
//

import UIKit

enum Storyboard: String {
    case MemoViewController
    
    func instantiate<VC: UIViewController>(_: VC.Type) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: nil).instantiateInitialViewController() as? VC else {
            fatalError("Storyboard \(self.rawValue) wasn`t found.")
        }
        return vc
    }
}
