//
//  ValueRow.swift
//  
//
//  Created by Denis Sancov on 3/9/21.
//

import RxCocoa

public protocol ValueRow: Row {
    associatedtype Value

    var value: BehaviorRelay<Value?> { get }

    init(id: I, params: Params, value: Value?)
}
