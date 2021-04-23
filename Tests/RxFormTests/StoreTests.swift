//
//  File.swift
//  
//
//  Created by Denis Sancov on 4/11/21.
//

import XCTest
@testable import RxForm
@testable import RxSwift

final class StoreTests: XCTestCase {
    private let store = Store<TestRow>()
    private let bag = DisposeBag()

    func testRegisterIds() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        XCTAssertEqual("qe", "Hello, World!")
    }

    func testValues() {
        store.set(value: "john.doe", type: .username)
        store.set(value: 44, type: .age)
        store.set(value: false, type: .isParent)


        XCTAssertEqual(store.get(type: .username), "john.doe")
        XCTAssertEqual(store.get(type: .age), 44)
        XCTAssertNotEqual(store.get(type: .isParent), true)
    }

    func testObservers() {
//        let expectation = XCTestExpectation(description: "Testing observer")
//
//        let first = store.observe(types: .username, .age) { store, identity  in
//            let username = store.value(identity: .username, default: "unknown")
//            let age = store.value(identity: .age, default: 34)
//
//            if username == "next.username" && age == 10 {
//                expectation.fulfill()
//            }
//
//            return .empty()
//        }
//
//        first.subscribe().disposed(by: bag)
//
//        store.set(value: "next.username", type: .username)
//        store.set(value: 10, type: .age)
//
//        wait(for: [expectation], timeout: 10.0)
    }

    static var allTests = [
        ("registerIds", testRegisterIds),
        ("values", testValues),
        ("observers", testObservers)
    ]
}


fileprivate enum TestRow : CaseIterable, RowType {
    case username,
         age,
         isParent

    var order: Int {
        return 0
    }
}
