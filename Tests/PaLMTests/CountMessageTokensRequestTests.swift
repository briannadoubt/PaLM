//
//  CountMessageTokensRequestTests.swift
//  PaLMTests
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class CountMessageTokensRequestTests: XCTestCase {
    let mockMessageContent = "This is a message"

    func testInitialization() throws {
        let mockMessage = Message(content: mockMessageContent)
        let mockPrompt = MessagePrompt(messages: [mockMessage])
        let request = CountMessageTokensRequest(prompt: mockPrompt)
        XCTAssertEqual(request.prompt.messages.count, 1)
        let first = try XCTUnwrap(request.prompt.messages.first)
        XCTAssertEqual(first, mockMessage)
    }
}
