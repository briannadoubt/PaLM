//
//  HarmCategory.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// The category of a rating.
///
/// These categories cover various kinds of harms that developers may wish to adjust.
public enum HarmCategory: String, Codable, CaseIterable {
    /// Category is unspecified.
    case unspecified = "HARM_CATEGORY_UNSPECIFIED"

    /// Negative or harmful comments targeting identity and/or protected attribute.
    case derogatory = "HARM_CATEGORY_DEROGATORY"

    /// Content that is rude, disrepspectful, or profane.
    case toxicity = "HARM_CATEGORY_TOXICITY"

    /// Describes scenarios depictng violence against an individual or group, or general descriptions of gore.
    case violence = "HARM_CATEGORY_VIOLENCE"

    /// Contains references to sexual acts or other lewd content.
    case sexual = "HARM_CATEGORY_SEXUAL"

    /// Promotes unchecked medical advice.
    case medical = "HARM_CATEGORY_MEDICAL"

    /// Dangerous content that promotes, facilitates, or encourages harmful acts.
    case dangerous = "HARM_CATEGORY_DANGEROUS"
}
