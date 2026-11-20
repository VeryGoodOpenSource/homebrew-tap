# typed: false
# frozen_string_literal: true

# Configures the Very Good AI tooling for the coding agents on your machine.
class VgvAi < Formula
  desc "Configure Very Good AI coding agents and tooling"
  homepage "https://github.com/VeryGoodOpenSource/vgv_ai_cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.3.0/vgv_ai-0.3.0-macos-arm64.tar.gz"
      sha256 "27798eed314504f76f89dd69f008b4d80936275a6feb1b69b74d699d814e9192"
    end
    on_intel do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.3.0/vgv_ai-0.3.0-macos-x64.tar.gz"
      sha256 "dbb97d81b933b5c3652adf4d5d2bf1a3341504ed01d0068f7ac016199ec92cbd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.3.0/vgv_ai-0.3.0-linux-arm64.tar.gz"
      sha256 "2a37bc6a4aa2b2184bab70433a0681beac1fe4ab3cb23befc6601caa1b906785"
    end
    on_intel do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.3.0/vgv_ai-0.3.0-linux-x64.tar.gz"
      sha256 "4570af64c28805d26430615705a1162c4e392da3e16d97c9bc3e9ff2b78b20d0"
    end
  end

  def install
    bin.install "vgv_ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vgv_ai --version")
  end
end
