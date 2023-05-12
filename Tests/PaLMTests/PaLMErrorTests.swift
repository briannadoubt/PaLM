//
//  PaLMErrorTests.swift
//  
//
//  Created by Brianna Zamora on 5/12/23.
//

import XCTest
@testable import PaLM

final class PaLMErrorTests: XCTestCase {

    func testCases() {
        XCTAssertEqual(PaLMError.badUrl.code, 0)
        XCTAssertEqual(PaLMError.unknownResponseType.code, 1)
        XCTAssertEqual(PaLMError.invalidStatusCode(404).code, 404)
    }

}
