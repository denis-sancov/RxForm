//
//  File.swift
//  
//
//  Created by Denis Sancov on 3/20/21.
//

import RxSwift

public struct Defaults<I: Identity>: Component {
    let builder: (Store<I>) -> Observable<()>

    public init(@Defaults.Builder builder: @escaping (Store<I>) -> Observable<()>) {
        self.builder = builder
    }

    @_functionBuilder
    public struct Builder {
        public static func buildBlock(_ component: Observable<()>) -> Observable<()> {
            return component
        }
    }
}

