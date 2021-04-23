//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/9/21.
//

import Foundation

public protocol PickerModel {
    var imgNamed: String? { get }
    var title: String? { get }
    var subtitle: String? { get }
}

//public struct PickerRow<I: RowType >: ValueRow  {
//    public let id: I
//    public let params: Params
//    public let value: PickerModel?
//
//    public init(id: I, params: Params) {
//        self.id = id
//        self.params = params
//        self.value = nil
//    }
//
//    public init(id: I, params: Params, value: Value?) {
//        self.id = id
//        self.params = params
//        self.value = value
//    }
//
//    public struct Params {
//        public let caption: String?
//        public let hint: String?
//        public let multiline: Bool
//
//        public init(
//            caption: String? = nil,
//            hint: String? = nil,
//            multiline: Bool = false
//        ) {
//            self.caption = caption
//            self.hint = hint
//            self.multiline = multiline
//        }
//    }
//}
