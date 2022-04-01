// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftScooters",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftScooters",
            targets: ["SwiftScooters"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.0")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0"),
        .package(url: "https://github.com/WeTransfer/Mocker.git", .upToNextMajor(from: "2.3.0")),
        .package(url: "https://github.com/mi11y/SwiftHelpers.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftScooters",
            dependencies: ["Alamofire",
                           "SwiftyJSON"]),
        .testTarget(
            name: "SwiftScootersTests",
            dependencies: ["SwiftScooters", "Alamofire", "SwiftyJSON", "Mocker", "SwiftHelpers"],
            resources: [
                .copy("Resources/LimeScooterResponse.json"),
                .copy("Resources/SpinScooterResponse.json"),
                .copy("Resources/BirdScooterResponse.json"),
                .copy("Resources/BoltScooterResponse.json"),
                .copy("Resources/BiketownResponse.json"),
                .copy("Resources/BiketownStationInformationResponse.json"),
                .copy("Resources/BiketownStatusInformation.json")
            ]
        ),
    ]
)
