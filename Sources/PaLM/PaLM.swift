//
//  PaLM.swift
//  PaLM
//
//  Created by Brianna Zamora on 5/10/23.
//

import Foundation

/// The PaLM API allows developers to build generative AI applications using the PaLM model. Large Language Models (LLMs) are a powerful, versatile type of machine learning model that enables computers to comprehend and generate natural language through a series of prompts. The PaLM API is based on Google's next generation LLM, PaLM. It excels at a variety of different tasks like code generation, reasoning, and writing. You can use the PaLM API to build generative AI applications for use cases like content generation, dialogue agents, summarization and classification systems, and more.
///
/// This service has the following service endpoint and all URIs are relative to this service endpoint: `https://generativelanguage.googleapis.com`
public actor PaLM {
    var model: String
    var version: String
    var apiKey: String

    var session: URLSessionProtocol

    init(
        model: String,
        version: String = "v1beta2",
        apiKey: String,
        session: URLSessionProtocol = URLSession.shared
    ) {
        self.model = model
        self.version = version
        self.apiKey = apiKey

        self.session = session
    }

    private func urlString(for function: String? = nil) -> String {
        var baseUrl = "https://generativelanguage.googleapis.com/"
        baseUrl.append(version + "/")
        baseUrl.append("models/\(model)")
        if let function {
            baseUrl.append(":" + function)
        }
        baseUrl.append("?key=" + apiKey)
        return baseUrl
    }

    /// Runs a model's tokenizer on a string and returns the token count.
    ///
    /// HTTP Request:  `POST https://generativelanguage.googleapis.com/v1beta2/{model=models/*}:countMessageTokens`
    ///
    /// The URL uses gRPC Transcoding syntax.
    ///
    /// For example:
    /// ```
    /// $curl https://generativelanguage.googleapis.com/v1beta2/models/chat-bison-001:countMessageTokens?key=$PALM_API_KEY \
    /// -H 'Content-Type: application/json' \
    /// -X POST \
    /// -d '{
    ///     "prompt": {
    ///         "messages": [
    ///             {"content":"How many tokens?"},
    ///             {"content": "For this whole conversation?" }
    ///         ]
    ///     }
    /// }'
    /// ```
    /// - Returns: `TokenCount` The number of tokens that the model tokenizes the prompt into.
    /// - Parameter model: Required. The model's resource name. This serves as an ID for the Model to use.
    ///     This name should match a model name returned by the models.list method.
    ///     Format: `models/{model}`
    public func countMessageTokens(prompt: MessagePrompt) async throws -> TokenCount {
        guard let url = URL(string: urlString(for: "countMessageTokens")) else {
            throw PaLMError.badUrl
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(CountMessageTokensRequest(prompt: prompt))

        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PaLMError.unknownResponseType
        }
        guard httpResponse.statusCode >= 200, httpResponse.statusCode < 300 else {
            throw PaLMError.invalidStatusCode(httpResponse.statusCode)
        }
        let tokenCount = try JSONDecoder().decode(TokenCount.self, from: data)
        return tokenCount
    }

    /// Generates an embedding from the model given an input message.
    ///
    /// HTTP Request: `POST https://generativelanguage.googleapis.com/v1beta2/{model=models/*}:embedText`
    ///
    /// The URL uses gRPC Transcoding syntax.
    ///
    /// For example:
    /// ```
    /// $curl https://generativelanguage.googleapis.com/v1beta2/models/embedding-gecko-001:embedText?key=$PALM_API_KEY \
    /// -H 'Content-Type: application/json' \
    /// -X POST \
    /// -d '{"text": "say something nice!"}'
    /// ```
    /// - Parameter text: Required. The free-form input text that the model will turn into an embedding.
    /// - Returns: The embedding generated from the input text.
    public func embedText(_ text: String) async throws -> Embeddings {
        guard let url = URL(string: urlString(for: "embedText")) else {
            throw PaLMError.badUrl
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(EmbedTextRequest(text: text))

        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PaLMError.unknownResponseType
        }
        guard httpResponse.statusCode >= 200, httpResponse.statusCode < 300 else {
            throw PaLMError.invalidStatusCode(httpResponse.statusCode)
        }
        let embeddings = try JSONDecoder().decode(Embeddings.self, from: data)
        return embeddings
    }

    /// Generates a response from the model given an input ``MessagePrompt``.
    ///
    /// HTTP request: `POST https://generativelanguage.googleapis.com/v1beta2/{model=models/*}:generateMessage`
    ///
    /// The URL uses gRPC Transcoding syntax.
    ///
    /// For example:
    /// ```
    /// curl https://autopush-generativelanguage.sandbox.googleapis.com/v1beta2/models/chat-bison-001:generateMessage?key=$PALM_API_KEY  \
    /// -H 'Content-Type: application/json' \
    /// -X POST \
    /// -d '{
    ///     "prompt": {"messages": [{"content":"hi"}]},
    ///     "temperature": 0.1,
    ///     "candidate_count": 1}'
    /// ```
    /// - Parameters:
    ///   - prompt: Required. The structured textual input given to the model as a prompt.
    ///   - temperature: Optional. Controls the randomness of the output.
    ///   - candidateCount: Optional. The number of generated response messages to return.
    ///   - topP: Optional. The maximum cumulative probability of tokens to consider when sampling.
    ///   - topK: Optional. The maximum number of tokens to consider when sampling.
    /// - Returns: The response from the model. This includes candidate messages and conversation history in the form of chronologically-ordered messages.
    public func generateMessage(
        prompt: MessagePrompt,
        temperature: Float? = nil,
        candidateCount: Int? = nil,
        topP: Float? = nil,
        topK: Int? = nil
    ) async throws -> GenerateMessageResponse {
        guard let url = URL(string: urlString(for: "embedText")) else {
            throw PaLMError.badUrl
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        let body = GenerateMessageRequest(
            prompt: prompt,
            temperature: temperature,
            candidateCount: candidateCount,
            topP: topP,
            topK: topK
        )
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PaLMError.unknownResponseType
        }
        guard httpResponse.statusCode >= 200, httpResponse.statusCode < 300 else {
            throw PaLMError.invalidStatusCode(httpResponse.statusCode)
        }
        let generateMessageResponse = try JSONDecoder().decode(GenerateMessageResponse.self, from: data)
        return generateMessageResponse
    }

    /// Generates a response from the model given an input message.
    ///
    /// HTTP request: `POST https://generativelanguage.googleapis.com/v1beta2/{model=models/*}:generateText`
    ///
    /// The URL uses gRPC Transcoding syntax.
    ///
    /// For example:
    /// ```
    /// curl https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=$PALM_API_KEY \
    /// -H 'Content-Type: application/json' \
    /// -X POST \
    /// -d '{
    ///     "prompt": {
    ///           "text": "Write a story about a magic backpack."
    ///           },
    ///     "temperature": 1.0,
    ///     "candidate_count": 2}'
    /// ```
    /// - Parameters:
    ///   - prompt: Required. The free-form input text given to the model as a prompt.
    ///   - safetySettings: A list of unique SafetySetting instances for blocking unsafe content.
    ///   - stopSequences: The set of character sequences (up to 5) that will stop output generation. If specified, the API will stop at the first appearance of a stop sequence. The stop sequence will not be included as part of the response.
    ///   - temperature: Controls the randomness of the output. Note: The default value varies by model, see the Model.temperature attribute of the Model returned the getModel function.
    ///   - candidateCount: Number of generated responses to return.
    ///   - maxOutputTokens: The maximum number of tokens to include in a candidate.
    ///   - topP: The maximum cumulative probability of tokens to consider when sampling.
    ///   - topK: The maximum number of tokens to consider when sampling.
    /// - Returns: The response from the model, including candidate completions.
    public func generateText(
        prompt: TextPrompt,
        safetySettings: [SafetySetting] = [],
        stopSequences: [String] = [],
        temperature: Float = 0.5,
        candidateCount: Int = 1,
        maxOutputTokens: Int = 64,
        topP: Float,
        topK: Int = 40
    ) async throws -> GenerateTextResponse {
        guard let url = URL(string: urlString(for: "embedText")) else {
            throw PaLMError.badUrl
        }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        let body = GenerateTextRequest(
            prompt: prompt,
            safetySettings: safetySettings,
            stopSequences: stopSequences,
            temperature: temperature,
            candidateCount: candidateCount,
            maxOutputTokens: maxOutputTokens,
            topP: topP,
            topK: topK
        )
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PaLMError.unknownResponseType
        }
        guard httpResponse.statusCode >= 200, httpResponse.statusCode < 300 else {
            throw PaLMError.invalidStatusCode(httpResponse.statusCode)
        }
        let generateTextResponse = try JSONDecoder().decode(GenerateTextResponse.self, from: data)
        return generateTextResponse
    }

    /// Gets information about a specific Model.
    ///
    /// HTTP Request: `GET https://generativelanguage.googleapis.com/v1beta2/{name=models/*}`
    ///
    /// The URL uses gRPC Transcoding syntax.
    ///
    /// For example:
    /// ```
    /// curl https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001?key=$PALM_API_KEY
    /// ```
    public func get() async throws -> Model {
        guard let url = URL(string: urlString()) else {
            throw PaLMError.badUrl
        }
        let request = URLRequest(url: url)
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PaLMError.unknownResponseType
        }
        guard httpResponse.statusCode >= 200, httpResponse.statusCode < 300 else {
            throw PaLMError.invalidStatusCode(httpResponse.statusCode)
        }
        let model = try JSONDecoder().decode(Model.self, from: data)
        return model
    }

    /// Lists models available through the API.
    ///
    /// HTTP Request: `GET https://generativelanguage.googleapis.com/v1beta2/models`
    ///
    /// The URL uses gRPC Transcoding syntax.
    ///
    /// For example:
    /// ```
    /// curl https://generativelanguage.googleapis.com/v1beta2/models?key=$PALM_API_KEY
    /// ```
    public func list(pageSize: Int = 50, pageToken: String? = nil) async throws -> ModelsListResponse {
        var urlString = "https://generativelanguage.googleapis.com/v1beta2/models?key=\(apiKey)"
        urlString.append("&pageSize=\(pageSize)")
        if let pageToken {
            urlString.append("&pageToken=\(pageToken)")
        }
        guard let url = URL(string: urlString) else {
            throw PaLMError.badUrl
        }
        let request = URLRequest(url: url)
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw PaLMError.unknownResponseType
        }
        guard httpResponse.statusCode >= 200, httpResponse.statusCode < 300 else {
            throw PaLMError.invalidStatusCode(httpResponse.statusCode)
        }
        let list = try JSONDecoder().decode(ModelsListResponse.self, from: data)
        return list
    }
}
