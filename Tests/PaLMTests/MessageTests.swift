//
//  MessageTests.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class MessageTests: XCTestCase {

    let mockMessage = Message(
        author: "1",
        content: "This is a message",
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

    func testInitialization() {
        _ = mockMessage
    }

    func testDecoding() throws {
        let json = try XCTUnwrap(Bundle.module.url(forResource: "message", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let message = try JSONDecoder().decode(Message.self, from: data)

        XCTAssertEqual(message, mockMessage)
    }

}
