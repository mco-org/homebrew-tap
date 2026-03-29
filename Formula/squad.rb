class Squad < Formula
  desc "Multi-AI-agent terminal collaboration daemon with MCP server and workflow engine"
  homepage "https://github.com/mco-org/squad"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-aarch64-apple-darwin.tar.gz"
      sha256 "6056bde0c5d712f301cf7c8ffbbf3e1a0b8e06e263b90ff1ae716ebeee3e09da"
    end

    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-apple-darwin.tar.gz"
      sha256 "62348df29f50d15a9973650862b7b2516e4f409b45704bd7b5f6274919794387"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e24088017691afa6c6b005cc396da6b8f844b386154e0f0e76ffa9ae5ce7d5fe"
    end
  end

  def install
    bin.install "squad"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/squad help")
  end
end
