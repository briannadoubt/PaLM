//
//  TokenCountTests.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class TokenCountTests: XCTestCase {

    func testInitialization() {
        _ = TokenCount(tokenCount: 0)
    }

    func testDecoding() throws {
        let expectedTokenCount = TokenCount(tokenCount: 0)
        let json = try XCTUnwrap(Bundle.module.url(forResource: "tokenCount", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let tokenCount = try JSONDecoder().decode(TokenCount.self, from: data)
        XCTAssertEqual(tokenCount, expectedTokenCount)
    }

}
