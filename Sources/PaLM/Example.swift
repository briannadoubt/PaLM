//
//  Example.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// An input/output example used to instruct the Model.
///
/// It demonstrates how the model should respond or format its response.
public struct Example: Codable, Equatable {
    /// An example of an input Message from the user.
    public var input: Message

    /// An example of what the model should output given the input.
    public var output: Message
}
