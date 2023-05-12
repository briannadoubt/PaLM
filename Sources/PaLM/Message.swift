//
//  Message.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// The base unit of structured text.
///
/// A ``Message`` includes an author and the content of the ``Message``.
///
/// The author is used to tag messages when they are fed to the model as text.
public struct Message: Codable, Equatable {
    /// Optional. The author of this ``Message``.
    ///
    /// This serves as a key for tagging the content of this ``Message`` when it is fed to the model as text.
    ///
    /// The author can be any alphanumeric string.
    public var author: String?

    /// Required. The text content of the structured ``Message``.
    public var content: String

    /// Output only. Citation information for model-generated content in this Message.
    ///
    /// If this Message was generated as output from the model, this field may be populated with attribution information for any text included in the content. This field is used only on output.
    public var citationMetadata: CitationMetadata?
}
