## Build

### Android

#### APK

##### Split bundle & remove heavy package

`flutter build apk --split-per-abi --target-platform android-arm64 --analyze-size`

#### AppBundle

##### Remove heavy package

`flutter build appbundle --target-platform android-arm64 --analyze-size`

### IOS

#### tree-shake-icons

`flutter build ios --release --tree-shake-icons --analyze-size`

### deferred component

[link](https://docs.flutter.dev/perf/deferred-components)
