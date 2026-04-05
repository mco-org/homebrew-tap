class Squad < Formula
  desc "Multi-AI-agent terminal collaboration daemon with MCP server and workflow engine"
  homepage "https://github.com/mco-org/squad"
  version "0.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-aarch64-apple-darwin.tar.gz"
      sha256 "5d593ca60eae82b0222a42d27fea2ce4a1cf698923dd5156cf4b76da01464217"
    end

    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-apple-darwin.tar.gz"
      sha256 "2867ece4e09c12ce43115e07bea0b164e784247dbc319627b3fda320de8a6956"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "554023e10f4abf63edf2916b13f1560808e02f68c505b93bf85dd08259ca82d0"
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
