//
//  EmbeddingsTests.swift
//  PaLMTests
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class EmbeddingsTests: XCTestCase {
    let mockEmbeddingValueFloat: Float = 0.5

    func testInitialization() throws {
        let mockEmbeddingValue = EmbeddingValue(value: [mockEmbeddingValueFloat])
        let embeddings = Embeddings(embedding: [mockEmbeddingValue])
        XCTAssertEqual(embeddings.embedding.count, 1)
        let first = try XCTUnwrap(embeddings.embedding.first)
        let firstValue = try XCTUnwrap(first.value.first)
        XCTAssertEqual(firstValue, mockEmbeddingValueFloat)
    }

    func testDecode() throws {
        let json = try XCTUnwrap(Bundle.module.url(forResource: "embeddings", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let embeddings = try JSONDecoder().decode(Embeddings.self, from: data)

        XCTAssertEqual(embeddings.embedding.count, 1)
        let first = try XCTUnwrap(embeddings.embedding.first)
        let firstValue = try XCTUnwrap(first.value.first)
        XCTAssertEqual(firstValue, mockEmbeddingValueFloat)
    }
}
