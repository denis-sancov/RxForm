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

public typealias RowsState = State<AnyRow>

public final class Form<T, A: Adapter> where A.T == T {
    private let refresh = BehaviorRelay(value: Date())
    private let reload = BehaviorRelay(value: Date())

    private let store: Store<T>
    private var adapter: A

    public lazy var rows = reload
        .flatMapLatest { [unowned self] _ -> Observable<RowsState> in

            let rows = self.adapter
                .prepare(store: self.store)
                .flatMapLatest { [unowned self] _ -> Observable<RowsState> in

                    let refresh = self.refresh.map { _ in }
                    let triggers = self.adapter.observables(store: self.store) + [refresh]

                    return Observable
                        .merge(triggers)
                        .map {
                            .success(rows: self.adapter.resolve(store: self.store))
                        }
                }

            return .concat(.just(.loading), rows)
        }
        .catch {
            return .just(.error(err: $0))
        }


    public init(adapter: A) {
        self.store = Store()
        self.adapter = adapter
    }

    public func set(adapter: A) {
        self.adapter = adapter
        triggerReload()
    }

    public func triggerRefresh() {
        refresh.accept(Date())
    }

    public func triggerReload(keepState: Bool = true) {
        if !keepState {
            store.clear()
        }
        
        reload.accept(Date())
    }

    public func clear() {
        triggerReload(keepState: false)
    }
}
