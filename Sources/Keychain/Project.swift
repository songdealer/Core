import ProjectDescription

let project = Project(
    name: "Keychain",
    targets: [
        .target(
            name: "Keychain",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.ming.Core.Keychain",
            infoPlist: .default,
            buildableFolders: [
                "Sources",
                "Resources",
            ],
            dependencies: []
        ),
        .target(
            name: "KeychainTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.ming.Core.KeychainTests",
            infoPlist: .default,
            buildableFolders: [
                "Tests"
            ],
            dependencies: [.target(name: "Keychain")]
        ),
    ]
)
