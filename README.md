## swasm
Tutorial: 
https://book.swiftwasm.org/getting-started

#### Some issues I encounter on the road:
1. unableToFind(tool: "swift-autolink-extract")

```console
mac@Ngocs-MacBook-Pro swift-wasm % swiftc -target wasm32-unknown-wasi hello.swift -o hello.wasm
error: unableToFind(tool: "swift-autolink-extract")
```

try to fix it:
```console
xcode-select -p
sudo xcode-select --switch /Library/Developer/CommandLineTools
swiftc -target wasm32-unknown-wasi hello.swift -o hello.wasm

// result
<unknown>:0: error: unable to load standard library for target 'wasm32-unknown-wasi'
```

I tried to run hello.swift file
```console
swift hello.swift

// it works, of course, nothing wrong with it
// Hello, Ngoc!
// Hello, Ngoc!!
```


... download another version
swift-wasm-5.8.0-RELEASE-macos_x86_64.pkg

```console
swiftc -target wasm32-unknown-wasi hello.swift -o hello.wasm
SwiftDriver/WebAssemblyToolchain+LinkerSupport.swift:126: Fatal error: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/wasi/static-executable-args.lnk not found
zsh: illegal hardware instruction  swiftc -target wasm32-unknown-wasi hello.swift -o hello.wasm
```

omg I exported wrong PATH
> the right way
```console
// open
open ~/.bash_profile

// new path
export PATH=/Library/Developer/Toolchains/swift-wasm-5.8.0-RELEASE.xctoolchain/usr/bin:"${PATH}"

// apply changes
source ~/.bash_profile

//re run
swiftc -target wasm32-unknown-wasi hello.swift -o hello.wasm
```

```console
wasmer hello.wasm
```

### another way using swift package manager:

```console
swift package init --type executable

swift build --triple wasm32-unknown-wasi

wasmer ./.build/debug/hello-swiftwasm.wasm
```

