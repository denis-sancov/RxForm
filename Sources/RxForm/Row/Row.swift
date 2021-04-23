//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/9/21.
//

import Foundation

public protocol AnyRow {
}

public protocol Row: AnyRow {
    associatedtype I: RowType
    associatedtype Params = Void

    var id: I { get }
    var params: Params { get }

    init(id: I, params: Params)
}
