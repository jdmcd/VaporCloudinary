// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "VaporCloudinary",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1),
        .Package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", majorVersion: 0)
    ]
)
