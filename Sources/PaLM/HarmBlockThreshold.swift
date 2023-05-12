//
//  HarmBlockThreshold.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Block at and beyond a specified harm probability.
public enum HarmBlockThreshold: String, Codable, CaseIterable {
    /// Threshold is unspecified.
    case unspecified = "HARM_BLOCK_THRESHOLD_UNSPECIFIED"

    /// Content with NEGLIGIBLE will be allowed.
    case low = "BLOCK_LOW_AND_ABOVE"

    /// Content with NEGLIGIBLE and LOW will be allowed.
    case medium = "BLOCK_MEDIUM_AND_ABOVE"

    /// Content with NEGLIGIBLE, LOW, and MEDIUM will be allowed.
    case high = "BLOCK_ONLY_HIGH"

    /// All content will be allowed.
    case none = "BLOCK_NONE"
}
