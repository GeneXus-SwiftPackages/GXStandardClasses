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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", exact: "1.0.0-beta.20230724135409"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", exact: "1.0.0-beta.20230724135409"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", exact: "1.0.0-beta.20230724135409"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", exact: "1.0.0-beta.20230724135409")
	],
	targets: [
		.target(name: "GXStandardClassesWrapper",
				dependencies: [
					"GXStandardClasses",
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.iOS, .tvOS, .watchOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS])),
					.product(name: "YAJL", package: "YAJL", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXStandardClasses",
			url: "https://pkgs.genexus.dev/iOS/beta/GXStandardClasses-1.0.0-beta.20230724135409.xcframework.zip",
			checksum: "516fc395f2f8bc64a02d724043d173871524db69b8805c7bca67192da9f2935f"
		)
	]
)