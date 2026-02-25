// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Core",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Keychain",
            targets: ["Keychain"]
        )
    ],
    targets: [
        .target(
            name: "Keychain",
            path: "Core/Keychain"
        )
    ]
)
