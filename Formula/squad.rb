class Squad < Formula
  desc "Multi-AI-agent terminal collaboration daemon with MCP server and workflow engine"
  homepage "https://github.com/mco-org/squad"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-aarch64-apple-darwin.tar.gz"
      sha256 "6fb4b5da946b94a8c24318fc5d790892ed73240ffc95072cfa4001d2a75040c8"
    end

    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-apple-darwin.tar.gz"
      sha256 "6f06707face5d4573b828e642527621c1ab2e478d7f0c075b1f9cdb52a7a6451"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e25096b4102fa82cee42b1a6cc07152f432a9d6fde5eeef7c3d93aa18cfcb138"
    end
  end

  def install
    bin.install "squad"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/squad help")
  end
end
