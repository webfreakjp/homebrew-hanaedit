# homebrew-hanaedit

HanaEdit の Homebrew tap です。

## インストール

```sh
brew tap webfreakjp/hanaedit
brew trust webfreakjp/hanaedit
brew install hanaedit
```

直接インストールする場合:

```sh
brew trust --formula webfreakjp/hanaedit/hanaedit
brew install webfreakjp/hanaedit/hanaedit
```

`Refusing to load formula ... from untrusted tap` と表示された場合は、上の
`brew trust` を実行してから再度 `brew install` してください。

インストール後の確認:

```sh
hanaedit --version
```

## Formula

Formula はこのリポジトリの [Formula/hanaedit.rb](Formula/hanaedit.rb) にあります。

HanaEdit 本体のリポジトリ:

```text
https://github.com/webfreakjp/hanaedit
```

## リリース手順

ここでは `v0.1.0` を例にします。バージョンを変える場合は、コマンド内の `0.1.0` も置き換えてください。

### 1. 本体リポジトリでバージョンを更新する

```sh
cd ../hanaedit
```

`Sources/HanaEdit/AppInfo.swift` の `version` を更新します。

```swift
static let version = "0.1.0"
```

動作確認します。

```sh
swift build -c release
.build/release/HanaEdit --version
```

commit して push します。

```sh
git add .
git commit -m "Release 0.1.0"
git push origin main
```

### 2. tag を作成して push する

```sh
git tag v0.1.0
git push origin v0.1.0
```

### 3. GitHub archive の sha256 を計算する

Formula の `sha256` は commit hash や tag hash ではなく、GitHub が配布する tarball の SHA-256 です。

tag を push したあとに計算します。

```sh
curl -L -o /tmp/hanaedit-v0.1.0.tar.gz \
  https://github.com/webfreakjp/hanaedit/archive/refs/tags/v0.1.0.tar.gz

shasum -a 256 /tmp/hanaedit-v0.1.0.tar.gz
```

出力された hash を控えます。

### 4. tap の Formula を更新する

```sh
cd ../homebrew-hanaedit
```

[Formula/hanaedit.rb](Formula/hanaedit.rb) の `url`、`sha256`、`test do` のバージョンを更新します。

```ruby
url "https://github.com/webfreakjp/hanaedit/archive/refs/tags/v0.1.0.tar.gz"
sha256 "..."

# ...

assert_match "HanaEdit 0.1.0", shell_output("#{bin}/hanaedit --version")
```

### 5. Formula をローカルで検証する

```sh
brew uninstall hanaedit 2>/dev/null || true
brew install --build-from-source ./Formula/hanaedit.rb
hanaedit --version
brew test ./Formula/hanaedit.rb
```

Formula として読めるかも確認します。

```sh
brew info --formula ./Formula/hanaedit.rb
```

### 6. tap を commit して push する

```sh
git add Formula/hanaedit.rb README.md
git commit -m "Update hanaedit to 0.1.0"
git push origin main
```

これで他の Mac から `brew update && brew upgrade hanaedit` または `brew install hanaedit` で使えるようになります。
