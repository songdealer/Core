import ProjectDescription

let project = Project(
    name: "CoreExample",
    targets: [
        .target(
            name: "CoreExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.ming.Core.Example",
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen": [
                    "UIColorName": "",
                    "UIImageName": ""
                    ],
                "UIUserInterfaceStyle": "Light",
                "UIApplicationSceneManifest": [
                           "UIApplicationSupportsMultipleScenes": false,
                           "UISceneConfigurations": [
                               "UIWindowSceneSessionRoleApplication": [
                                   [
                                       "UISceneConfigurationName": "Default Configuration",
                                       "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                                   ]
                               ]
                           ]
                       ]
            ]),
            buildableFolders: [
                "Sources",
                "Resources",
            ],
            dependencies: [
                .project(target: "Keychain", path: "Core/Keychain")
            ]
        ),
        .target(
            name: "CoreExampleTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.ming.Core.ExampleTests",
            infoPlist: .default,
            buildableFolders: [
                "Tests"
            ],
            dependencies: [
                .target(name: "CoreExample")
            ]
        ),
    ]
)
