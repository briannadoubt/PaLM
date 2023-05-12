//
//  SafetySettingTests.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class SafetySettingTests: XCTestCase {

    func testInitialization() {
        _ = SafetySetting(category: .unspecified, threshold: .unspecified)
    }

    func testDecoding() throws {
        let expectedSafetyRating = SafetySetting(category: .unspecified, threshold: .unspecified)
        let json = try XCTUnwrap(Bundle.module.url(forResource: "safetySetting", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let safetyRating = try JSONDecoder().decode(SafetySetting.self, from: data)
        XCTAssertEqual(safetyRating, expectedSafetyRating)
    }

}
