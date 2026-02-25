// swift-tools-version: 6.2
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
            path: "Sources/Keychain",
            exclude: [
                "../Sources/Keychain/Project.swift",
                "../Tuist"
            ]
        )
    ]
)
