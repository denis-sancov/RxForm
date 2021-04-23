//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/9/21.
//

import Foundation
import RxSwift
import RxCocoa
import FCB_utils

public final class Form<T, A: Adapter> where A.T == T {
    private let _refresh = BehaviorRelay(value: Date())
    private let _reload = BehaviorRelay(value: Date())

    private let store: Store<T>
    private var adapter: A

    public lazy var rows = _reload


    func test() {
        adapter.prepare(store: store)
        adapter.types(store: store)
        adapter.resolve(store: store)
    }

//        .flatMapLatest { [unowned self] _ in self.defaults.builder(self.store) }
//        .flatMapLatest { [unowned self] _ -> Observable<Any> in
//            var streams: [Observable<()>] = []
//
//            streams.append(self._refresh.map { _ in })
//            streams.append(contentsOf: self.observables)
//
//            return Observable.merge(streams).map { [unowned self] in
//                self.store.getIds().map {
//                    self.bindings.instantiate(identity: $0, store: self.store)
//                }
//            }
//        }
//        .catch {
//            return Observable.just(State<Any>.error(err: $0))
//        }

//    public lazy var isValid: Observable<Bool> = Observable.merge(rules)

    public init(adapter: A) {
        self.store = Store()
        self.adapter = adapter
    }

    public func set(adapter: A) {
        self.adapter = adapter
        reload()
    }

    public func refresh() {
        _refresh.accept(Date())
    }

    public func reload(keepState: Bool = true) {
        if !keepState {
            store.clear()
        }
        
        _reload.accept(Date())
    }

    public func clear() {
        reload(keepState: false)
    }

    @_functionBuilder
    public struct Builder {
        public static func buildBlock(_ components: Component...) -> [Component] {
            return components
        }
    }
}
