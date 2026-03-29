class Squad < Formula
  desc "Multi-AI-agent terminal collaboration daemon with MCP server and workflow engine"
  homepage "https://github.com/mco-org/squad"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-aarch64-apple-darwin.tar.gz"
      sha256 "66a045f41bbc7370f65ae3aeac54a543cd939473a680fcc6cb5e7480158203a7"
    end

    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-apple-darwin.tar.gz"
      sha256 "32431603b25ed703252aef0505b86e1714f0f48131dfb56d54851c0d10b8001b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "11e787448e608f7425f7ce930e832428095cc38aee7f262fbbfcf8da03277356"
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
