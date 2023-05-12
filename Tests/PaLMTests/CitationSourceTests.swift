//
//  CitationSourceTests.swift
//  PaLMTests
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class CitationSourceTests: XCTestCase {
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
        XCTAssertEqual(citationSource.startIndex, mockStartIndex)
        XCTAssertEqual(citationSource.endIndex, mockEndIndex)
        XCTAssertEqual(citationSource.uri, mockUri)
        XCTAssertEqual(citationSource.license, mockLicense)
    }

    func testDecode() throws {
        let json = try XCTUnwrap(Bundle.module.url(forResource: "citationSource", withExtension: "json"))
        let data = try Data(contentsOf: json)

        let citationSource = try JSONDecoder().decode(CitationSource.self, from: data)

        XCTAssertEqual(citationSource.startIndex, 2)
        XCTAssertEqual(citationSource.endIndex, 5)
        XCTAssertEqual(citationSource.uri, mockUri)
        XCTAssertEqual(citationSource.license, mockLicense)
    }
}
