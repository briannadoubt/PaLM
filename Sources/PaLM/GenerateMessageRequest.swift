//
//  GenerateMessageRequest.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Generates a response from the model given an input MessagePrompt.
public struct GenerateMessageRequest: Encodable {
    /// Required. The structured textual input given to the model as a prompt.
    ///
    /// Given a prompt, the model will return what it predicts is the next message in the discussion.
    var prompt: MessagePrompt

    /// Optional. Controls the randomness of the output.
    ///
    /// Values can range over [0.0,1.0], inclusive. A value closer to 1.0 will produce responses that are more varied, while a value closer to 0.0 will typically result in less surprising responses from the model.
    var temperature: Float?

    /// Optional. The number of generated response messages to return.
    ///
    /// This value must be between [1, 8], inclusive. If unset, this will default to 1.
    var candidateCount: Int?

    /// Optional. The maximum cumulative probability of tokens to consider when sampling.
    ///
    /// The model uses combined Top-k and nucleus sampling.
    ///
    /// Nucleus sampling considers the smallest set of tokens whose probability sum is at least topP.
    var topP: Float?

    /// Optional. The maximum number of tokens to consider when sampling.
    ///
    /// The model uses combined Top-k and nucleus sampling.
    ///
    /// Top-k sampling considers the set of topK most probable tokens.
    var topK: Int?
}
