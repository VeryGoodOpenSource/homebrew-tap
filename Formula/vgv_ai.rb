# typed: false
# frozen_string_literal: true

# Configures the Very Good AI tooling for the coding agents on your machine.
class VgvAi < Formula
  desc "Configure Very Good AI coding agents and tooling"
  homepage "https://github.com/VeryGoodOpenSource/vgv_ai_cli"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.2.0/vgv_ai-0.2.0-macos-arm64.tar.gz"
      sha256 "fc718a58b6ba1731a50476eaf9317ebdea61d5366ba4f40e8b754513c4fc5eb9"
    end
    on_intel do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.2.0/vgv_ai-0.2.0-macos-x64.tar.gz"
      sha256 "fbf29e81270925f6f641f408dbbf99c3796af6d7bad19cbb9a0d48a0d7621801"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.2.0/vgv_ai-0.2.0-linux-arm64.tar.gz"
      sha256 "21e8bfff3595d37b120b1bdc22434fb39e93fad1b9393e8bb3da04d2ad298779"
    end
    on_intel do
      url "https://github.com/VeryGoodOpenSource/vgv_ai_cli/releases/download/v0.2.0/vgv_ai-0.2.0-linux-x64.tar.gz"
      sha256 "46d6d2efc748f2a0875dd3027caa1fa0c75e91a1725fccc76a7535f4f5131298"
    end
  end

  def install
    bin.install "vgv_ai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vgv_ai --version")
  end
end
