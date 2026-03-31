class Squad < Formula
  desc "Multi-AI-agent terminal collaboration daemon with MCP server and workflow engine"
  homepage "https://github.com/mco-org/squad"
  version "0.7.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-aarch64-apple-darwin.tar.gz"
      sha256 "2556e453a322b8bb85b104bd6e454e322f8ea1200eaea6841911b6dcefdb9ce3"
    end

    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-apple-darwin.tar.gz"
      sha256 "e014c7ce364f6f3878a8d4b61b9a6e4e4c754ab66256154574dd940efcaedebb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b164c4349f23666a0a0d473d036cf62d6a3b08f439a94aa2dd9ebdb33f18f56c"
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
