//
//  PaLMTests.swift
//  PaLMTests
//
//  Created by Brianna Zamora on 5/10/23.
//

import XCTest
@testable import PaLM

final class PaLMTests: XCTestCase {

    let mockTokenCountValue = 5
    let mockModel = "testModel"
    let mockVersion = "v1test"
    let mockApiKey = "testApiKey"
    let mockMessage = "This is a message"
    let mockUrlString = "https://example.com"

    let ok = 200
    let notFound = 404

    var mockTokenCount: TokenCount {
        TokenCount(tokenCount: mockTokenCountValue)
    }

    func mockData<T: Encodable>(for mockObject: T) throws -> Data {
        try JSONEncoder().encode(mockObject)
    }

    func httpResponse(statusCode: Int) -> HTTPURLResponse? {
        HTTPURLResponse(
            url: URL(string: mockUrlString)!,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )
    }

    func mockSession<T: Encodable>(for mockObject: T, statusCode: Int) throws -> URLSessionMock {
        URLSessionMock(
            data: try mockData(for: mockObject),
            response: httpResponse(statusCode: statusCode)
        )
    }

    let unknownResponse = URLSessionMock(response: URLResponse())

    // MARK: countMessageTokens(_)

    func testCountMessageTokens() async throws {
        let palm = PaLM(
            model: mockModel,
            version: mockVersion,
            apiKey: mockApiKey,
            session: try mockSession(
                for: mockTokenCount,
                statusCode: ok
            )
        )

        let mockMessage = Message(content: mockMessage)
        let mockPrompt = MessagePrompt(messages: [mockMessage])

        do {
            let result = try await palm.countMessageTokens(prompt: mockPrompt)
            XCTAssertEqual(result.tokenCount, mockTokenCountValue)
        } catch {
            XCTFail("Expected success but received error: \(error)")
        }
    }

    func testCountMessageTokensForUnknownResponseType() async throws {
        let palm = PaLM(
            model: mockModel,
            version: mockVersion,
            apiKey: mockApiKey,
            session: unknownResponse
        )

        let mockMessage = Message(content: mockMessage)
        let mockPrompt = MessagePrompt(messages: [mockMessage])

        do {
            _ = try await palm.countMessageTokens(prompt: mockPrompt)
            XCTFail("Expected badUrl error but no error was thrown")
        } catch PaLMError.unknownResponseType {
            // Test passed
        } catch {
            XCTFail("Expected badUrl error but received different error: \(error)")
        }
    }

    func testCountMessageTokensForInvalidStatusCode() async throws {
        let palm = PaLM(
            model: mockModel,
            version: mockVersion,
            apiKey: mockApiKey,
            session: try mockSession(
                for: mockTokenCount,
                statusCode: notFound
            )
        )

        let mockMessage = Message(content: "This is a message")
        let mockPrompt = MessagePrompt(messages: [mockMessage])

        do {
            _ = try await palm.countMessageTokens(prompt: mockPrompt)
            XCTFail("Expected badUrl error but no error was thrown")
        } catch PaLMError.invalidStatusCode(let statusCode) {
            XCTAssertEqual(statusCode, notFound)
        } catch {
            XCTFail("Expected badUrl error but received different error: \(error)")
        }
    }

    // MARK: embedText(_)

    func testEmbedText() async throws {
        let embeddings = Embeddings(embedding: [EmbeddingValue(value: [0.5])])
        let palm = PaLM(
            model: mockModel,
            version: mockVersion,
            apiKey: mockApiKey,
            session: try mockSession(
                for: embeddings,
                statusCode: 200
            )
        )

        do {
            let result = try await palm.embedText(mockMessage)
            XCTAssertEqual(result, embeddings)
        } catch {
            XCTFail("Expected success but received error: \(error)")
        }
    }

    // MARK: generateText(_)

    func testGenerateText() async throws {
        // Mock a successful response and data
        let mockSafetyRating = SafetyRating(
            category: .unspecified,
            probability: .unspecified
        )
        let mockCitationSource = CitationSource(
            startIndex: 2,
            endIndex: 5,
            uri: "testUri",
            license: "testLicense"
        )
        let mockCitationMetadata = CitationMetadata(
            citationSources: [mockCitationSource]
        )
        let mockTextCompletion = TextCompletion(
            output: "This is a message",
            safetyRatings: [mockSafetyRating],
            citationMetadata: mockCitationMetadata
        )
        let mockContentFilter = ContentFilter(
            reason: .unspecified,
            message: "This is a message"
        )
        let mockSafetySetting = SafetySetting(
            category: .unspecified,
            threshold: .unspecified
        )
        let mockSafetyFeedback = SafetyFeedback(
            rating: mockSafetyRating,
            setting: mockSafetySetting
        )
        let mockTextResponse = GenerateTextResponse(
            candidates: [mockTextCompletion],
            filters: [mockContentFilter],
            safetyFeedback: [mockSafetyFeedback]
        )
        let mockData = try JSONEncoder().encode(mockTextResponse)
        let mockResponse = HTTPURLResponse(
            url: URL(string: "https://example.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        let mockSession = URLSessionMock(data: mockData, response: mockResponse)

        let palm = PaLM(model: mockModel, version: mockVersion, apiKey: mockApiKey, session: mockSession)

        let mockPrompt = TextPrompt(text: "This is a message")

        do {
            let result = try await palm.generateText(
                prompt: mockPrompt,
                safetySettings: [mockSafetySetting],
                stopSequences: ["testStopSequence"],
                temperature: 0.5,
                candidateCount: 1,
                maxOutputTokens: 50,
                topP: 0.5,
                topK: 1
            )
            let firstCandidate = try XCTUnwrap(result.candidates.first)
            XCTAssertEqual(firstCandidate, mockTextCompletion)
            let firstFilter = try XCTUnwrap(result.filters.first)
            XCTAssertEqual(firstFilter, mockContentFilter)
        } catch {
            XCTFail("Expected success but received error: \(error)")
        }
    }

    // MARK: get()

    func testGet() async throws {
        let expectedModel = Model(
            name: "testModel",
            baseModelId: "rawr",
            version: "1.0.0",
            displayName: "Rawr",
            description: "A model that goes \"Rawr\"",
            inputTokenLimit: 8196,
            outputTokenLimit: 1024,
            supportedGenerationMethods: ["testGenerationMethod"],
            temperature: 0.5,
            topP: 0.5,
            topK: 1
        )
        let mockData = try JSONEncoder().encode(expectedModel)
        let mockResponse = HTTPURLResponse(
            url: URL(string: "https://example.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        let mockSession = URLSessionMock(data: mockData, response: mockResponse)

        let palm = PaLM(model: expectedModel.name, version: expectedModel.version, apiKey: mockApiKey, session: mockSession)

        do {
            let model = try await palm.get()
            XCTAssertEqual(model, expectedModel)
        } catch {
            XCTFail("Expected success but received error: \(error)")
        }
    }

    // MARK: list()

    func testList() async throws {
        let expectedModel = Model(
            name: "testModel",
            baseModelId: "rawr",
            version: "1.0.0",
            displayName: "Rawr",
            description: "A model that goes \"Rawr\"",
            inputTokenLimit: 8196,
            outputTokenLimit: 1024,
            supportedGenerationMethods: ["testGenerationMethod"],
            temperature: 0.5,
            topP: 0.5,
            topK: 1
        )
        let expectedResponse = ModelsListResponse(models: [expectedModel])
        let mockData = try JSONEncoder().encode(expectedResponse)
        let mockResponse = HTTPURLResponse(
            url: URL(string: "https://example.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        let mockSession = URLSessionMock(data: mockData, response: mockResponse)

        let palm = PaLM(model: expectedModel.name, version: expectedModel.version, apiKey: mockApiKey, session: mockSession)

        do {
            let modelsResponse = try await palm.list()
            XCTAssertEqual(modelsResponse, expectedResponse)
        } catch {
            XCTFail("Expected success but received error: \(error)")
        }
    }
}

class URLSessionMock: URLSessionProtocol {
    var mockData: Data?
    var mockResponse: URLResponse?
    var mockError: Error?

    init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.mockData = data
        self.mockResponse = response
        self.mockError = error
    }

    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = mockError {
            throw error
        } else {
            return (mockData ?? Data(), mockResponse ?? URLResponse())
        }
    }
}
