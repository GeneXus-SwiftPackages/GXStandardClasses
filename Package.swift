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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXDataLayer.git", revision: "2b1420b000073afd1f12b87c84c79b5661c4cc0b"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXFoundation.git", revision: "195f2873dc3ed7d924d9a72b86f629015eadef71"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXObjectsModel.git", revision: "2850c07662d2291aeb37634ebb5c498d5ad0d6a4"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/YAJL.git", revision: "9c402239ffc52982baa281b75e0e85f29eb1d322")
	],
	targets: [
		.target(name: "GXStandardClassesWrapper",
				dependencies: [
					"GXStandardClasses",
					.product(name: "GXDataLayer", package: "GXDataLayer", condition: .when(platforms: [.watchOS, .tvOS, .iOS])),
					.product(name: "GXFoundation", package: "GXFoundation", condition: .when(platforms: [.iOS])),
					.product(name: "GXObjectsModel", package: "GXObjectsModel", condition: .when(platforms: [.iOS])),
					.product(name: "YAJL", package: "YAJL", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXStandardClasses",
			url: "https://pkgs.genexus.dev/iOS/beta/GXStandardClasses-1.0.0-beta+20230609175617.xcframework.zip",
			checksum: "55a39180cb5ca2a61d25ada53944c746d42b08b7ef40a931682b742680fd4514"
		)
	]
)