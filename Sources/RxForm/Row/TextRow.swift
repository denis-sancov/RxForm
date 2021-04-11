//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/9/21.
//

import Foundation

public struct TextRow<I: Identity, Value>: ValueRow {
    public let identity: I
    public let params: ()
    public let value: Value?

    public init(identity: I, params: ()) {
        self.identity = identity
        self.params = params
        self.value = nil
    }

    public init(identity: I, params: (), value: Value?) {
        self.identity = identity
        self.params = params
        self.value = value
    }
}

