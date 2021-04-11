//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/9/21.
//

import Foundation

public protocol ObservableRow {
    func register(listener: (Self) -> Void)
}

public protocol ValueRow: Row, ObservableRow {
    associatedtype Value

    var value: Value? { get }

    init(identity: I, params: Params, value: Value?)
}

extension ValueRow {
    public func register(listener: (Self) -> Void) {
        
    }
}
