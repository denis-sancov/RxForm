//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/14/21.
//

import RxSwift

public struct Observers<I: Identity>: Component {
    let builder: (Store<I>) -> [Observable<()>]

    public init(@Observers.Builder builder: @escaping (Store<I>) -> [Observable<()>]) {
        self.builder = builder
    }

    @_functionBuilder
    public struct Builder {
        public static func buildBlock(_ component: Observable<()>...) -> [Observable<()>] {
            return component
        }
    }
}
