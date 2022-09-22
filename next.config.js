import withBundleAnalyzer from "@next/bundle-analyzer";
import withPreact from "next-plugin-preact"

export const nextConfig = withBundleAnalyzer(withPreact({
  target: "serverless"
}))
