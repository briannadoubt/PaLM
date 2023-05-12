//
//  GenerateTextRequestTests.swift
//  
//
//  Created by Brianna Zamora on 5/11/23.
//

import XCTest
@testable import PaLM

final class GenerateTextRequestTests: XCTestCase {
    func testInitialization() {
        let mockText = "This is some text"
        let mockTextPrompt = TextPrompt(text: mockText)
        let mockSafetySetting = SafetySetting(category: .unspecified, threshold: .high)
        let mockTemperature: Float = 0.5
        let mockCandidateCount = 2
        let maxOutputTokens = 50
        let mockTopP: Float = 0.5
        let mockTopK = 1
        let _ = GenerateTextRequest(
            prompt: mockTextPrompt,
            safetySettings: [mockSafetySetting],
            stopSequences: ["testStopSequence"],
            temperature: mockTemperature,
            candidateCount: mockCandidateCount,
            maxOutputTokens: maxOutputTokens,
            topP: mockTopP,
            topK: mockTopK
        )
    }
}
