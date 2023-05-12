//
//  SafetyRatingTests.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class SafetyRatingTests: XCTestCase {

    func testInitialization() {
        _ = SafetyRating(category: .unspecified, probability: .unspecified)
    }

    func testDecoding() throws {
        let expectedSafetyRating = SafetyRating(category: .unspecified, probability: .unspecified)
        let json = try XCTUnwrap(Bundle.module.url(forResource: "safetyRating", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let safetyRating = try JSONDecoder().decode(SafetyRating.self, from: data)
        XCTAssertEqual(safetyRating, expectedSafetyRating)
    }

}
