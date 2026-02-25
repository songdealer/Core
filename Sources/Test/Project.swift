import ProjectDescription

let project = Project(
    name: "Test",
    targets: [
        .target(
            name: "Test",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.ming.Core.Test",
            infoPlist: .default,
            buildableFolders: [
                "Sources",
                "Resources",
            ],
            dependencies: []
        )
    ]
)
