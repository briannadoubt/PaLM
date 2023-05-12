//
//  EmbedTextRequestTests.swift
//  
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class EmbedTextRequestTests: XCTestCase {
    let mockText = "This is embedded text"

    func testInitialization() throws {
        let request = EmbedTextRequest(text: mockText)
        XCTAssertEqual(request.text, mockText)
    }
}
