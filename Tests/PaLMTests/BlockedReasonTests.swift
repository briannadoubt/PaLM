//
//  BlockedReason.swift
//  
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class BlockedReason: XCTestCase {
    func test_caseCount() {
        let expectedCount = 3
        XCTAssertEqual(BlockedReason.allCases.count, expectedCount)
    }
}
