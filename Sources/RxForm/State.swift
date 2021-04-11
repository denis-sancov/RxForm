//
//  State.swift
//  RxForm
//
//  Created by Denis Sancov on 2/16/21.
//  Copyright © 2021 FinComBank. All rights reserved.
//

import Foundation

public enum State<T: AnyRow> {
    case loading
    case success(rows: [T])
    case error(err: Error)

    public var rows: [T]? {
        switch self {
        case .success(let rows):
            return rows
        default:
            return nil
        }
    }
}
