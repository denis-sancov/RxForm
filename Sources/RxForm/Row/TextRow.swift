//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/9/21.
//

import Foundation
import FCB_utils

//public struct TextRow<I: RowType, Format: TextFormat>: ValueRow {
//    public typealias Value = Format.Value
//
//    public let id: I
//    public let params: Params<Format>
//    public let relay: Value?
//
//    public init(id: I, params: Params<Format>) {
//        self.id = id
//        self.params = params
//        self.relay = nil
//    }
//
//    public init(id: I, params: Params<Format>, value: Value?) {
//        self.id = id
//        self.params = params
//        self.value = value
//    }
//
//    public struct Params<Format: TextFormat> {
//        public let format: Format
//        public let content: TextContent
//
//        public let caption: String?
//        public let hint: String?
//        public let helperText: String?
//
//        public let editable: Bool
//        public let enabled: Bool
//
//
//        public init(
//            format: Format = .init(),
//            content: TextContent = .text,
//            caption: String? = nil,
//            hint: String? = nil,
//            helperText: String? = nil,
//            editable: Bool = true,
//            enabled: Bool = true
//        ) {
//            self.format = format
//            self.content = content
//            self.caption = caption
//            self.hint = hint
//            self.helperText = helperText
//
//            self.editable = editable
//            self.enabled = enabled
//        }
//    }
//}
