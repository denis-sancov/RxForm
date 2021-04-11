//
//  Rules.swift
//  RxForm
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import RxSwift

public struct Rules<I: Identity>: Component {
    let builder: (Store<I>) -> Observable<Bool>

    public init(@Rules.Builder builder: @escaping (Store<I>) -> Observable<Bool>) {
        self.builder = builder
    }

    @_functionBuilder
    public struct Builder {
        public static func buildBlock(_ component: Observable<Bool>) -> Observable<Bool> {
            return component
        }
    }
}
