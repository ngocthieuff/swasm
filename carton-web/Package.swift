// swift-tools-version:5.8
import PackageDescription
let package = Package(
    name: "carton-web",
    products: [
        .executable(name: "carton-web", targets: ["carton-web"])
    ],
    dependencies: [
        .package(url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.15.0")
    ],
    targets: [
        .executableTarget(
            name: "carton-web",
            dependencies: [
                "carton-webLibrary",
                .product(name: "JavaScriptKit", package: "JavaScriptKit")
            ]),
        .target(
            name: "carton-webLibrary",
            dependencies: []),
        .testTarget(
            name: "carton-webLibraryTests",
            dependencies: ["carton-webLibrary"]),
    ]
)