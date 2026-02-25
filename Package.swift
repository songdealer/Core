// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Keychain",
            targets: ["Keychain"]
        ),
        .library(
            name: "Test",
            targets: ["Test"]
        )
    ],
    targets: [
        .target(
            name: "Keychain",
            path: "Sources/Keychain"
        ),
        .target(
            name: "Test",
            path: "Sources/Test"
        )
    ]
)
