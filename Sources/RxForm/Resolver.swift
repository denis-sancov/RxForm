//
//  Resolver.swift
//  RxForm
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import Foundation

//public struct Resolver<T: BindingStrategy, I>: Component {
//    let bindings: [T.BindingType]
////
//    public init(@Resolver.Builder builder: @escaping () -> [T]) {
////        self.bindings = builder()
//    }
////
//    public func instantiate<T: Row>(identity: I, store: Store<I>) -> T where T.I == I {
//        fatalError()
////        guard let candidate = bindings.first(where: { $0.associated(with: identity) }) else {
////            fatalError()
////        }
////        return candidate.instantiate(identity: identity, store: store)
//    }
//
//
//
//    @_functionBuilder
//    public struct Builder {
//        public static func buildBlock<T: Binding>(_ component: T...) -> [T] {
//            return component
//        }
//    }
//}
