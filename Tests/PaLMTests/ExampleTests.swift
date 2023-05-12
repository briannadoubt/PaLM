//
//  ExampleTests.swift
//  PaLMTests
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class ExampleTests: XCTestCase {
    let mockText = "This is some text"
    func testInitialization() throws {
        let request = EmbedTextRequest(text: mockText)
        XCTAssertEqual(request.text, mockText)
    }
}
