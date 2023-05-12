//
//  GenerateTextResponseTests.swift
//  
//
//  Created by Brianna Zamora on 5/11/23.
//

import XCTest
@testable import PaLM

final class GenerateTextResponseTests: XCTestCase {

    func testDecode() throws {
        let json = try XCTUnwrap(Bundle.module.url(forResource: "generateTextResponse", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let response = try JSONDecoder().decode(GenerateTextResponse.self, from: data)

        let expectedSafetyRating = SafetyRating(category: .unspecified, probability: .unspecified)
        let expectedCitationSource = CitationSource(startIndex: 2, endIndex: 5, uri: "testUri", license: "testLicense")
        let expectedCitationMetadata = CitationMetadata(citationSources: [expectedCitationSource])
        let expectedTextCompletion = TextCompletion(
            output: "This is a message",
            safetyRatings: [expectedSafetyRating],
            citationMetadata: expectedCitationMetadata
        )

        let expectedFilter = ContentFilter(reason: .other, message: "This is a message")

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

        XCTAssertEqual(response.candidates, [expectedTextCompletion])
        XCTAssertEqual(response.filters, [expectedFilter])
        XCTAssertEqual(response.safetyFeedback, [expectedSafetyFeedback])
    }

}
