//
//  SafetyFeedback.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Safety feedback for an entire request.
///
/// This field is populated if content in the input and/or response is blocked due to safety settings. SafetyFeedback may not exist for every HarmCategory. Each SafetyFeedback will return the safety settings used by the request as well as the lowest HarmProbability that should be allowed in order to return a result.
public struct SafetyFeedback: Codable, Equatable {
    /// Safety rating evaluated from content.
    var rating: SafetyRating

    /// Safety settings applied to the request.
    var setting: SafetySetting
}
