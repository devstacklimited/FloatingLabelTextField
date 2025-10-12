//
//  Package.swift
//
//  Created by Usama Javed on 12/10/2025.
//
//  Swift Package definition for FloatingLabelTextField.
//  Provides an outlined SwiftUI text field with a floating label.
//
//  License: MIT License
//  Copyright © 2025 Usama Javed. All rights reserved.
//

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
