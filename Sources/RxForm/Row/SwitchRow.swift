//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/9/21.
//

import Foundation

public enum Text {
    case plain(value: String)
    case attributed(value: NSAttributedString)
}

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
        public let text: Text?

        public init(caption: String?, text: Text? = nil) {
            self.caption = caption
            self.text = text
        }
    }
}
