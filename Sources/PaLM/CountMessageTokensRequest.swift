//
//  CountMessageTokensRequest.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// The request body to `PaLM.countMessageTokens(_)`
public struct CountMessageTokensRequest: Encodable {
    /// Required. The prompt, whose token count is to be returned.
    var prompt: MessagePrompt
}
