// SPM Library 용도
// SPM은 모든 소스 코드를 들고가기 때문에 Tuist import 파일들이 타겟 앱에서 Build 에러가 나기 때문에
// 현재 파일 구조와 세팅으로는 적합하지 않다고 판단.
// Project.swift를 SPM에서 exclude하거나 필요한 모듈들만 들고갈 수 있도록 세팅할 수 있을 때 적용해보자.

//// swift-tools-version: 6.2
//import PackageDescription
//
//let package = Package(
//    name: "Core",
//    platforms: [.iOS(.v13)],
//    products: [
//        .library(
//            name: "Keychain",
//            targets: ["Keychain"]
//        )
//    ],
//    targets: [
//        .target(
//            name: "Keychain",
//            path: "Sources/Keychain",
//            exclude: [
//                "../Sources/Keychain/Project.swift",
//                "../Tuist"
//            ]
//        )
//    ]
//)
