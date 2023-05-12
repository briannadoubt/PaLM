//
//  TextPrompt.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Text given to the model as a prompt.
///
/// The Model will use this TextPrompt to Generate a text completion.
public struct TextPrompt: Codable, Equatable {
    /// Required. The prompt text.
    var text: String
}
