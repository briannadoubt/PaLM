// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "PaLM",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "PaLM", targets: ["PaLM"]),
    ],
    targets: [
        .target(name: "PaLM", dependencies: []),
        .testTarget(
            name: "PaLMTests",
            dependencies: ["PaLM"],
            resources: [
                .copy("Resources/citationMetadata.json"),
                .copy("Resources/citationSource.json"),
                .copy("Resources/contentFilter.json"),
                .copy("Resources/embeddings.json"),
                .copy("Resources/embeddingValue.json"),
                .copy("Resources/generateMessageResponse.json"),
                .copy("Resources/generateTextResponse.json"),
                .copy("Resources/message.json"),
                .copy("Resources/messagePrompt.json"),
                .copy("Resources/model.json"),
                .copy("Resources/modelListResponse.json"),
                .copy("Resources/safetyFeedback.json"),
                .copy("Resources/safetyRating.json"),
                .copy("Resources/safetySetting.json"),
                .copy("Resources/textCompletion.json"),
                .copy("Resources/textPrompt.json"),
                .copy("Resources/tokenCount.json"),
            ]
        ),
    ]
)
