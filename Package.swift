// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXStandardClasses",
	platforms: [.iOS("12.0"), .watchOS("9.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXStandardClasses",
			targets: ["GXStandardClassesWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.5.0-beta.26")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXStandardClasses-1.5.0-beta.26.xcframework.zip",
			checksum: "319c82e92834944033e312567906e1130719d1dc106ed0ed6568111d604a8b6b"
		)
	]
)