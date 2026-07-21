let package = Package(
    name: "IDDigitalSDK",
    products: [
        .library(name: "IDDigitalSDK", targets: ["IDDigitalSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "IDDigitalSDK",
            url: "https://your-storage.com/IDDigitalSDK.zip",
            checksum: "43d3d030dc310184fcbdc017e9b6abded1f830d0acf6752b25e1c35c405620d1"
        )
    ]
)
