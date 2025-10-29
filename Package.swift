// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DoraemonKitSPM",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "DoraemonKitCore", targets: ["DoraemonKitCore"]),
        .library(name: "DoraemonKitLogger", targets: ["DoraemonKitLogger"])
    ],
    dependencies: [
        // FMDB 官方仓库（已支持 SPM）
        .package(url: "https://github.com/ccgus/fmdb", from: "2.7.9"),
        // CocoaLumberjack 官方 SPM
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        // GCDWebServer 社区镜像（包含 Package.swift）。如需切换其它镜像，请保持产品名一致
        .package(url: "https://github.com/ExistentialAudio/GCDWebServer", from: "3.6.0")
    ],
    targets: [
        // Core：对齐 Podspec 中的 Core 子模块
        .target(
            name: "DoraemonKitCore",
            path: "iOS/DoraemonKit/Src/Core",
            exclude: [],
            resources: [
                // DoKit 资源目录
                .process("../../DoraemonKit/Resource")
            ],
            publicHeadersPath: ".",
            cSettings: [],
            linkerSettings: [],
            dependencies: [
                // GCDWebServer 及其子产品（WebUploader/WebDAV）由该镜像包内暴露，无需单独声明子产品
                .product(name: "GCDWebServer", package: "GCDWebServer"),
                .product(name: "FMDB", package: "fmdb")
            ]
        ),

        // 可选 Logger：对齐 Podspec WithLogger
        .target(
            name: "DoraemonKitLogger",
            path: "iOS/DoraemonKit/Src/Logger",
            exclude: [],
            publicHeadersPath: ".",
            cSettings: [
                .define("DoraemonWithLogger")
            ],
            dependencies: [
                "DoraemonKitCore",
                .product(name: "CocoaLumberjack", package: "CocoaLumberjack")
            ]
        ),

        .testTarget(
            name: "DoraemonKitTests",
            dependencies: ["DoraemonKitCore"],
            path: "iOS/Demo",
            exclude: []
        )
    ]
)


