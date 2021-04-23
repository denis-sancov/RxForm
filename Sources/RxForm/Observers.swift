//
//  Observers.swift
//  RxForm
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import RxSwift

public struct Observers<I: RowType>: Component {
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
