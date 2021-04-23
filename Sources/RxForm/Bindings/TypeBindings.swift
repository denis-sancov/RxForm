//
//  File.swift
//  
//
//  Created by Denis Sancov on 4/11/21.
//

import Foundation

public struct TypeBindings<T: RowType>: Binder {
    private var associations: [T: AnyBinding]

    public init() {
        associations = [:]
    }

    public func register() {

    }

    public func instantiate(type: T, store: Store<T>) -> AnyRow {
        guard let row = associations[type] else {
            fatalError("no row is available for identity = \(type)")
        }
        return row.instantiate(type: type, store: store)
    }
}
//
//
////    @TypeBindings.Builder<I> builder: @escaping () -> [Component<I>]
//
//    init() {
//
//
//
////        let components = builder()
////
////        var buffer = [String: AnyBinding]()
////
////        components.forEach {
////            let type = String(describing: $0.type)
////            buffer[type] = $0.binding
////        }
//
//        self.associations = [:]// buffer
//    }
//
//    public func instantiate(id: I, store: Store<I>) -> AnyRow {

//    }
//
//    public struct Provider<T: AnyRow> {
//        func build(id: I, store: Store<I>) -> T {
//
//            fatalError()
//        }
//    }
//}
//
//
////
////
////    public struct Component<I: Identity> {
////        let type: I.Type
////        let binding: AnyBinding
////
////        init<T: Row>(row: T.Type = T.self, params: @escaping RowParams<T, I>) where T.I == I {
////            self.type = I.self
////            self.binding = Binding<T>(params: params)
////        }
////    }
////
////    @_functionBuilder
////    public struct Builder<I: Identity> {
////        public static func buildBlock(_ component: Component<I>...) -> [Component<I>] {
////            return component
////        }
////    }
////}
