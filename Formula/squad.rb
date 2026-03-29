class Squad < Formula
  desc "Multi-AI-agent terminal collaboration daemon with MCP server and workflow engine"
  homepage "https://github.com/mco-org/squad"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-aarch64-apple-darwin.tar.gz"
      sha256 "46ff50ec378116fd5899a79aae7fdbede5b83bc90aefb405b355e9c8251765f3"
    end

    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-apple-darwin.tar.gz"
      sha256 "eb0488ef6583ca5998737b5ce1a3188dbd0a8b76b94cf7b43e2cb056475be029"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "51e1f2cf6ef907c01a59b7996aa2c34cf07c55b3c761f8c11c2e5f9b58655af2"
    end
  end

  def install
    bin.install "squad"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/squad help")
  end
end
