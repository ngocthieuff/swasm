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