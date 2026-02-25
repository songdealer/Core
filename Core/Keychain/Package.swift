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
            name: "Keychain",
            path: ""
        )
    ]
)
