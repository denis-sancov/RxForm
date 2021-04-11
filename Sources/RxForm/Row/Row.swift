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
    associatedtype I: Identity
    associatedtype Params = Void

    var identity: I { get }
    var params: Params { get }

    init(identity: I, params: Params)
}
