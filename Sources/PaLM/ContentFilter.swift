//
//  ContentFilter.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Content filtering metadata associated with processing a single request.
///
/// ContentFilter contains a reason and an optional supporting string. The reason may be unspecified.
public struct ContentFilter: Codable, Equatable {
    /// The reason content was blocked during request processing.
    public var reason: BlockedReason

    /// A string that describes the filtering behavior in more detail.
    public var message: String
}
