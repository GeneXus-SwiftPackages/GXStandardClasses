// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXStandardClasses",
	platforms: [.iOS("12.0"), .watchOS("5.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXStandardClasses",
			targets: ["GXStandardClassesWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.2.0-beta.16")
	],
	targets: [
		.target(name: "GXStandardClassesWrapper",
				dependencies: [
					"GXStandardClasses",
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.iOS, .watchOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXStandardClasses",
			url: "https://pkgs.genexus.dev/iOS/beta/GXStandardClasses-1.2.0-beta.16.xcframework.zip",
			checksum: "99fe667338545588f84b75b58036a0bf820b48dcacee62d81ce492c50036ec89"
		)
	]
)