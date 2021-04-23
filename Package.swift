// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxForm",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "RxForm", targets: ["RxForm"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/denis-sancov/FCB-utils.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RxForm",
            dependencies: [
                "RxSwift", .product(name: "RxCocoa", package: "RxSwift"), "FCB-utils"
            ]
        ),
        .testTarget(name: "RxFormTests", dependencies: ["RxForm"]),

    ],
    swiftLanguageVersions: [.v5]
)
