//
//  TextCompletion.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Output text returned from a model.
public struct TextCompletion: Codable, Equatable {
    /// Output only. The generated text returned from the model.
    var output: String

    /// Ratings for the safety of a response.
    ///
    /// There is at most one rating per category.
    var safetyRatings: [SafetyRating]

    /// Output only. Citation information for model-generated output in this TextCompletion.
    ///
    /// This field may be populated with attribution information for any text included in the output.
    var citationMetadata: CitationMetadata
}
