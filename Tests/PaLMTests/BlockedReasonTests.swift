//
//  BlockedReason.swift
//  PaLMTests
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class BlockedReasonTests: XCTestCase {
    func test_caseCount() {
        let expectedCount = 3
        XCTAssertEqual(BlockedReason.allCases.count, expectedCount)
    }

    func test_unspecified() {
        XCTAssertEqual(BlockedReason.unspecified.rawValue, "BLOCKED_REASON_UNSPECIFIED")
    }

    func test_safety() {
        XCTAssertEqual(BlockedReason.safety.rawValue, "SAFETY")
    }

    func test_other() {
        XCTAssertEqual(BlockedReason.other.rawValue, "OTHER")
    }
}
