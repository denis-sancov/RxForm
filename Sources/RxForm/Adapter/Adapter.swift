//
//  File.swift
//  
//
//  Created by Denis Sancov on 4/21/21.
//

import RxSwift

public protocol Adapter {
    associatedtype T: RowType

    func prepare(store: Store<T>) -> Observable<()>

    func types(store: Store<T>) -> [T]

    func resolve(store: Store<T>) -> [AnyRow]

    func observables(store: Store<T>) -> [Observable<()>]
}

public extension Adapter {
    func prepare(store: Store<T>) -> Observable<()> {
        return .empty()
    }

    func types(store: Store<T>) -> [T] {
        return store.types
    }

    func observables(store: Store<T>) -> [Observable<()>] {
        return []
    }
}

public protocol BinderAdapter: Adapter {
    associatedtype B: Binder where B.T == T

    var binder: B { get }

    func setup(binder: B)
}

public extension BinderAdapter {
    func resolve(store: Store<T>) -> [AnyRow] {
        return types(store: store).map {
            binder.instantiate(type: $0, store: store)
        }
    }
}
