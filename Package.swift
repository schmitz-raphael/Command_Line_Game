// swift-tools-version:5.5
import PackageDescription

let package = Package(
	name: "prog2-2023-project",
	products: [
		.executable(name: "prog2-2023-project", targets: ["prog2-2023-project"]),
	],
	dependencies: [
		.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.1.0"),
	],
	targets: [
		.executableTarget(name: "prog2-2023-project", dependencies: [])
	]
)
