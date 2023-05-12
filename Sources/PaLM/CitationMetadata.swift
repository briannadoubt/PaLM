//
//  CitationMetadata.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// A collection of source attributions for a piece of content.
public struct CitationMetadata: Codable, Equatable {
    /// Citations to sources for a specific response.
    public var citationSources: [CitationSource]
}
