//
//  Store.swift
//  RxForm
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import RxSwift
import RxCocoa

struct Box<Type: RowType> {
    let type: Type
    let data: Any?

    func cast<T>() -> T? {
        return data as? T
    }
}

public final class Store<Type: RowType>: Component {
    var relays = [Type: BehaviorRelay<Box<Type>?>]()

    public var types: [Type] {
        return relays.keys.map { $0 }
    }

    public subscript<T>(type: Type) -> T?  {
        get {
            return get(type: type)
        }
        set(newValue) {
            set(value: newValue, type: type)
        }
    }

    public func observe(types: Type...) -> Observable<Type> {
        return observe(types: types)
    }

    public func observe(types: [Type]) -> Observable<Type> {
        let observables = types.map {
            getRelay(for: $0)
                .asObservable()
                .compactMap { $0?.type }
        }

        return .merge(observables)
    }

    public func contains(type: Type) -> Bool {
        let relay = getRelay(for: type)
        return relay.value?.data != nil
    }

    public func set<T>(value: T?, type: Type) {
        let relay = getRelay(for: type)
        relay.accept(.init(type: type, data: value))
    }

    public func setIfNull<T>(value: T?, type: Type) {
        let relay = getRelay(for: type)
        
        if relay.value == nil {
            relay.accept(.init(type: type, data: value))
        }
    }

    public func get<T>(type: Type) -> T? {
        let relay = getRelay(for: type)
        return relay.value?.cast()
    }

    public func get<T>(type: Type, default: T) -> T {
        return get(type: type) ?? `default`
    }

    public func get<Value>(where: @escaping (Value) -> Bool) -> Value? {
        return getAll(where: `where`).first
    }

    public func getAll<Value>(where: (Value) -> Bool) -> [Value] {
        return relays
            .values
            .compactMap { $0.value }
            .compactMap { $0.cast() as Value? }
    }

    public func clear() {
        relays.values.forEach {
            $0.accept(nil)
        }
    }

    private func getRelay(for type: Type, value: Box<Type>? = nil) -> BehaviorRelay<Box<Type>?> {
        if let relay = relays[type] {
            return relay
        }

        let relay = BehaviorRelay(value: value)

        relays[type] = relay

        return relay
    }
}
