//
//  HarmProbability.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// The probability that a piece of content is harmful.
///
/// The classification system gives the probability of the content being unsafe. This does not indicate the severity of harm for a piece of content.
public enum HarmProbability: String, Codable, CaseIterable {
    /// Probability is unspecified.
    case unspecified = "HARM_PROBABILITY_UNSPECIFIED"

    /// Content has a negligible chance of being unsafe.
    case negligible = "NEGLIGIBLE"

    /// Content has a low chance of being unsafe.
    case low = "LOW"

    /// Content has a medium chance of being unsafe.
    case medium = "MEDIUM"

    /// Content has a high chance of being unsafe.
    case high = "HIGH"
}
