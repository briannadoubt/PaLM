//
//  BlockedReason.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// A list of reasons why content may have been blocked.
public enum BlockedReason: String, Codable, CaseIterable {
    /// A blocked reason was not specified.
    case unspecified = "BLOCKED_REASON_UNSPECIFIED"

    /// Content was blocked by safety settings.
    case safety = "SAFETY"

    /// Content was blocked, but the reason is uncategorized.
    case other = "OTHER"
}
