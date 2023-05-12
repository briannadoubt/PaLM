//
//  HarmCategoryTests.swift
//  
//
//  Created by Brianna Zamora on 5/11/23.
//

import XCTest
@testable import PaLM

final class HarmCategoryTests: XCTestCase {

    func testCases() {
        XCTAssertEqual(HarmCategory.allCases.count, 7)
        XCTAssertEqual(HarmCategory.unspecified.rawValue, "HARM_CATEGORY_UNSPECIFIED")
        XCTAssertEqual(HarmCategory.derogatory.rawValue, "HARM_CATEGORY_DEROGATORY")
        XCTAssertEqual(HarmCategory.toxicity.rawValue, "HARM_CATEGORY_TOXICITY")
        XCTAssertEqual(HarmCategory.violence.rawValue, "HARM_CATEGORY_VIOLENCE")
        XCTAssertEqual(HarmCategory.sexual.rawValue, "HARM_CATEGORY_SEXUAL")
        XCTAssertEqual(HarmCategory.medical.rawValue, "HARM_CATEGORY_MEDICAL")
        XCTAssertEqual(HarmCategory.dangerous.rawValue, "HARM_CATEGORY_DANGEROUS")
    }

}
