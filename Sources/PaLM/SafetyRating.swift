//
//  SafetyRating.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Safety rating for a piece of content.
///
/// The safety rating contains the category of harm and the harm probability level in that category for a piece of content. Content is classified for safety across a number of harm categories and the probability of the harm classification is included here.
public struct SafetyRating: Codable, Equatable {
    /// Required. The category for this rating.
    var category: HarmCategory

    /// Required. The category for this rating.
    var probability: HarmProbability
}
