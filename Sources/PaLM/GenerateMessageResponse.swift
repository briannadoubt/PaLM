//
//  GenerateMessageResponse.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// The response from the model.
///
/// This includes candidate messages and conversation history in the form of chronologically-ordered messages.
public struct GenerateMessageResponse: Decodable {
    /// Candidate response messages from the model.
    var candidates: [Message]

    /// The conversation history used by the model.
    var messages: [Message]

    /// A set of content filtering metadata for the prompt and response text.
    ///
    /// This indicates which SafetyCategory(s) blocked a candidate from this response, the lowest HarmProbability that triggered a block, and the HarmThreshold setting for that category. This indicates the smallest change to the SafetySettings that would be necessary to unblock at least 1 response.
    ///
    /// The blocking is configured by the SafetySettings in the request (or the default SafetySettings of the API).
    var filters: [ContentFilter]
}
