class Squad < Formula
  desc "Multi-AI-agent terminal collaboration daemon with MCP server and workflow engine"
  homepage "https://github.com/mco-org/squad"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-aarch64-apple-darwin.tar.gz"
      sha256 "b7c6a7f6a056a5620ea7442f5a7ce719e9a64e421ddb758a20fd83e75e910b2c"
    end

    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-apple-darwin.tar.gz"
      sha256 "0aec95891c37e8e073e54bbad101107da369e2ae1a318378037ffb01d554fd31"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0407968c64cd21198ffb175572594af1f47c442e743bdafd9e59172a62189f3a"
    end
  end

  def install
    bin.install "squad"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/squad help")
  end
end
