//
//  HarmBlockThresholdTests.swift
//  
//
//  Created by Brianna Zamora on 5/11/23.
//

import XCTest
@testable import PaLM

final class HarmBlockThresholdTests: XCTestCase {

    func testCases() {
        XCTAssertEqual(HarmBlockThreshold.allCases.count, 5)
        XCTAssertEqual(HarmBlockThreshold.unspecified.rawValue, "HARM_BLOCK_THRESHOLD_UNSPECIFIED")
        XCTAssertEqual(HarmBlockThreshold.low.rawValue, "BLOCK_LOW_AND_ABOVE")
        XCTAssertEqual(HarmBlockThreshold.medium.rawValue, "BLOCK_MEDIUM_AND_ABOVE")
        XCTAssertEqual(HarmBlockThreshold.high.rawValue, "BLOCK_ONLY_HIGH")
        XCTAssertEqual(HarmBlockThreshold.none.rawValue, "BLOCK_NONE")
    }

}
