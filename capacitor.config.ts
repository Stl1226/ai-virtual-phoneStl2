import type { CapacitorConfig } from "@capacitor/cli";

// Capacitor 配置：把静态导出的 Next.js 站点打包成 Android APP。
// webDir 指向 next build 的静态输出目录 out/，cap sync 会把它复制进 Android assets。
const config: CapacitorConfig = {
  appId: "com.aivp.app",
  appName: "AI Virtual Phone",
  webDir: "out",
  backgroundColor: "#000000",
  android: {
    // 让 WebView 允许混合内容（http:// LLM API），并允许跨域 fetch
    allowMixedContent: true,
    // WebView 调试：发布时可改 false
    webContentsDebuggingEnabled: false,
  },
  server: {
    // 使用 capacitor://localhost 作为 origin，本地 assets 优先加载
    androidScheme: "https",
  },
};

export default config;
