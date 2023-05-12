//
//  EmbeddingValueTests.swift
//  PaLMTests
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class EmbeddingValueTests: XCTestCase {
    let mockEmbeddingValueFloat: Float = 0.5

    func testInitialization() throws {
        let embeddingValue = EmbeddingValue(value: [mockEmbeddingValueFloat])
        XCTAssertEqual(embeddingValue.value, [mockEmbeddingValueFloat])
    }

    func testDecode() throws {
        let json = try XCTUnwrap(Bundle.module.url(forResource: "embeddingValue", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let embeddingValue = try JSONDecoder().decode(EmbeddingValue.self, from: data)

        XCTAssertEqual(embeddingValue.value, [mockEmbeddingValueFloat])
    }
}
