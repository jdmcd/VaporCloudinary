// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "VaporCloudinary",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor", majorVersion: 1, minor: 5)
    ]
)
