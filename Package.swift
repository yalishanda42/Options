// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Options",
    products: [
        .library(
            name: "Options",
            targets: ["Options"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Options",
            dependencies: []
        ),
        .testTarget(
            name: "OptionsTests",
            dependencies: ["Options"]
        ),
    ]
)
