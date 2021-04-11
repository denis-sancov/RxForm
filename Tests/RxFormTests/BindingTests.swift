//
//  File.swift
//  
//
//  Created by Denis Sancov on 4/11/21.
//

import XCTest
@testable import RxForm

final class BindingTests: XCTestCase {
    func testRegister() {
//        private let bindings = Bindings<TestRow>(builder: <#() -> [BindingPair<TestRow>]#>)

//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        XCTAssertEqual("qe", "Hello, World!")
    }

    func testInstantiate() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        XCTAssertEqual("qe", "Hello, World!")
    }

    static var allTests = [
        ("register", testRegister),
        ("instantiate", testInstantiate),
    ]
}


fileprivate enum TestRow : CaseIterable, Identity {
    case username,
         age,
         isParent
}
