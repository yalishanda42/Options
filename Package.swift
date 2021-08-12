// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OptionSetEnum",
    products: [
        .library(
            name: "OptionSetEnum",
            targets: ["OptionSetEnum"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "OptionSetEnum",
            dependencies: []
        ),
        .testTarget(
            name: "OptionSetEnumTests",
            dependencies: ["OptionSetEnum"]
        ),
    ]
)
