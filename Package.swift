// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Leal",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Leal",
            targets: ["Leal"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Leal",
            path: "Sources"
        ),
        .testTarget(
            name: "LealTests",
            dependencies: ["Leal"],
            path: "Tests"
        )
    ]
)
