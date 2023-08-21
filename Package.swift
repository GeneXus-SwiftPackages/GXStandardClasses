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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.1.2"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.1.2"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.1.2"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "1.1.2")
	],
	targets: [
		.target(name: "GXStandardClassesWrapper",
				dependencies: [
					"GXStandardClasses",
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.iOS, .watchOS, .tvOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS])),
					.product(name: "YAJL", package: "YAJL", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXStandardClasses",
			url: "https://pkgs.genexus.dev/iOS/releases/GXStandardClasses-1.1.2.xcframework.zip",
			checksum: "841597a8e98da3ef84bde1900903b3103d7d346fd11e2f5da0a0fe6f12f1d5af"
		)
	]
)