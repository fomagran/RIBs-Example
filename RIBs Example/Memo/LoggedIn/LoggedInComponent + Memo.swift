//
//  LoggedInComponent + Memo.swift
//  RIBs Example
//
//  Created by Fomagran on 2021/08/24.
//

import RIBs

protocol LoggedInDependencyMemo: Dependency {
}

extension LoggedInComponent: MemoDependency {
}
