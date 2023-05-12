//
//  GenerateMessageRequestTests.swift
//  
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class GenerateMessageRequestTests: XCTestCase {
    let mockContent = "This is a message"
    let mockTemperature: Float = 0.5
    let mockCandidateCount = 1
    let mockTopP: Float = 0.5
    let mockTopK: Int = 1

    func testInitialization() throws {
        let mockMessage = Message(content: mockContent)
        let mockPrompt = MessagePrompt(messages: [mockMessage])
        let request = GenerateMessageRequest(
            prompt: mockPrompt,
            temperature: mockTemperature,
            candidateCount: mockCandidateCount,
            topP: mockTopP,
            topK: mockTopK
        )
        XCTAssertEqual(request.prompt.messages.count, 1)
        let first = try XCTUnwrap(request.prompt.messages.first)
        XCTAssertEqual(first, mockMessage)
        XCTAssertEqual(request.temperature, mockTemperature)
        XCTAssertEqual(request.candidateCount, mockCandidateCount)
        XCTAssertEqual(request.topP, mockTopP)
        XCTAssertEqual(request.topK, mockTopK)
    }
}
