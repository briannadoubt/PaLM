//
//  Embeddings.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// The response to a `EmbedTextRequest`.
public struct Embeddings: Codable, Equatable {
    /// Output only. The embedding generated from the input text.
    var embedding: [EmbeddingValue]
}
