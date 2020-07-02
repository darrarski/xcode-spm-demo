# Xcode SPM Demo

Example Xcode project with SPM and CocoaPods dependencies.

## 🛠 Setup

### Requirements

- [Xcode](https://developer.apple.com/xcode/) 11.5
- [Ruby](https://www.ruby-lang.org/) with [Bundler](https://bundler.io/)

### How-To

1. Clone repository
2. Run `bundle install`
3. Run `bundle exec pod install`
4. Open `SPMDemo.xcworkspace` in Xcode
5. Build/Run/Test using provided shared build schemas

## 🧩 Modules

Following diagram explains how the project is structured:

```
+-----------+               +-------------------+
|    App    +---------------+      Commons      |
+---+---+---+               +---+---+---+---+---+
    ^   ^                       |   |   ^   ^
    |   |                       |   |   |   |
    |   |   +---------------+   |   |   |   |   +---------------+
    |   +---+   Feature A   +<--+   |   |   +---+   Library A   |
    |       +---------------+       |   |       +---------------+
    |                               |   |
    |                               |   |
    |       +---------------+       |   |       +---------------+
    +-------+   Feature B   +<------+   +-------+   Library B   |
            +---------------+                   +---------------+
```

Diagram element|Description
:--|:--
`[App]`|Main application target
`[Feature]`|Feature framework target
`[Commons]`|Shared framework target
`[Library]`|Third-party dependency
`[A]`←`[B]`|Module A requires module B

## 🧰 Third-party Dependencies

Third-party dependencies are available in the main app target, as well as in the feature framework targets. 

### Xcode's Swift Package Manager

Dependencies are added to `Commons` target as statically linked libraries.

### CocoaPods

Dependencies are added to `Commons` target as statically linked frameworks. All targets that use third-party pods (including unit tests targets) have CocoaPods integration enabled and inherits search paths from `Commons` target.

## 📄 License

Copyright © 2020 [Dariusz Rybicki Darrarski](http://www.darrarski.pl)

License: [GNU GPLv3](LICENSE)
