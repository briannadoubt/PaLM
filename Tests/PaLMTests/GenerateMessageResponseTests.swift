//
//  GenerateMessageResponseTests.swift
//  
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class GenerateMessageResponseTests: XCTestCase {
    func testDecode() throws {
        let json = try XCTUnwrap(Bundle.module.url(forResource: "generateMessageResponse", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let response = try JSONDecoder().decode(GenerateMessageResponse.self, from: data)

        let expectedMessage = Message(
            author: "1",
            content: "Hi",
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
        let expectedFilter = ContentFilter(reason: .other, message: "This is a message")
        XCTAssertEqual(response.candidates, [expectedMessage])
        XCTAssertEqual(response.messages, [expectedMessage])
        XCTAssertEqual(response.filters, [expectedFilter])
    }
}
