# Swift UI testing framework

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-success.svg)](https://github.com/Carthage/Carthage)

Provides a pluggable abstraction over XCUITest to allows changing UI test frameworks (like EarlGrey) without having to rewrite tests.

This only comes with a XCUITest driver. You need to bring your own `Driver` implementation to swap it out.

## Developing SwiftUITest

- `brew install carthage`
- `carthage bootstrap --no-build`

## Usage

Define a `Cartfile`

```
github "instructure/SwiftUITest" "master"
```

Reference `SwiftUITest.framework` built by Carthage.

- `Carthage/Build/iOS/SwiftUITest.framework`

## To Do

- [x] Move helper methods into SwiftUITest framework
- [x] Write tests for the helper methods using `EarlGrey/Tests/FunctionalTests`
- [ ] Update `canvas-ios` to use the new helpers
