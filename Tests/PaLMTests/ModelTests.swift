//
//  ModelTests.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class ModelTests: XCTestCase {

    func testInitialization() {
        _ = Model(
            name: "models/text-bison-001",
            baseModelId: "001",
            version: "001",
            displayName: "Text Bison",
            description: "Model targeted for text generation.",
            inputTokenLimit: 8196,
            outputTokenLimit: 1024,
            supportedGenerationMethods: ["generateText"],
            temperature: 0.7,
            topP: 0.95,
            topK: 40
        )
    }

    func testDecoding() throws {
        let expectedModel = Model(
            name: "models/text-bison-001",
            baseModelId: "001",
            version: "001",
            displayName: "Text Bison",
            description: "Model targeted for text generation.",
            inputTokenLimit: 8196,
            outputTokenLimit: 1024,
            supportedGenerationMethods: ["generateText"],
            temperature: 0.7,
            topP: 0.95,
            topK: 40
        )

        let json = try XCTUnwrap(Bundle.module.url(forResource: "model", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let model = try JSONDecoder().decode(Model.self, from: data)

        XCTAssertEqual(model, expectedModel)
    }

}
