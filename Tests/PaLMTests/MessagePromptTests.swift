//
//  MessagePrompt.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class MessagePromptTests: XCTestCase {

    func testInitialization() {
        _ = MessagePrompt(
            context: "testContext",
            examples: [
                Example(
                    input: Message(
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
                    ),
                    output: Message(
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
                )
            ],
            messages: [
                Message(
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
            ]
        )
    }

    func testDecoding() throws {
        let expectedMessagePrompt = MessagePrompt(
            context: "testContext",
            examples: [
                Example(
                    input: Message(
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
                    ),
                    output: Message(
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
                )
            ],
            messages: [
                Message(
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
            ]
        )

        let json = try XCTUnwrap(Bundle.module.url(forResource: "messagePrompt", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let messagePrompt = try JSONDecoder().decode(MessagePrompt.self, from: data)

        XCTAssertEqual(messagePrompt, expectedMessagePrompt)
    }

}
