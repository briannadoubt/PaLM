//
//  ContentFilterTests.swift
//  PaLMTests
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class ContentFilterTests: XCTestCase {
    let mockMessage = "This is a message"

    func testInitialization() throws {
        let citationSource = ContentFilter(
            reason: .other,
            message: mockMessage
        )
        XCTAssertEqual(citationSource.reason, .other)
        XCTAssertEqual(citationSource.message, mockMessage)
    }

    func testDecode() throws {
        let json = try XCTUnwrap(Bundle.module.url(forResource: "contentFilter", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let contentFilter = try JSONDecoder().decode(ContentFilter.self, from: data)

        XCTAssertEqual(contentFilter.message, mockMessage)
        XCTAssertEqual(contentFilter.reason, .other)
    }
}
