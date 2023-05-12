//
//  CitationMetadataTests.swift
//  PaLMTests
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class CitationMetadataTests: XCTestCase {

    let mockStartIndex = 2
    let mockEndIndex = 5
    let mockUri = "testUri"
    let mockLicense = "testLicense"

    func testInitialization() throws {
        let citationSource = CitationSource(
            startIndex: mockStartIndex,
            endIndex: mockEndIndex,
            uri: mockUri,
            license: mockLicense
        )
        let metadata = CitationMetadata(
            citationSources: [citationSource]
        )
        XCTAssertEqual(metadata.citationSources.count, 1)
        let first = try XCTUnwrap(metadata.citationSources.first)
        XCTAssertEqual(first, citationSource)
        XCTAssertEqual(first.startIndex, mockStartIndex)
        XCTAssertEqual(first.endIndex, mockEndIndex)
        XCTAssertEqual(first.uri, mockUri)
        XCTAssertEqual(first.license, mockLicense)
    }

    func testDecode() throws {
        let json = try XCTUnwrap(Bundle.module.url(forResource: "citationMetadata", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let metadata = try JSONDecoder().decode(CitationMetadata.self, from: data)

        let citationSource = try XCTUnwrap(metadata.citationSources.first)

        XCTAssertEqual(citationSource.startIndex, 2)
        XCTAssertEqual(citationSource.endIndex, 5)
        XCTAssertEqual(citationSource.uri, mockUri)
        XCTAssertEqual(citationSource.license, mockLicense)
    }
}
