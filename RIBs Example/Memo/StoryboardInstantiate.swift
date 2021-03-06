//
//  StoryboardInstantiate.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import UIKit

enum Storyboard: String {
    case MemoViewController
    case AddMemoViewController
    
    func instantiate<VC: UIViewController>(_: VC.Type) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: nil).instantiateInitialViewController() as? VC else {
            fatalError("Storyboard \(self.rawValue) wasn`t found.")
        }
        return vc
    }
}
