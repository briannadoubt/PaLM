//
//  EmbedTextRequest.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// The request body to `PaLM.embedText(_)`
public struct EmbedTextRequest: Encodable {
    /// Required. The free-form input text that the model will turn into an embedding.
    public var text: String
}
