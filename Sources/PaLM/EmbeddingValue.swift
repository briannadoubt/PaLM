//
//  EmbeddingValue.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// A list of floats representing the embedding.
public struct EmbeddingValue: Codable, Equatable {
    /// The embedding values.
    var value: [Float]
}
