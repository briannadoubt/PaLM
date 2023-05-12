//
//  ModelsListResponse.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Response from ListModel containing a paginated list of Models.
public struct ModelsListResponse: Codable, Equatable {
    /// The returned Models.
    var models: [Model]

    /// A token, which can be sent as pageToken to retrieve the next page.
    ///
    /// If this field is omitted, there are no more pages.
    var nextPageToken: String?
}
