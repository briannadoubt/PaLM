//
//  TextCompletionTests.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class TextCompletionTests: XCTestCase {

    func testInitialization() {
        _ = TextCompletion(
            output: "This is a message",
            safetyRatings: [
                SafetyRating(category: .unspecified, probability: .unspecified)
            ],
            citationMetadata: CitationMetadata(
                citationSources: [
                    CitationSource(
                        startIndex: 2,
                        endIndex: 5,
                        uri: "testUri",
                        license: "testLicense"
                    )
                ]
            )
        )
    }

    func testDecoding() throws {
        let expectedTextCompletion = TextCompletion(
            output: "This is a message",
            safetyRatings: [
                SafetyRating(category: .unspecified, probability: .unspecified)
            ],
            citationMetadata: CitationMetadata(
                citationSources: [
                    CitationSource(
                        startIndex: 2,
                        endIndex: 5,
                        uri: "testUri",
                        license: "testLicense"
                    )
                ]
            )
        )
        let json = try XCTUnwrap(Bundle.module.url(forResource: "textCompletion", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let textCompletion = try JSONDecoder().decode(TextCompletion.self, from: data)
        XCTAssertEqual(textCompletion, expectedTextCompletion)
    }

}
