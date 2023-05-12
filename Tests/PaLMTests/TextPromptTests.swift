//
//  TextPromptTests.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class TextPromptTests: XCTestCase {

    func testInitialization() {
        _ = TextPrompt(text: "This is a message")
    }

    func testDecoding() throws {
        let expectedTextPrompt = TextPrompt(text: "This is a message")
        let json = try XCTUnwrap(Bundle.module.url(forResource: "textPrompt", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let textPrompt = try JSONDecoder().decode(TextPrompt.self, from: data)
        XCTAssertEqual(textPrompt, expectedTextPrompt)
    }

}
