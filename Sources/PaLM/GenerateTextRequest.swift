//
//  GenerateTextRequest.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// Generates a response from the model given an input message.
public struct GenerateTextRequest: Encodable {
    /// Required. The free-form input text given to the model as a prompt.
    ///
    /// Given a prompt, the model will generate a TextCompletion response it predicts as the completion of the input text.
    var prompt: TextPrompt

    /// A list of unique SafetySetting instances for blocking unsafe content.
    ///
    /// that will be enforced on the GenerateTextRequest.prompt and GenerateTextResponse.candidates. There should not be more than one setting for each SafetyCategory type. The API will block any prompts and responses that fail to meet the thresholds set by these settings. This list overrides the default settings for each SafetyCategory specified in the safetySettings. If there is no SafetySetting for a given SafetyCategory provided in the list, the API will use the default safety setting for that category.
    var safetySettings: [SafetySetting] = []

    /// The set of character sequences (up to 5) that will stop output generation. If specified, the API will stop at the first appearance of a stop sequence. The stop sequence will not be included as part of the response.
    var stopSequences: [String] = []

    /// Controls the randomness of the output. Note: The default value varies by model, see the Model.temperature attribute of the Model returned the getModel function.
    ///
    /// Values can range from [0.0,1.0], inclusive. A value closer to 1.0 will produce responses that are more varied and creative, while a value closer to 0.0 will typically result in more straightforward responses from the model.
    var temperature: Float = 0.5

    /// Number of generated responses to return.
    ///
    /// This value must be between [1, 8], inclusive. If unset, this will default to 1.
    var candidateCount: Int = 1

    /// The maximum number of tokens to include in a candidate.
    ///
    /// If unset, this will default to 64.
    var maxOutputTokens: Int = 64

    /// The maximum cumulative probability of tokens to consider when sampling.
    ///
    /// The model uses combined Top-k and nucleus sampling.
    ///
    /// Tokens are sorted based on their assigned probabilities so that only the most liekly tokens are considered. Top-k sampling directly limits the maximum number of tokens to consider, while Nucleus sampling limits number of tokens based on the cumulative probability.
    ///
    /// Note: The default value varies by model, see the Model.top_p attribute of the Model returned the getModel function.
    var topP: Float

    /// The maximum number of tokens to consider when sampling.
    ///
    /// The model uses combined Top-k and nucleus sampling.
    ///
    /// Top-k sampling considers the set of topK most probable tokens. Defaults to 40.
    ///
    /// Note: The default value varies by model, see the Model.top_k attribute of the Model returned the getModel function.
    var topK: Int = 40
}
