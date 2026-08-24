#!/usr/bin/env bash
# 一键构建 Android APK（在装好 Node 18+ 和 Android SDK 的 Linux/Mac/WSL 上运行）
# 产物：app-release.apk
# 用法：bash scripts/build-android.sh
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

echo "==> [1/4] 安装 npm 依赖"
npm install --no-audit --no-fund

echo "==> [2/4] Next.js 静态导出（out/）"
npx next build

echo "==> [3/4] Capacitor sync（复制 out/ 到 android assets）"
npx cap sync android

echo "==> [4/4] Gradle assembleRelease"
cd android
./gradlew assembleRelease --no-daemon --console=plain

APK=app/build/outputs/apk/release/app-release.apk
echo ""
echo "✅ 构建完成：$APK"
ls -la "$APK"
