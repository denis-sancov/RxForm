//
//  File.swift
//  
//
//  Created by Denis Sancov on 4/11/21.
//

import Foundation

//public struct KeyBindings<T: RowType>: Binder {
//    private let associations: [T: AnyBinding]
//
//    public init(@KeyBindings<T>.Builder builder: @escaping () -> [BindingComponent<T>]) {
//        let components = builder()
//        
//        var buffer = [T: AnyBinding]()
//
//        components.forEach {
//            buffer[$0.identity] = $0.binding
//        }
//
//        associations = [:]
//    }
//
////    public func instantiate(id: I, store: Store<I>) -> AnyRow {
////        guard let binding = associations[id] else {
////            fatalError("no binding is available for id = \(id)")
////        }
////        return binding.instantiate(id: id, store: store)
////    }
//
////    @_functionBuilder
////    public struct Builder {
////        public static func buildBlock(_ component: BindingComponent<I>...) -> [BindingComponent<I>] {
////            return component
////        }
////    }
//}

public struct BindingComponent<I> {
    let identity: I
    let binding: AnyBinding

    public init<T: Row>(
        row: T.Type = T.self,
        identity: I,
        params: @escaping RowParams<T, I>
    ) where T.I == I {
        self.identity = identity
        self.binding = Binding<T>(params: params)
    }
}
