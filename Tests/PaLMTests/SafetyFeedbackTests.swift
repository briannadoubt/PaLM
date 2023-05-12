//
//  SafetyFeedbackTests.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class SafetyFeedbackTests: XCTestCase {

    func testInitialization() {
        _ = SafetyFeedback(
            rating: SafetyRating(
                category: .unspecified,
                probability: .unspecified
            ),
            setting: SafetySetting(
                category: .unspecified,
                threshold: .unspecified
            )
        )
    }

    func testDecoding() throws {
        let expectedSafetyFeedback = SafetyFeedback(
            rating: SafetyRating(
                category: .unspecified,
                probability: .unspecified
            ),
            setting: SafetySetting(
                category: .unspecified,
                threshold: .unspecified
            )
        )
        let json = try XCTUnwrap(Bundle.module.url(forResource: "safetyFeedback", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let safetyFeedback = try JSONDecoder().decode(SafetyFeedback.self, from: data)

        XCTAssertEqual(safetyFeedback, expectedSafetyFeedback)
    }

}
