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

struct Test: AnyRow {

}

public final class Form<I: Identity> {
    private let _refresh = BehaviorRelay(value: Date())
    private let _reset = BehaviorRelay(value: Date())

    private let store: Store<I>
    private let defaults: Defaults<I>
    private let observables: [Observable<()>]
    private let bindings: Bindings<I>

    public lazy var rows = _reset
        .flatMapLatest { [unowned self] _ in self.defaults.builder(self.store) }
        .flatMapLatest { [unowned self] _ -> Observable<Any> in
            var streams: [Observable<()>] = []

            streams.append(self._refresh.map { _ in })
            streams.append(contentsOf: self.observables)

            return Observable.merge(streams).map { [unowned self] in
                self.store.getIds().map {
                    self.bindings.instantiate(identity: $0, store: self.store)
                }
            }
        }
//        .catch {
//            return Observable.just(State<Any>.error(err: $0))
//        }

    public init(@Form.Builder builder: @escaping () -> [Component]) {
        let components = builder()

        self.store = components.firstAs() ?? Store()
        self.defaults = components.firstAs()!
        self.observables = []//components.firstAs()
        self.bindings = components.firstAs()!
    }

    public func refresh() {
        _refresh.accept(Date())
    }

    public func reset() {
        _reset.accept(Date())
    }

    @_functionBuilder
    public struct Builder {
        public static func buildBlock(_ components: Component...) -> [Component] {
            return components
        }
    }
}

//extension ObservableType {
//    func myDebug(identifier: String) -> Observable<Self.E> {
//        return Observable.create { observer in
//
//            return Disposables.create()
//        }
//    }
//}
