//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/9/21.
//

import Foundation

public struct SwitchRow<I: Identity>: ValueRow  {
    public typealias Value = Bool

    public let identity: I
    public let params: Params
    public let value: Bool?

    public init(identity: I, params: Params) {
        self.identity = identity
        self.params = params
        self.value = false
    }

    public init(identity: I, params: Params, value: Bool?) {
        self.identity = identity
        self.params = params
        self.value = value ?? false
    }

    public struct Params {
        public let caption: String?

        public init(caption: String?) {
            self.caption = caption
        }
    }
}
