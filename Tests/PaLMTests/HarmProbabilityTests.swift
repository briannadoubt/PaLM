//
//  HarmProbabilityTests.swift
//  
//
//  Created by Brianna Zamora on 5/11/23.
//

import XCTest
@testable import PaLM

final class HarmProbabilityTests: XCTestCase {

    func testCases() {
        XCTAssertEqual(HarmProbability.allCases.count, 5)
        XCTAssertEqual(HarmProbability.unspecified.rawValue, "HARM_PROBABILITY_UNSPECIFIED")
        XCTAssertEqual(HarmProbability.negligible.rawValue, "NEGLIGIBLE")
        XCTAssertEqual(HarmProbability.low.rawValue, "LOW")
        XCTAssertEqual(HarmProbability.medium.rawValue, "MEDIUM")
        XCTAssertEqual(HarmProbability.high.rawValue, "HIGH")
    }

}
