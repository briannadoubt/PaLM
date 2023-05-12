//
//  TokenCount.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

public struct TokenCount: Codable, Equatable {
    /// The number of tokens that the model tokenizes the prompt into.
    ///
    /// Always non-negative.
    public var tokenCount: Int
}
