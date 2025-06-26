# NetLens 📡

[![CI](https://github.com/sassiwalid/NetLens/blob/main/.github/workflows/badge.svg)](https://github.com/sassiwalid/NetLens/blob/main/.github/workflows/swift.yml)
[![Swift 6.0](https://img.shields.io/badge/Swift-6.0-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2017%2B%20|%20macOS%2014%2B-lightgrey.svg)](https://developer.apple.com)
[![Swift Testing](https://img.shields.io/badge/Testing-Swift%20Testing-blue.svg)](https://github.com/apple/swift-testing)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A modern Swift framework for intercepting and visualizing network calls in iOS and macOS applications with elegant SwiftUI interface.

## ✨ Features

- 🕵️ **Automatic Network Interception** - Captures all URLSession requests seamlessly
- 📱 **Shake to Inspect** - Shake your device to view network activity
- 🎯 **Floating Button** - Draggable floating button for easy access
- 🏗️ **Clean Architecture** - Domain-driven design with clear separation of concerns
- ⚡ **Swift 6 Native** - Built with latest Swift concurrency features
- 🧪 **Comprehensive Testing** - Full test coverage with Swift Testing framework
- 🎨 **SwiftUI Interface** - Modern, responsive UI components
- 📊 **Real-time Monitoring** - Live network call streaming and analytics

## 🚀 Swift 6 Powered

NetLens leverages the latest Swift 6 features for optimal performance and safety:

- ✅ **Strict Concurrency** - Thread safety by design
- ✅ **Actors** - Automatic data protection
- ✅ **Sendable** - Type-safe concurrency
- ✅ **@Observable** - Modern reactive programming (iOS 17+)
- ✅ **AsyncStream** - Efficient data streaming
- ✅ **Structured Concurrency** - Predictable async operations

## 📦 Installation

### Swift Package Manager

Add NetLens to your project in Xcode:

1. **File** → **Add Package Dependencies**
2. Enter the repository URL: `https://github.com/sassiwalid/NetLens.git`
3. Select the version you want to use

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/sassiwalid/NetLens.git", from: "1.0.0")
]
```

Requirements

iOS 17.0+ / macOS 14.0+
Xcode 16.0+
Swift 6.0+

🔧 Quick Start
Basic Setup
```swift

import NetLens

// In your AppDelegate or App.swift
#if DEBUG
NetLens.shared.enable()
#endif
```
## Contributing

1. Fork the repository
2. Create your feature branch (git checkout -b feature/amazing-feature)
3. Commit your changes (git commit -m 'Add amazing feature')
4. Push to the branch (git push origin feature/amazing-feature)
5. Open a Pull Request

## Code Style

1. Follow Swift API Design Guidelines
2. Use Swift 6 concurrency features
3. Maintain Clean Architecture principles
4. Write comprehensive tests
5. Document public APIs
## 📋 Roadmap

 - **Statistics Dashboard** - Network performance analytics
 - **Export Functionality** - Export calls to HAR format
 - **Custom Filters** - Advanced filtering options
 - **Mock Responses** - Response mocking for testing
 - **Network Conditions** - Simulate slow networks
 - **Anomaly Detection** - Automatic issue detection

## 🐛 Known Issues

Production Use: NetLens is designed for debugging only. Disable in production builds.
Memory Usage: Large numbers of network calls may impact performance.

## 📄 License
NetLens is available under the MIT license. See the LICENSE file for more info.
## 🙏 Acknowledgments

Swift Team for amazing concurrency features
SwiftUI for declarative UI framework
Community feedback and contributions
## 📞 Support

🐛 Bug Reports: GitHub Issues
💡 Feature Requests: GitHub Discussions
📧 Contact: contact@walidsassi.com


⭐ If NetLens helps you, please give it a star!
Made with ❤️ and Swift 6

