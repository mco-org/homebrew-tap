class Squad < Formula
  desc "Multi-AI-agent terminal collaboration daemon with MCP server and workflow engine"
  homepage "https://github.com/mco-org/squad"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-aarch64-apple-darwin.tar.gz"
      sha256 "c8285c591d6e7d3310c946f5e585c2e9ccd9bf6b5c50dcdf189933467e9de117"
    end

    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-apple-darwin.tar.gz"
      sha256 "f95f0641c3d7761dcd34ddef9e8e2caa4b70006a0dc6a5762aa5e473f7d2ca21"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mco-org/squad/releases/download/v#{version}/squad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "91e3f2c17a1b7e6b1d8254dec68c117e21ad82ddd11b1a35eaecaf7bc606076c"
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
