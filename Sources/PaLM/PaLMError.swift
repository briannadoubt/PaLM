//
//  PaLMError.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

public enum PaLMError: LocalizedError {

    case badUrl
    case unknownResponseType
    case invalidStatusCode(Int)

    // Please add a unit test whenever a case is added

    public var code: Int {
        switch self {
        case .badUrl:
            return 0
        case .unknownResponseType:
            return 1
        case .invalidStatusCode(let int):
            return int
        }
    }
}
