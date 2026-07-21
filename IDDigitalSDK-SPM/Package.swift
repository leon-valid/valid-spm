// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "IDDigitalSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "IDDigitalSDK",
            targets: ["IDDigitalSDK"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "IDDigitalSDK",
            url: "https://github.com/leon-valid/valid-spm/releases/download/1.0.0/IDDigitalSDK-1.0.0.zip",
            checksum: "43d3d030dc310184fcbdc017e9b6abded1f830d0acf6752b25e1c35c405620d1"
        )
    ]
)
