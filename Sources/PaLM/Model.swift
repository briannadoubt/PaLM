//
//  Model.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

public struct Model: Codable, Equatable {
    /// Required. The resource name of the Model.
    ///
    /// Format: models/{model} with a {model} naming convention of:
    /// `"{baseModelId}-{version}"`
    ///
    /// Examples:
    /// `models/chat-bison-001`
    public var name: String

    /// Required. The name of the base model, pass this to the generation request.
    ///
    /// Examples:
    /// `chat-bison`
    public var baseModelId: String

    /// Required. The version number of the model.
    ///
    /// This represents the major version
    public var version: String

    /// The human-readable name of the model. E.g. "Chat Bison".
    ///
    /// The name can be up to 128 characters long and can consist of any `UTF-8` characters.
    public var displayName: String

    /// A short description of the model.
    public var description: String

    /// Maximum number of input tokens allowed for this model.
    public var inputTokenLimit: Int

    /// Maximum number of output tokens available for this model.
    public var outputTokenLimit: Int

    /// The model's supported generation methods.
    ///
    /// The method names are defined as Pascal case strings, such as `generateMessage` which correspond to API methods.
    public var supportedGenerationMethods: [String]

    /// Controls the randomness of the output.
    ///
    /// Values can range over `[0.0,1.0]`, inclusive. A value closer to `1.0` will produce responses that are more varied, while a value closer to `0.0` will typically result in less surprising responses from the model. This value specifies default to be used by the backend while making the call to the model.
    public var temperature: Float

    /// For Nucleus sampling.
    ///
    /// Nucleus sampling considers the smallest set of tokens whose probability sum is at least `topP`. This value specifies default to be used by the backend while making the call to the model.
    public var topP: Float

    /// For Top-k sampling.
    ///
    /// Top-k sampling considers the set of `topK` most probable tokens. This value specifies default to be used by the backend while making the call to the model.
    public var topK: Int
}
