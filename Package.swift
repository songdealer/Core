// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Keychain",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Keychain",
            targets: ["Keychain"]
        )
    ],
    targets: [
        .target(
            name: "Core",
            path: "Core"
        )
        .target(
            name: "Keychain",
            path: "Core/Keychain"
        )
    ]
)
