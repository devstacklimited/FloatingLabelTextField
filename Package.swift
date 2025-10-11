// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FloatingLabelTextField",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "FloatingLabelTextField",
            targets: ["FloatingLabelTextField"]
        ),
    ],
    targets: [
        .target(
            name: "FloatingLabelTextField"
        ),
        .testTarget(
            name: "FloatingLabelTextFieldTests",
            dependencies: ["FloatingLabelTextField"]
        ),
    ]
)
