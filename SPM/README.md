## DoKit for iOS - 使用 SPM（二进制方案A）

本目录说明如何按“方案A（二进制）”通过 Swift Package Manager 引入 DoKit。

### 1. 构建 DoraemonKit.xcframework

建议在仓库根目录执行以下命令（或用 Xcode Archive）：

```bash
set -euo pipefail

ARCHIVE_DIR="./archives"
IOS_ARCHIVE_PATH="$ARCHIVE_DIR/ios_devices.xcarchive"
SIM_ARCHIVE_PATH="$ARCHIVE_DIR/ios_simulators.xcarchive"
OUTPUT_XCFRAMEWORK="./DoraemonKit.xcframework"

mkdir -p "$ARCHIVE_DIR"

# 真机
xcodebuild archive \
  -scheme DoraemonKit \
  -destination "generic/platform=iOS" \
  -archivePath "$IOS_ARCHIVE_PATH" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# 模拟器
xcodebuild archive \
  -scheme DoraemonKit \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "$SIM_ARCHIVE_PATH" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# 合并为 xcframework
xcodebuild -create-xcframework \
  -framework "$IOS_ARCHIVE_PATH/Products/Library/Frameworks/DoraemonKit.framework" \
  -framework "$SIM_ARCHIVE_PATH/Products/Library/Frameworks/DoraemonKit.framework" \
  -output "$OUTPUT_XCFRAMEWORK"
```

注意：
- 若需开启可选模块（如 Logger、GPS、Load 等），请在打包前在对应 Target 的编译设置中加入所需依赖与预处理宏，生成不同变体的 xcframework。
- 资源需随框架或以资源 bundle 一并提供，确保运行时可被找到。

### 2. 打包与校验

```bash
zip -r DoraemonKit.xcframework.zip DoraemonKit.xcframework
swift package compute-checksum DoraemonKit.xcframework.zip
```

记录输出的 checksum。

### 3. 上传与替换 Package.swift

将 `DoraemonKit.xcframework.zip` 上传到你的可访问地址（建议 GitHub Release 或公司制品库），并在仓库根级 `Package.swift` 中替换：

- `url`: 你的下载链接
- `checksum`: 第 2 步计算得到的值

示例（已在根级 `Package.swift` 中）：

```swift
.binaryTarget(
    name: "DoraemonKit",
    url: "https://your.domain/path/DoraemonKit.xcframework.zip",
    checksum: "<REPLACE_WITH_swift_package_compute_checksum_OUTPUT>"
)
```

### 4. 在业务工程中使用

1) Xcode -> Project -> Package Dependencies -> “+” -> 选择本仓库（含上述 `Package.swift`）

2) 在目标 Target 的 `Frameworks, Libraries, and Embedded Content` 中勾选 `DoraemonKit`。

3) 按 DoKit iOS 文档进行初始化调用。

### 5. 常见问题

- 若需要分模块引入（如 Logger/Weex/Database 等），建议将相应功能在打包阶段固化到不同的 `xcframework` 变体，并在 `products` 中导出多个库供选择。
- `WithLoad` 模块依赖预编译 framework，SPM 仅能通过 `binaryTarget` 引入，建议与核心包分离为独立二进制库。


