//
//  Store.swift
//  RxForm
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import RxSwift
import RxCocoa

fileprivate struct Box<I: Identity> {
    let identity: I
    let value: Any?

    func cast<T>() -> T? {
        return value as? T
    }
}

public typealias StoreCallback<I: Identity> = (Store<I>, I?) -> Observable<()>

public final class Store<I: Identity>: Component {
    private var fields = [I: BehaviorRelay<Box<I>?>]()
    private var ids = Set<I>()

    public func register(ids: I...) {
        ids.forEach {
            self.ids.insert($0)
        }
    }

    public func getIds() -> Set<I> {
        return ids
    }

    public subscript<T>(identity: I) -> T?  {
        get {
            return value(identity: identity)
        }
        set(newValue) {
            set(value: newValue, identity: identity)
        }
    }

    public func observe(
        identities: I...,
        callback: @escaping StoreCallback<I> = { _, _  in .empty() }
    ) -> Observable<()> {
        
        let observables = identities.map {
            resolveRelay(for: $0)
                .asObservable()
                .map { $0?.identity }
                .withUnretained(self)
                .flatMapLatest(callback)
        }

        return .merge(observables)
    }

    public func set<T>(value: T?, identity: I) {
        let relay = resolveRelay(for: identity)
        relay.accept(.init(identity: identity, value: value))
    }

    public func value<T>(identity: I) -> T? {
        let relay = resolveRelay(for: identity)
        return relay.value?.cast()
    }

    public func value<T>(identity: I, default: T) -> T {
        return value(identity: identity) ?? `default`
    }

    public func reset() {
        fields.values.forEach {
            $0.accept(nil)
        }
    }

    private func resolveRelay(for identity: I, value: Box<I>? = nil) -> BehaviorRelay<Box<I>?> {
        if let relay = fields[identity] {
            return relay
        }

        let relay = BehaviorRelay(value: value)

        fields[identity] = relay

        return relay
    }
}
