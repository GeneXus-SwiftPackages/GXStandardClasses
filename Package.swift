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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.1.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.1.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.1.0-beta.6"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "1.1.0-beta.6")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXStandardClasses-1.1.0-beta.6.xcframework.zip",
			checksum: "8187ef5dd7716803c3570ccac86978f62fd67db9d4d1408fbe65802de2accd23"
		)
	]
)