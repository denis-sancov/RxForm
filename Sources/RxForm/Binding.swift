//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/14/21.
//

import FCB_utils

public typealias RowParams<T: Row, I: Identity> = (I, Store<I>) -> T.Params

public protocol BindingStrategy {
//    associatedtype BindingType: Binding
}

public struct BindingPair<I: Identity> {
    let identity: I
    let binding: AnyBinding
}

public struct Bindings<I: Identity> {
    private var associations = [I: AnyBinding]()

    public init(@Bindings<I>.Builder builder: @escaping () -> [BindingPair<I>]) {

//        let binding = Binding<T>(params: params)
//        associations[identity] = binding
//        let components = builder()
//
//        self.store = components.firstAs() ?? Store()
//        self.observers = components.firstAs()
    }

    @_functionBuilder
    public struct Builder {
        public static func buildBlock(_ component: BindingPair<I>...) -> [BindingPair<I>] {
            return component
        }
    }

    mutating func register<T: Row>(
        row: T.Type = T.self,
        identity: I,
        params: @escaping RowParams<T, I>
    ) where T.I == I {
        let binding = Binding<T>(params: params)
        associations[identity] = binding
    }

    func instantiate(identity: I, store: Store<I>) -> AnyRow {
        fatalError()
//        guard let binding = associations[identity] as? Binding<T> else {
//            fatalError()
//        }
////        return binding.instantiate(identity: identity, store: store)
    }
}

public struct KeyBindings<I: Identity> {

    func register<T: Row>(row: T.Type = T.self, identity: I.Type) {
    }
//    private var associations = [I: AnyBinding]()
//
//    mutating func register<T: Row, T1: I>(
//        row: T.Type = T.self,
//        identity: T1.Type = T1.self,
//        params: @escaping RowParams<T, I>
//    ) where T.I == I {
//        let binding = ConcreteBinding<T>(params: params)
//        associations[identity] = binding
//    }
//
//    func instantiate<T: Row>(identity: I, store: Store<I>) -> T where T.I == I {
//        guard let binding = associations[identity] as? ConcreteBinding<T> else {
//            fatalError()
//        }
//        return binding.instantiate(identity: identity, store: store)
//    }
}

public protocol AnyBinding {

}

public struct Binding<T: Row>: AnyBinding {
    public typealias I = T.I

    public let params: RowParams<T, I>

    public init(params: @escaping RowParams<T, I>) {
        self.params = params
    }

    public func instantiate(identity: I, store: Store<I>) -> T  {
        let row = T(identity: identity, params: params(identity, store))

        if let row = row as? ObservableRow {
            row.register { value in

            }
        }

        return row
    }
}
