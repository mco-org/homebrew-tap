class Squad < Formula
  desc "Multi-AI-agent terminal collaboration daemon with MCP server and workflow engine"
  homepage "https://github.com/mco-org/squad"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-aarch64-apple-darwin.tar.gz"
      sha256 "f12b313a3adc5836551c1b3a59728595ee90d8de5b2bbca762826921ed991619"
    end

    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-apple-darwin.tar.gz"
      sha256 "6564a4fd0bc1517dfd1c578544281c315a68f91f180de3d4101feb9e6719cf0a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fede1b53bc9ddde2af10ce18f50bb6b6fc5c55eba72e95f7ede0f94577222460"
    end
  end

  def install
    bin.install "squad"
  end

  def caveats
    <<~EOS
      Slash commands are auto-installed when you run `squad init`.

      To remove slash commands before uninstalling:
        squad cleanup
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/squad help")
  end
end
