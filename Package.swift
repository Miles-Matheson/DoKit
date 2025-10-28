// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "DoraemonKit",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // 核心库
        .library(
            name: "DoraemonKit",
            targets: ["DoraemonKit"]),
        
        // 功能模块
        .library(
            name: "DoraemonKitCore",
            targets: ["DoraemonKitCore"]),
        
        .library(
            name: "DoraemonKitFoundation",
            targets: ["DoraemonKitFoundation"]),
        
        .library(
            name: "DoraemonKitWithMultiControl",
            targets: ["DoraemonKitWithMultiControl"]),
        
        .library(
            name: "DoraemonKitWithLogger",
            targets: ["DoraemonKitWithLogger"]),
        
        .library(
            name: "DoraemonKitWithGPS",
            targets: ["DoraemonKitWithGPS"]),
        
        .library(
            name: "DoraemonKitWithLoad",
            targets: ["DoraemonKitWithLoad"]),
        
        .library(
            name: "DoraemonKitWithDatabase",
            targets: ["DoraemonKitWithDatabase"]),
        
        .library(
            name: "DoraemonKitWithMLeaksFinder",
            targets: ["DoraemonKitWithMLeaksFinder"]),
        
        .library(
            name: "DoraemonKitWithWeex",
            targets: ["DoraemonKitWithWeex"]),
        
        // DoKit模块
        .library(
            name: "DoKit",
            targets: ["DoKit"]),
    ],
    dependencies: [
        // 外部依赖
        .package(name: "AFNetworking", url: "https://github.com/AFNetworking/AFNetworking.git", from: "3.2.0"),
        .package(name: "FMDB", url: "https://github.com/ccgus/fmdb.git", from: "2.7.0"),
        .package(name: "GCDWebServer", url: "https://github.com/swisspol/GCDWebServer.git", from: "3.5.0"),
        .package(name: "JSONModel", url: "https://github.com/jsonmodel/jsonmodel.git", from: "1.8.0"),
        .package(name: "Mantle", url: "https://github.com/Mantle/Mantle.git", from: "2.2.0"),
        .package(name: "SocketRocket", url: "https://github.com/facebook/SocketRocket.git", from: "0.6.0"),
        .package(name: "CocoaAsyncSocket", url: "https://github.com/robbiehanson/CocoaAsyncSocket.git", from: "7.6.0"),
        .package(name: "CocoaHTTPServer", url: "https://github.com/robbiehanson/CocoaHTTPServer.git", from: "2.3.0"),
        .package(name: "CocoaLumberjack", url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.7.0"),
        .package(name: "Masonry", url: "https://github.com/SnapKit/Masonry.git", from: "1.1.0"),
    ],
    targets: [
        // 基础目标 - 完整库
        .target(
            name: "DoraemonKit",
            dependencies: [
                "DoraemonKitCore",
                "DoraemonKitFoundation",
                "DoraemonKitWithMultiControl",
                "DoraemonKitWithLogger",
                "DoraemonKitWithGPS",
                "DoraemonKitWithLoad",
                "DoraemonKitWithDatabase",
                "DoraemonKitWithMLeaksFinder",
                "DoraemonKitWithWeex",
            ],
            path: "iOS/DoraemonKit/Src"
        ),
        
        // Core 模块
        .target(
            name: "DoraemonKitCore",
            dependencies: [
                "AFNetworking",
                "FMDB",
                "GCDWebServer",
                "JSONModel",
            ],
            path: "iOS/DoraemonKit/Src/Core"
        ),
        
        // Foundation 模块
        .target(
            name: "DoraemonKitFoundation",
            dependencies: [
                "Mantle",
                "SocketRocket",
            ],
            path: "iOS/DoraemonKit/Src/Foundation"
        ),
        
        // MultiControl 模块
        .target(
            name: "DoraemonKitWithMultiControl",
            dependencies: [
                "DoraemonKitCore",
                "DoraemonKitFoundation",
                "AFNetworking",
                "CocoaHTTPServer",
                "CocoaLumberjack",
                "Masonry",
                "SocketRocket",
            ],
            path: "iOS/DoraemonKit/Src/MultiControl"
        ),
        
        // Logger 模块
        .target(
            name: "DoraemonKitWithLogger",
            dependencies: [
                "DoraemonKitCore",
                "CocoaLumberjack",
            ],
            path: "iOS/DoraemonKit/Src/Logger"
        ),
        
        // GPS 模块
        .target(
            name: "DoraemonKitWithGPS",
            dependencies: [
                "DoraemonKitCore",
            ],
            path: "iOS/DoraemonKit/Src/GPS"
        ),
        
        // Load 模块
        .target(
            name: "DoraemonKitWithLoad",
            dependencies: [
                "DoraemonKitCore",
            ],
            path: "iOS/DoraemonKit/Src/MethodUseTime"
        ),
        
        // Database 模块
        .target(
            name: "DoraemonKitWithDatabase",
            dependencies: [
                "DoraemonKitCore",
                "FMDB",
            ],
            path: "iOS/DoraemonKit/Src/Database"
        ),
        
        // MLeaksFinder 模块
        .target(
            name: "DoraemonKitWithMLeaksFinder",
            dependencies: [
                "DoraemonKitCore",
            ],
            path: "iOS/DoraemonKit/Src/MLeaksFinder"
        ),
        
        // Weex 模块
        .target(
            name: "DoraemonKitWithWeex",
            dependencies: [
                "DoraemonKitCore",
            ],
            path: "iOS/DoraemonKit/Src/Weex"
        ),
        
        // DoKit 模块
        .target(
            name: "DoKit",
            dependencies: [
                "AFNetworking",
                "SocketRocket",
            ],
            path: "iOS/DoKit/Classes"
        )
    ]
)