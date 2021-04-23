//
//  File.swift
//  
//
//  Created by Denis Sancov on 4/11/21.
//

import Foundation

public protocol Binder: Component {
    associatedtype T: RowType

    func instantiate(type: T, store: Store<T>) -> AnyRow
}
