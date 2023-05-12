//
//  SafetySetting.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Safety setting, affecting the safety-blocking behavior.
///
/// Passing a safety setting for a category changes the allowed proability that content is blocked.
public struct SafetySetting: Codable {
    /// Required. The category for this setting.
    var category: HarmCategory

    /// Required. Controls the probability threshold at which harm is blocked.
    var threshold: HarmBlockThreshold
}
