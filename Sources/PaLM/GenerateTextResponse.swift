//
//  GenerateTextResponse.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// The response from the model, including candidate completions.
public struct GenerateTextResponse: Codable, Equatable {
    /// Candidate responses from the model.
    var candidates: [TextCompletion]

    /// A set of content filtering metadata for the prompt and response text.
    ///
    /// This indicates which SafetyCategory(s) blocked a candidate from this response, the lowest HarmProbability that triggered a block, and the HarmThreshold setting for that category. This indicates the smallest change to the SafetySettings that would be necessary to unblock at least 1 response.
    ///
    /// The blocking is configured by the SafetySettings in the request (or the default SafetySettings of the API).
    var filters: [ContentFilter]

    /// Returns any safety feedback related to content filtering.
    var safetyFeedback: [SafetyFeedback]
}
